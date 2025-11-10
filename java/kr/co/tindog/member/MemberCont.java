package kr.co.tindog.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.tindog.oauth.model.*;
import kr.co.tindog.worldcup.WorldcupDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.core.model.Model;

import org.springframework.security.oauth2.client.userinfo.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.tindog.dbti.DbtiDAO;
import kr.co.tindog.dbti.DbtiDTO;
import kr.co.tindog.oauth.config.PrincipalOauth2UserService;

@RestController
public class MemberCont {

	@Autowired
	MemberDAO memberDao;	
	PrincipalOauth2UserService PO;
	User user;
	DbtiDAO dbtiDao;

	@RequestMapping("register")
	public ModelAndView register() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/register");
		mav.addObject("list", memberDao.dogType());
		return mav;
	}
	
	@RequestMapping("register/dog")
	public ModelAndView dogregister() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/dogregister");
		return mav;
	}
	
	@RequestMapping("register/nickCheck")
	public ModelAndView nickCheck() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/nickCheckForm");
		return mav;
	}
	
	@RequestMapping("register/nickDupCheck")
	@ResponseBody
	public Map<String, Object> nickDupCheck(@RequestParam String nickname) {
		 Map<String, Object> response = new HashMap<>();
		System.out.println(nickname);
		//mav.setViewName("layout/nickCheckForm");
		
		String dupCheck = memberDao.nickDupCheck(nickname);
		System.out.println(dupCheck);
		//String msg = "";
		
		if(dupCheck == null || dupCheck.isEmpty()) {
	
			response.put("result", 1);
		}else {
	
			response.put("result", 0);

		}
		
		 response.put("nickname", nickname); // Include nickname in the response
		return response;
		
	}//nickDupCheck end 
	
	
	@RequestMapping("register/emailDupCheck")
	@ResponseBody
	public Map<String, Object> emailDupCheck(@RequestParam String email) {
		 Map<String, Object> response = new HashMap<>();
		System.out.println(email);
		//mav.setViewName("layout/nickCheckForm");
		
		String dupCheck = memberDao.emailDupCheck(email);
		System.out.println(dupCheck);
		//String msg = "";
		
		if(dupCheck == null || dupCheck.isEmpty()) {
	
			response.put("result", 1);
		}else {
	
			response.put("result", 0);

		}
		
		 response.put("email", email); // Include nickname in the response
		return response;
		
	}//nickDupCheck end 
	
	@RequestMapping("register/emailCheck")
	public ModelAndView emailCheck() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/emailCheckForm");
		return mav;
	}
	
	@RequestMapping("/userInfo")
	public ModelAndView userInfo(HttpSession session) {
		 String email = (String) session.getAttribute("s_email");
		 //String nickname = (String) session.getAttribute("s_nickname");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/mypage/userInfo");
		mav.addObject("list", memberDao.userList(email));
		System.out.println(memberDao.userList(email));
		

		return mav;	
	}
	
	
	@RequestMapping("/dogInfo")
	public ModelAndView dogInfo(HttpSession session) {
		String email = (String) session.getAttribute("s_email");
		String nickname = (String) session.getAttribute("s_nickname");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/mypage/dogInfo");
		mav.addObject("list", memberDao.dogList(email));
	//System.out.println(memberDao.dogList(email));
		return mav;
	}
	
	
	@PostMapping("/register/userInsert")
	public ModelAndView insert(@ModelAttribute DogDTO dogDto,
			@ModelAttribute UserDTO userDto,
			@ModelAttribute PicDTO picDto,
            @RequestParam MultipartFile mainphotofile,
            @RequestParam MultipartFile userphotofile,
            MultipartHttpServletRequest mtfRequest,//사진 한꺼번에 여러개 받기 
            HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		
    	String mainphotofilename = "-";
    	long mainphotofilesize = 0;
    	
    	if (mainphotofile != null && !mainphotofile.isEmpty()) {
    		mainphotofilename = mainphotofile.getOriginalFilename();
    		mainphotofilesize = mainphotofile.getSize();
    	    try {
    	        ServletContext application = req.getSession().getServletContext();
    	        String path = application.getRealPath("/storage"); // 실제 물리적인 경로
    	        
    	        // 파일 경로와 파일명을 올바르게 합쳐서 파일 객체 생성
    	        File file = new File(path, mainphotofilename);

    	        // 파일 저장
    	        mainphotofile.transferTo(file);
    	        System.out.println(path);
    	        System.out.println("회원가입 사진 저장 성공");
    	    } catch (Exception e) {
    	        System.out.println(e);
    	    }
    	}
    	
    		//dogDTO에 파일 이름 저장
    		//System.out.println(mainphotofilename);
    		dogDto.setMainphoto(mainphotofilename);
    		//System.out.println(dogDto.toString());
    		memberDao.dogInsert(dogDto);
    		
        	String userphotofilename = "-";
        	long userphotofilesize = 0;
        	
        	if (userphotofile != null && !userphotofile.isEmpty()) {
        		userphotofilename = userphotofile.getOriginalFilename();
        		userphotofilesize = userphotofile.getSize();
        	    try {
        	        ServletContext application = req.getSession().getServletContext();
        	        String path = application.getRealPath("/storage"); // 실제 물리적인 경로

        	        // 파일 경로와 파일명을 올바르게 합쳐서 파일 객체 생성
        	        File file = new File(path, userphotofilename);

        	        // 파일 저장
        	        userphotofile.transferTo(file);
        	        //System.out.println(path);
        	    } catch (Exception e) {
        	        System.out.println(e);
        	    }
        	}
        	
        		//dogDTO에 파일 이름 저장
        		//System.out.println(userphotofilename);
        		userDto.setUserphoto(userphotofilename);
        		//System.out.println(userDto.toString());
        		memberDao.userInsert(userDto);
        		
        		
        		/////////////////////////////////////////////////////////////////////////////////////
        		
        		//기타 강아지 사진 사진 테이블에 저장 
        		
        	    // 각 파일 이름을 저장할 리스트
        	    List<String> picNames = new ArrayList<>();
        		
        		List<MultipartFile> dPicsFile = mtfRequest.getFiles("dPics");
        		// 각 파일 이름과 저장된 물리적인 경로를 저장할 맵
        	    Map<String, String> picPaths = new HashMap<>();

        	    // 파일 개수가 3개 이하일 때만 처리
        	    if (dPicsFile != null && dPicsFile.size() <= 3) {
        	    	
        	        // 파일 이름을 DTO에 저장 및 물리적인 경로에 파일 저장
        	        for (int i = 0; i < dPicsFile.size(); i++) {
        	        	
        	            String fieldName = "pic" + (i + 1); // 필드 이름 생성 (pic1, pic2, pic3)
        	            MultipartFile file = dPicsFile.get(i);
        	            String fileName;

        	            // 파일이 존재하는 경우 실제 파일 이름 사용, 없는 경우 "-"으로 설정
        	            if (file.isEmpty()) {
        	            	
        	                fileName = "-";
        	                
        	            } else {
        	            	
        	                fileName = file.getOriginalFilename();

        	                // 파일 이름을 DTO 필드에 저장
        	                switch (fieldName) {
        	                    case "pic1":
        	                        picDto.setPic1(fileName);
        	                        break;
        	                    case "pic2":
        	                        picDto.setPic2(fileName);
        	                        break;
        	                    case "pic3":
        	                        picDto.setPic3(fileName);
        	                        break;
        	                }

        	                try {
        	                    ServletContext application = req.getSession().getServletContext();
        	                    String path = application.getRealPath("/storage"); // 실제 물리적인 경로

        	                    // 파일 경로와 파일명을 올바르게 합쳐서 파일 객체 생성
        	                    File targetFile = new File(path, fileName);

        	                    // 파일 저장
        	                    file.transferTo(targetFile);

        	                    // 파일이 정상적으로 저장된 경우 경로를 맵에 저장
        	                    picPaths.put(fieldName, targetFile.getAbsolutePath());
        	                } catch (IOException e) {
        	                    e.printStackTrace();
        	                    // 파일 저장 중 오류 발생 시 처리할 내용
        	                }
        	            }
        	        }
        	    }

        	    // 파일 경로 맵 활용 예시
        	    for (Map.Entry<String, String> entry : picPaths.entrySet()) {
        	        System.out.println("Field Name: " + entry.getKey() + ", File Path: " + entry.getValue());
        	        // 파일 경로 출력 또는 다른 작업 수행
        	    }
        	    memberDao.dogPicsInsert(picDto);
        	    mav.setViewName("layout/home");
		 return mav;
		
	}//insert end
	
	//회원탈퇴
		@GetMapping("memdrop")
		public ModelAndView memdrop(Model model,@RequestParam(name="email", required=false)String email) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("email", email);
			mav.setViewName("layout/member/memdrop");
			return mav;
		}
		
		
		@RequestMapping("memdropend")
		public ModelAndView delete(
				HttpSession session,@RequestParam(value="password") String password) {
			
			String email = (String) session.getAttribute("s_email");
			ModelAndView mav=new ModelAndView();
			//List<Map<String, Object>> userdto = memberDao.userdtoList(email); 
			List<UserDTO> userdto = memberDao.userdtoList(email);
			
			//System.out.println(memberDao.userdtoList(email).get(0));
			//System.out.println(password);
			Object pw =  memberDao.userdtoList(email).get(0);
			if(session.getAttribute("s_email")!= null && pw.equals(password)) { 
			
		    memberDao.delete(email); 
		    System.out.println("탈퇴성공");
		    mav.addObject("message", "1"); 
			mav.setViewName("layout/home");
			session.invalidate();//
			
			}else {
				System.out.println("탈퇴실패");
				mav.addObject("message", "2");
				mav.setViewName("layout/member/memdrop");
			}
			return mav; 
		}//delete() end

}//MemberController end
