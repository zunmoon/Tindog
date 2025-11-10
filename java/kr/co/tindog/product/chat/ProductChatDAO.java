package kr.co.tindog.product.chat;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductChatDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> chatLogs(int proomno) {
		return sqlSession.selectList("productchat.chatLogs", proomno);
	}
	
	public int chatInsert(ProductChatDTO chatDto) {
		return sqlSession.insert("productchat.chatLogInsert", chatDto);
	}
}
