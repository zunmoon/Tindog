package kr.co.tindog.report;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportListDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> list() {
		return sqlSession.selectList("report.list");
	}
	
	public List<Map<String, Object>> list2() {
		return sqlSession.selectList("report.list2");
	}
	
	public String susCheck(String email) {
		return sqlSession.selectOne("report.susCheck", email);
	}
	
	public int suspended(String email) {
		return sqlSession.update("report.suspended", email);
	}
	
	public int susTot(String email) {
		return sqlSession.update("report.susTot", email);
	}
	
	public int suspended2(String email) {
		return sqlSession.update("report.suspended2", email);
	}
	
	public int kick(String email) {
		return sqlSession.update("report.kick", email);
	}

}
