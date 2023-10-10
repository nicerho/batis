package batis;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class webpage3 {
	@Inject
	private SqlSessionFactory factory;
	private MemberDTO dto;

	@RequestMapping("/searchUser.do")
	public String searchUser() {
		String userId = "hanpak33";
		SqlSession ss = factory.openSession();
		dto = ss.selectOne("reviewDB.searchUser", userId);
		System.out.println(dto.getMid() + " " + dto.getMemail());
		return "";
	}

	@RequestMapping("/searchUser2.do")
	public String searchUser2() {
		String data = "hanpak33";
		String part = "1";
		SqlSession ss = factory.openSession();
		Map<String, String> map = new HashMap<>();
		// part 1 : 아이디 2 : 이메일 3: 연락처 4: 복합적인 조건, 두 조건을 모두 충족할때 (연락처,지역)
		map.put("data", data);
		map.put("data", "wwms@nate.com");
		map.put("part", part);
		map.put("part", "2");
		map.put("part", "4");
		map.put("data", "5684");
		map.put("area", "3");
		dto = ss.selectOne("reviewDB.searchUser2", map);
		System.out.println(dto.getMid() + " " + dto.getMtel());
		return "";
	}

	@RequestMapping("/searchUser3.do")
	public void searchUser3() {
		SqlSession ss = factory.openSession();
		Map<String, String> map = new HashMap<>();
		String data1 = "wwms123";
		String data2 = "a1234";
		String part = "login"; // login, id중복체크
		map.put("userId", data1);
		map.put("userPw", data2);
		map.put("part", part);
		dto = ss.selectOne("reviewDB.searchUser3", map);
		System.out.println(dto.getMid()+" "+dto.getMemail());
		
	}

}
