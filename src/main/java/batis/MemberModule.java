package batis;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("members")
public class MemberModule {
	@Resource(name = "sqlsession")
	private SqlSessionTemplate tm;

	public MemberDTO searchId(String parameter) {
		MemberDTO md = tm.selectOne("reviewDB.searchId", parameter);
		
		return md;
	}
}
