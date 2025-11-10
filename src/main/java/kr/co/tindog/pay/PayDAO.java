package kr.co.tindog.pay;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int payInsert(payDTO dto) {
		return sqlSession.insert("pay.insertPay", dto);
	}//insert() end
	


}//class end
