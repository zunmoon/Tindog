package kr.co.tindog.management;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.tindog.member.UserDTO;

@Repository
public class ManagementDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> list(HashMap<String, Object> map) {
		return sqlSession.selectList("management.list", map);
	}
	
	public int totalRowCount(String email) {
		return sqlSession.selectOne("management.totalRowCount", email);
	}
	
	public int update(UserDTO userDto) {
		return sqlSession.update("management.update", userDto);
	}

	public List<Map<String, Object>> search(String userSearch) {
		return sqlSession.selectList("management.search", userSearch);
	}
}//class end
