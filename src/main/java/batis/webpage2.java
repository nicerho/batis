package batis;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class webpage2 {
	private MemberDTO md;
	@Resource(name = "filem")
	private FileModule fm;

	@PostMapping("/pay2.do")
	public String pay2(@RequestParam(required = false) String product_name,
			@RequestParam(required = false) String product_money, @RequestParam(required = false) String product_code,
			@RequestParam(required = false) String product_ea, Model model) {
		// addAllAttributes : 컬렉션 형태로 보낼때 사용
		Collection<String> list = new ArrayList<>();
		list.add(product_code);
		list.add(product_name);
		list.add(product_money);
		list.add(product_ea);
		model.addAllAttributes(Arrays.asList(list));

		return "pay2";
	}

	@PostMapping("/pay3.do")
	public String pay3(@ModelAttribute("data") paydto pd, HttpServletRequest req) {
		req.setAttribute("goodcode", pd.getGoodcode());
		req.setAttribute("price", pd.getPrice());
		req.setAttribute("buyeremail", pd.getBuyeremail());
		req.setAttribute("buyername", pd.getBuyername());
		req.setAttribute("goodea", pd.getGoodea());
		req.setAttribute("goodname", pd.getGoodname());
		req.setAttribute("gopaymethod", pd.getGopaymethod());
		req.setAttribute("rec_addr", pd.getRec_addr());
		req.setAttribute("rec_post", pd.getRec_post());
		req.setAttribute("rec_addr_dtc", pd.getRec_addr_dtc());
		req.setAttribute("buyertel", pd.getBuyertel());
		req.setAttribute("point", pd.getPoint());
		return "pay3";
	}

	@RequestMapping("fileview")
	public String fileView(Model model) {
		List<FileVO> list = fm.selectAll();
		model.addAttribute("list", list);
		return "/WEB-INF/fileView";
	}

	@Resource(name = "members")
	MemberModule mm;

	@PostMapping("idcheck")
	public String idCheck(Model model, @RequestParam String userid) {

		try {
			md = mm.searchId(userid);
			if (md == null) {
				model.addAttribute("mid", "no");

			} else {
				model.addAttribute("mid", "yes");

			}
		} catch (NullPointerException ne) {
			model.addAttribute("mid", "error");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "/WEB-INF/jsp/IdCheck";
	}

	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("index", "index");
		top(model);
		foot(model);
		return "index";
	}

	@RequestMapping("/top")
	public String top(Model model) {
		model.addAttribute("top", "top2");
		return "top";
	}

	@RequestMapping("/subpage")
	public String sub(Model model) {
		model.addAttribute("sub", "sub");
		return "subpage";
	}

	@RequestMapping("/footer")
	public String foot(Model model) {
		model.addAttribute("footer", "footer2");
		return "footer";
	}

	@RequestMapping("/ftpcon")
	public String ftpcon(HttpServletRequest req, MultipartFile mfile, Model model) {
		FTPClient ftp = new FTPClient();
		ftp.setControlEncoding("utf-8");
		String filename = mfile.getOriginalFilename();
		FTPClientConfig cf = new FTPClientConfig();
		try {
			InetAddress inet = Inet4Address.getLocalHost();
			String ip = inet.getHostAddress();
			String host = "iup.cdn1.cafe24.com";
			String user = "wjswjdgh123";
			String pass = "qlalfqjsgh1@";
			int port = 21;
			ftp.configure(cf);
			;
			ftp.connect(host, port);
			if (ftp.login(user, pass)) {
				ftp.setFileType(FTP.BINARY_FILE_TYPE);
				int rp = ftp.getReplyCode();

				boolean result = ftp.storeFile("/www/img/" + filename, mfile.getInputStream());

				if (result == true) {
					String url = "http:// wjswjdgh123.cdn1.cafe24.com/img/" + filename;
					model.addAttribute("img", url);
				}

				/*
				 * 파일 삭제 boolean delete = ftp.deleteFile("/www/img/"+filename);
				 * 
				 */
			} else {
				System.out.println("error");
			}
			ftp.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	@PostMapping("/ajax.do")
	public String ajax(@RequestParam(required=false) String userid,Model model) {
		System.out.println(userid);
		model.addAttribute("mid",userid);
		return "ajax";
	}
}
