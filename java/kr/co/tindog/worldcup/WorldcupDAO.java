package kr.co.tindog.worldcup;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorldcupDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public List<Map<String, Object>> worldcupImgList(String email) {
		
		return sqlSession.selectList("worldcup.worldcupImgList", email);
		
	}//worldcupImgLIst end
	

	public List<Map<String, Object>> worldcupOptionList(DogDTO dto){
		
		return sqlSession.selectList("worldcup.worldcupOptionList", dto);
		
	}
  
	public List<Map<String, Object>> worldcupWinner(String email) {
		
		return sqlSession.selectList("worldcup.worldcupWinner", email);
		
	}
	
	public int FollowInsert(Map<String, String> emails) {

		return sqlSession.insert("worldcup.followInsert",emails);
	}


	public List<Object> dupCheck(Map<String, String> emails) {
		return sqlSession.selectList("worldcup.dupCheck", emails);
	}
	
	public List<Map<String, Object>> idelResult(String email){
		return sqlSession.selectList("worldcup.idelResult", email);
	}
	
}//class end
