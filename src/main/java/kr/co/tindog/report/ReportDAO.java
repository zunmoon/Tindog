package kr.co.tindog.report;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> report(String nickname) {
		return sqlSession.selectList("report.report", nickname);
	}
	
	public int reportInsert(ReportDTO reportDto) {
		return sqlSession.insert("report.insert", reportDto);
	}
	
	public List<Map<String, Object>> report2(String nickname) {
		return sqlSession.selectList("report.report2", nickname);
	}
	
	public int reportInsert2(ReportDTO reportDto) {
		return sqlSession.insert("report.insert2", reportDto);
	}
}
