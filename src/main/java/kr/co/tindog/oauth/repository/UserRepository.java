package kr.co.tindog.oauth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.co.tindog.oauth.model.User;

//CRUD 함수를 JpaRepository가 들고 있음
//@Repository라는 어노테이션이 없어도 됌. JpaRepository 상속했기 때문에
public interface UserRepository extends JpaRepository<User, Integer>{
	//findBy규칙 -> Username문법
	//select * from user where username=?
	public User findByUsername(String username);
}
