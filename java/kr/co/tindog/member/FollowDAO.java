package kr.co.tindog.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> followList(String email) {
		return sqlSession.selectList("user.followList", email);
	}
	
	public int followCancel(String email) {
		return sqlSession.delete("user.followDelete", email);
	}
}
