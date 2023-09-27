package batis;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class webpage2 {
	private MemberDTO md;
	@Resource(name = "filem")
	private FileModule fm;

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
}
