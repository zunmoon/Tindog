package kr.co.tindog.dbti;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DbtiDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int dbtiInsert(DbtiDTO dbtiDto) {
		return sqlSession.insert("dbti.dbtiInsert", dbtiDto);
	}
	
	public List<DbtiDTO> dbtiList(String email){
		return sqlSession.selectList("dbti.dbtiList", email);
	}
	
	public int dbtiUpdate(DbtiDTO dbtiDto) {
		return sqlSession.update("dbti.dbtiUpdate", dbtiDto);
	}	
}
