package batis;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.UUID;
import java.util.Vector;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class webpage {
	dataVO datavo = new dataVO();
	@Autowired // xml에 등록된 bean에 대한 id값을 가져올 때 사용
	BasicDataSource datasource;// xml에 매핑된걸 가져오기
	@Inject // xml에 대한 데이터를 가져올떄 사용하는 의존성주입
	private SqlSessionFactory sqlsessionfactory;
	@Resource // @Autowired 의 확장정도로 생각핮다
	private SqlSessionTemplate sqlsession;

	@RequestMapping("login.do")
	public String login() {
		try {
			Connection con = datasource.getConnection();
			String sql = "select count(*) as cnt from air_reserve";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String result = rs.getString("cnt");
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/WEB-INF/jsp/login";
	}

	@RequestMapping("dataInsert.do") // @ModelAttribute : parameter, method에 쓰일수 잇고 vo,dto형태 구성이 원칙 해당 name값을 vo,dto에
										// 동일하게 세팅하고
	// DB에 컬럼명과 동일할 경우 요청한 값을 모두 db에 저장
	public String dataInsert(@ModelAttribute("review") dataVO datavo) throws Exception {
		SqlSession se = sqlsessionfactory.openSession();
		int a = se.insert("reviewDB.review_insert", datavo);
		if (a > 0) {
			System.out.println("성공");
		} else {
			System.out.println("error");
		}
		se.close();
		return "/WEB-INF/jsp/login";
	}

	@RequestMapping("dataSelect.do")
	public String dataSelect(@ModelAttribute("review") dataVO datavo, Model model) throws Exception {
		SqlSession se = sqlsessionfactory.openSession();
		datavo = se.selectOne("reviewDB.selectCount");
		System.out.println(datavo.getCnt());
		se.close();
		return null;
	}

	@RequestMapping("reviewList.do")
	public String reviewList(Model model, @RequestParam(defaultValue = "0") int ridx,
			@RequestParam(required = false) String search) {
		List<dataVO> data = null;
		try {
			SqlSession se = sqlsessionfactory.openSession();
			String ct = se.selectOne("reviewDB.selectCount");
			if (ridx < 2) {
				ridx = 0;
			} else {
				int total = Integer.parseInt(ct);
				ridx = ((ridx - 1) * 2);
			}
			if (search == null || search == "null" || search == "") {
				data = se.selectList("reviewDB.selectall", ridx);
			} else {
				data = se.selectList("reviewDB.selectSearch", search);
				if (data.size() == 0) {

				}
			}
			model.addAttribute("data", data);
			model.addAttribute("search", search);
			model.addAttribute("cnt", ct);
			se.close();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "/WEB-INF/jsp/ReviewList";
	}

	@RequestMapping("reviewDelete.do")
	public String deleteReview(@RequestParam(required = false) String ridx) {
		SqlSession se = sqlsessionfactory.openSession();
		PrintWriter pw = null;
		int a = 0;
		try {

			a = se.delete("reviewDB.deleteById", ridx);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			se.close();
		}
		return "/WEB-INF/jsp/ReviewList";
	}

	@GetMapping("reviewModify.do")
	public String modifyReview(@RequestParam(required = false) String ridx, Model model) {
		SqlSession se = sqlsessionfactory.openSession();
		try {
			datavo = se.selectOne("reviewDB.selectOne", ridx);
			if (datavo.getRidx().equals(ridx)) {
				model.addAttribute("data", datavo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			se.close();
		}
		return "/WEB-INF/jsp/reviewEdit";
	}

	@PostMapping("dataModify.do")
	public RedirectView dataModfiy(@ModelAttribute("review") dataVO datavo) throws Exception {
		SqlSession se = sqlsessionfactory.openSession();
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("http://localhost:8080/batis/reviewList.do");
		int a = se.update("reviewDB.updateById", datavo);
		System.out.println(a);
		se.close();
		return redirectView;
	}

	@PostMapping("fileUpload")
	public void fileUpload(@RequestParam MultipartFile[] mfile, HttpServletRequest req)
			throws IOException, InterruptedException {
		String dir = req.getServletContext().getRealPath("/files/");
		//String extension = StringUtils.getFilenameExtension(mfile[0].getOriginalFilename()); 확장자 가져오기
		UUID uuid = null;
		String name = null;
		String extension = null;
		List<String> list = new Vector<>();
		for (int x = 0; x < mfile.length; x++) {
			uuid = UUID.randomUUID();
			extension = "."+StringUtils.getFilenameExtension(mfile[x].getOriginalFilename());
			name = uuid.toString()+extension;
			FileCopyUtils.copy(mfile[x].getBytes(),new File(dir+name));
			list.add("./files/"+name);
		}
		SqlSession se = sqlsessionfactory.openSession();
		int a = se.insert("reviewDB.fileInsert",list.toString());
	}
}
