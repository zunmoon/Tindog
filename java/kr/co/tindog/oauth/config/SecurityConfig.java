package kr.co.tindog.oauth.config;

import static org.springframework.security.web.util.matcher.AntPathRequestMatcher.antMatcher;

import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.config.annotation.web.configurers.oauth2.client.OAuth2LoginConfigurer.UserInfoEndpointConfig;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Configuration
@EnableWebSecurity
@Log4j2
public class SecurityConfig{
	
	public void configure(WebSecurity web) throws Exception{
		web.httpFirewall(defaultHttpFirewall());
	}
	 
	@Bean
	public HttpFirewall defaultHttpFirewall() {
	    return new DefaultHttpFirewall();
	}

	
	//해당 메서드의 리턴되는 오브젝트를 IoC로 등록해준다.
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		http
			.csrf((csrf)->csrf.disable())
			.authorizeHttpRequests((requests)-> requests				
					.requestMatchers(antMatcher("/user/**")).authenticated()
					.requestMatchers(antMatcher("/manager/**")).hasRole("MANAGER")
					.requestMatchers(antMatcher("/admin/**")).hasRole("ADMIN")
					.anyRequest().permitAll()
			)
			.formLogin((formlogin)-> formlogin
					.loginPage("/login")
					.loginProcessingUrl("/login")
					.successForwardUrl("/")
					.failureForwardUrl("/login")
			)
			.oauth2Login((oauth)-> oauth
					.loginPage("/login")
					.userInfoEndpoint(UserInfoEndpointConfig -> UserInfoEndpointConfig
							.userService(principalOauth2UserService)					
					)					

			)
			.logout((logout->logout
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JESSIONID")
			)
		);			
			
			return http.build();
		
	}
	
}
