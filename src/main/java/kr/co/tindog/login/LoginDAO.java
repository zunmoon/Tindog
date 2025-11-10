package kr.co.tindog.login;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.tindog.login.LoginDTO;

@Repository
public class LoginDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public LoginDTO login(LoginDTO loginDto) {
		return sqlSession.selectOne("login.login", loginDto);
	}
	
	public FindDTO findid(FindDTO findDto) {
		return sqlSession.selectOne("login.findid",findDto);
	}
	
	public FindDTO findpw(FindDTO findDto) {
		return sqlSession.selectOne("login.findpw", findDto);
	}
	
	public int pwUpdate(FindDTO findDto) {
		return sqlSession.update("login.pwUpdate", findDto);
	}
}//class end
