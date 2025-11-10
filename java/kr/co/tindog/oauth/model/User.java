package kr.co.tindog.oauth.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username; //kakao_토큰 sub 값 중복될 일 없음
	private String password; //암호화()
	private String email;	//이메일은 소셜로그인 이메일 그대로
	private String role;	//role="user"
	
	private String provider;	//kakao or naver
	private String providerID;	//토큰 sub값
	
	@Builder
	public User(String username, String password, String email, String role, String provider, String providerID
			) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
		this.provider = provider;
		this.providerID = providerID;
	}

}
