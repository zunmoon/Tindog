package kr.co.tindog.dogType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DogTypeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int check(String dogtype) {
		return sqlSession.selectOne("dogtype.check", dogtype);
	}
	
	public int insert(String dogtype) {
		return sqlSession.insert("dogtype.insert", dogtype);
	}
}
