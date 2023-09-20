package batis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Optional;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class webpage {
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
		return "/WEB-INF/jsp/login";
	}

	@RequestMapping("dataSelect.do")
	public String dataSelect(@ModelAttribute("review") dataVO datavo,Model model) throws Exception{
		SqlSession se = sqlsessionfactory.openSession();
		datavo = se.selectOne("reviewDB.selectCount");
		System.out.println(datavo.getCnt());
		return null;
	}
}
