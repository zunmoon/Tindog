package kr.co.tindog.cut;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CutDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> cutList(String s_email) {
		return sqlSession.selectList("cut.cutList", s_email);
	}
	
	public List<Map<String, Object>> cutPList(String s_email) {
		return sqlSession.selectList("cut.cutPList", s_email);
	}
	
	public int cutCancel(CutDTO cutDto) {
		return sqlSession.delete("cut.cutCancel", cutDto);
	}
}
