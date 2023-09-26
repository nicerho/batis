package batis;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("filem")
public class FileModule {
	@Resource(name = "sqlsession")
	private SqlSessionTemplate session;
	public List<FileVO> selectAll() {
		List<FileVO> fv = session.selectList("reviewDB.selectAllFile");
		return fv;
	}
}
