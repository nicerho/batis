package batis;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class webpage2 {
	@Resource(name="filem")
	private FileModule fm;
	@RequestMapping("fileview")
	public String fileView(Model model) {
		List<FileVO> list = fm.selectAll();
		model.addAttribute("list",list);
		return "/WEB-INF/fileView";
	}
}
