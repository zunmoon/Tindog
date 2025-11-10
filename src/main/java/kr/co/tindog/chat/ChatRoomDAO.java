package kr.co.tindog.chat;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.tindog.cut.CutDTO;

@Repository
public class ChatRoomDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public String getNickname(String followemail) {
		return sqlSession.selectOne("chat.search", followemail);
	}
	
	public int chatRoomCheck(ChatRoomDTO dto) {
		return sqlSession.selectOne("chat.chatRoomCheck", dto);
	}
	
	public int checkGum(String s_nickname) {
		return sqlSession.selectOne("chat.checkGum", s_nickname);
	}
	
	public int useGum(String s_nickname) {
		return sqlSession.update("chat.useGum", s_nickname);
	}
	
	public int chatRoomInsert(ChatRoomDTO dto) {
		return sqlSession.insert("chat.chatRoomInsert", dto);
	}
	
	public List<Map<String, Object>> chatList(String nickname) {
		return sqlSession.selectList("chat.roomList", nickname);
	}
	
	public int chatRoomDelete(int droomno) {
		return sqlSession.delete("chat.chatRoomDelete", droomno);
	}
	
	public List<Map<String, Object>> findDogName(String s_nickname) {
		return sqlSession.selectList("chat.findDogName", s_nickname);
	}
	
	public String findEmail(String nickname) {
		return sqlSession.selectOne("chat.findEmail", nickname);
	}
	
	public int cut(CutDTO cutDto) {
		return sqlSession.insert("chat.cut", cutDto);
	}
	
	public int cutP(CutDTO cutDto) {
		return sqlSession.insert("chat.cutP", cutDto);
	}
}
