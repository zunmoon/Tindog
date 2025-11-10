package kr.co.tindog.chat;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> chatLogs(int droomno) {
		return sqlSession.selectList("chat.chatLogs", droomno);
	}
	
	public int chatInsert(ChatDTO chatDto) {
		return sqlSession.insert("chat.chatLogInsert", chatDto);
	}
	
	public String findDogName(String s_email) {
		return sqlSession.selectOne("chat.findDogName2", s_email);
	}
}
