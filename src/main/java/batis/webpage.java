package batis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class webpage {
	@Autowired//xml에 등록된 bean에 대한 id값을 가져올 때 사용
	BasicDataSource datasource;//xml에 매핑된걸 가져오기
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
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/WEB-INF/jsp/login";
	}
	@RequestMapping("dataInsert.do")
	public String dataInsert() {
		
		
		return "/WEB-INF/jsp/login";
	}
}
