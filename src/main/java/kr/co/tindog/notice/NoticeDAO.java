package kr.co.tindog.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository 
public class NoticeDAO {

	public NoticeDAO() {
		System.out.println("NoticeDAO() 객체 생성됨");
	}// end
	
	
	@Autowired
	SqlSession sqlSession;
	
	public void insert(Map<String, Object>map) {
		sqlSession.insert("notice.insert", map);
	}
	
	
	public List<Map<String, Object>> list(HashMap<String, Object>map) {
		return sqlSession.selectList("notice.list",map);
	}// list() end
	
	
	public int Rowcnt() {
		return sqlSession.selectOne("notice.count");		
	}//RowCount() end  
	
		
	public Map<String, Object>detail(int noticeno) {
		return sqlSession.selectOne("notice.detail", noticeno);
	}// detail() end
	
	
	

	public void delete(int noticeno) {
		sqlSession.delete("notice.delete", noticeno);
	} // delete() end
	

	
	public void update(Map<String, Object> map) {
		sqlSession.update("notice.update", map);
	}// update() end



	
	
}// class end



