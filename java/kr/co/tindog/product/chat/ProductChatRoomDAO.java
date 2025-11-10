package kr.co.tindog.product.chat;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.tindog.chat.ChatRoomDTO;

@Repository
public class ProductChatRoomDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int chatRoomCheck(ProductChatRoomDTO dto) {
		return sqlSession.selectOne("productchat.chatRoomCheck", dto);
	}
	
	public int chatRoomInsert(ProductChatRoomDTO dto) {
		return sqlSession.insert("productchat.chatRoomInsert", dto);
	}
	
	public List<Map<String, Object>> chatList(String nickname) {
		return sqlSession.selectList("productchat.roomList", nickname);
	}
	
	public int chatRoomDelete(int proomno) {
		return sqlSession.delete("productchat.chatRoomDelete", proomno);
	}
}
