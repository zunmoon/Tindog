package kr.co.tindog.login;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import kr.co.tindog.member.MemberDAO;

@RestController
public class LoginCont {
	
	@Autowired
	LoginDAO loginDAO;
	
	@RequestMapping("/tt")
	public ModelAndView test() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/test2");
		return mav;
	}

	@RequestMapping("/findIdpw")
	public ModelAndView find() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/member/findIdpw");
		return mav;
	}
	
	@RequestMapping("/findidResult")
	@ResponseBody
	public ModelAndView findidResult(@ModelAttribute FindDTO findDto ,@RequestParam String member_name, @RequestParam String member_phone) {
		ModelAndView mav=new ModelAndView();
		
		findDto.setName(member_name);
		findDto.setPhone(member_phone);
		
		FindDTO findid=loginDAO.findid(findDto);
				
		System.out.println(findid.getEmail());
		String email = findid.getEmail();
		if(email!=null || email.isEmpty()) {
			System.out.println(email);
		mav.addObject("email", email);	
		mav.setViewName("layout/member/findidResult");
		} else {
			mav.setViewName("layout/member/findidResultFail");
		}
		
		return mav;
	}
	
	@RequestMapping("/findpwResult")
	@ResponseBody
	public ModelAndView findpwResult(@ModelAttribute FindDTO findDto, @RequestParam String member_name, @RequestParam String member_email) throws MessagingException  {
		ModelAndView mav=new ModelAndView();
	
		findDto.setName(member_name);
		findDto.setEmail(member_email);
			
		FindDTO findpw=loginDAO.findpw(findDto);
		
		if(findpw!=null) {			
			
			char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
	                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
			String password="";
			int idx=0;
			for(int i=0; i<10; i++) {
				idx=(int)(charSet.length*Math.random());
				password+=charSet[idx];
			}
			
			findDto.setPassword(password);
			
			int updatepw=loginDAO.pwUpdate(findDto);
			

			
			String mailServer = "mw-002.cafe24.com"; //메일서버
			Properties props = new Properties();
			props.put("mail.smtp.host", mailServer);
			props.put("mail.smtp.auth", true);
			
			//3)메일서버에서 인증받은 계정+비번
			Authenticator myAuth = new MyAuthenticator();
			
			//4) 2)와 3)이 유효한지 검증
			Session sess = Session.getInstance(props, myAuth);
			//out.print("메일 서버 인증 성공!!");
			
			//5 메일 보내기
			
			String to		=member_email;
			String from		="tindog@gmail.com";
			String subject 	="tindog 임시 비밀번호 발급 안내";
			String content  ="";
			
			//엔터 및 특수문자 변경
			//content=Utility.convertChar(content);
			
			//표작성
			content += "<hr>";
			content += "	 <h1>"+ member_name+"님 임시 비밀번호 안내 드립니다</h1>";
			content += "	 <h1>비밀번호 : " + password + "</h1>";
			content += "	 <h1> 안내 드린 비밀번호로 다시 로그인 바랍니다. </h1>";
			content += "<hr>";
			
			
			//받는 사람 이메일 주소
			InternetAddress[] address = {new InternetAddress(to)};
														
			/*  
				수신인이 여러명일 경우
				InternetAddress[] address = { new InternetAddress(to1),
											  new InternetAddress(to2),
											  new InternetAddress(to3), ~~~};													};
			*/
			//메일 관련 정보 작성å
			Message msg = new MimeMessage(sess);
			
			
			//받는 사람
			msg.setRecipients(Message.RecipientType.TO, address);
			//참조	   Message.RecipientType.CC
			//숨은참조   Message.RecipientType.BCC
			
			//보내는 사람
			msg.setFrom(new InternetAddress(from));
			//메일 제목
			msg.setSubject(subject);
			
			//메일 내용
			msg.setContent(content, "text/html; charset=UTF-8");
			
			//메일 보낸날짜
			msg.setSentDate(new Date());
			
			
			//메일 전송
			Transport.send(msg);
			
			//out.print(to+"님에게 메일이 발송되었습니다");
			
			/*
    		mav.addObject("msg1", "<img src='../images/logo_itwill.png'>");
    		mav.addObject("msg2", "<p>주문이 완료되었습니다</p>");    		
    		mav.addObject("msg3", "<p><a href='/product/list'>[계속쇼핑하기]</a></p>");
			*/
			
			
			
			
			mav.addObject("email", findDto.getEmail());
			mav.addObject("password", password);
			mav.setViewName("layout/member/findpwResult");				
		}else {
			mav.setViewName("layout/member/findpwResultFail");
			return mav;
		}
		
		return mav;
	}
	
	//http://localhost:2000/login 
	//로그인 페이지 
	@GetMapping("login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/member/login");
		return mav;
	}
	
	@RequestMapping("/logOut")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("s_email");
		session.removeAttribute("s_nickname");
		session.removeAttribute("s_grade");
		session.removeAttribute("s_gumqty");
		mav.setViewName("layout/home");
		
		return mav;
	}//logout end
	
	@RequestMapping(value = "/loginResult", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ModelAndView loginProc(@ModelAttribute LoginDTO loginDTO, 
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		//System.out.println(loginDAO.login(loginDTO));
		//System.out.println(loginDAO.login(loginDTO).getNickna
		
		 LoginDTO result = loginDAO.login(loginDTO);
		
		    if(result != null && result.getEmail() != null) {
		    	if(result.getMemgrade().equals("F")) {
		    		// 탈퇴했거나 강제탈퇴된 회원
		    		session.setAttribute("s_grade", result.getMemgrade());
		    		System.out.println("로그인 실패");
			        mav.setViewName("layout/member/loginFail");
		    	}else {
		    		// 로그인 성공 시
		    		session.setAttribute("s_email", result.getEmail());
			        session.setAttribute("s_nickname", result.getNickname());
			        session.setAttribute("s_grade", result.getMemgrade());
			        System.out.println((String)session.getAttribute("s_grade"));
			        session.setAttribute("s_gumqty", result.getGumqty());
			        System.out.println("로그인 성공");
			        System.out.println(result);
			        mav.setViewName("layout/home");
		    	}
		    } else {
		        // 로그인 실패 시
		        System.out.println("로그인 실패");
		        mav.setViewName("layout/member/loginFail");
		    }
		    return mav;
	}//loginProc end
	
	
	
	
	
	
	
}//class end
