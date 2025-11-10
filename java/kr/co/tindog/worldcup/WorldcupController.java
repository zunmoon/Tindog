 package kr.co.tindog.worldcup;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import kr.co.tindog.member.MemberDAO;

@Controller
public class WorldcupController {

	public WorldcupController() {
		System.out.println("WorldcupController 생성");
	}
	
	@Autowired
    WorldcupDAO worldcupDAO;
	MemberDAO memberDao;
	
	//http://localhost:2000/worldcup
	
	@GetMapping("worldcup")
	public ModelAndView worldcup() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/worldcup/worldcup_main");
		return mav;
	}
	
	
	//http://localhost:2000/worldcup/select
		
		@RequestMapping("worldcup/select")
		public ModelAndView worldcup_select() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("layout/worldcup/worldcup_selection");
			return mav;
		}
	
	//http://localhost:2000/worldcup/start

		@RequestMapping("worldcup/start")
		public ModelAndView worldcup_start(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("layout/worldcup/worldcup_start");
			String email = (String) session.getAttribute("s_email");
			List<Map<String, Object>> imageList = worldcupDAO.worldcupImgList(email);
			
			System.out.println(imageList);
			//System.out.println(worldcupDAO.worldcupImgList(email));
			
			mav.addObject("imageList",imageList);
			return mav;
		}
		
		@RequestMapping("worldcup/final")
		public ModelAndView worldcup_final(@RequestParam String email) {
			ModelAndView mav = new ModelAndView();
			System.out.println(email);
			
			List<Map<String, Object>> winner = worldcupDAO.worldcupWinner(email);
			System.out.println(winner);
			mav.addObject("list", winner);
			mav.setViewName("layout/worldcup/worldcup_final");
			
			return mav;
		}
		
		@RequestMapping("worldcup/followInsert")
		public ModelAndView worldcup_followInsert(@RequestParam String email, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			Map<String, String> emails = new HashMap();
			String s_email = (String) session.getAttribute("s_email"); //세션이메일 
			String f_email = email;//팔로우 대상 이메일
			
			
			System.out.println("내 이메일" + s_email);
			System.out.println("팔로우" + f_email);	
		
		    emails.put("f_email", f_email);
		    emails.put("s_email", s_email);
		    
		    
		    List<Object> dupCheck = worldcupDAO.dupCheck(emails);//팔로우 중복 체크
		    System.out.println("중복체크" + dupCheck);
		    
		    if(dupCheck == null || dupCheck.isEmpty()) {
		    	System.out.println("중복아님 / 팔로우 추가 성공");
		    	worldcupDAO.FollowInsert(emails);
		    	mav.setViewName("layout/worldcup/worldcup_followSuccess");
		    	return mav;
		    	
		    }else {
		    	System.out.println("중복되는 팔로워");
		    	mav.setViewName("layout/worldcup/worldcup_followFail");
		    	return mav;
		    }
		    
	
		}
	
		@RequestMapping("worldcup/optionstart")
		public ModelAndView worldcupoptionstart(HttpSession session, @ModelAttribute DogDTO dogDTO) throws Exception{
			ModelAndView mav = new ModelAndView();							
			
			String email = (String) session.getAttribute("s_email");
			dogDTO.setEmail(email);
			
			System.out.println(dogDTO);
				
			List<Map<String, Object>> OptionList = worldcupDAO.worldcupOptionList(dogDTO);
			System.out.println("map:" + OptionList.toString());
			System.out.println(OptionList);
			
			if(OptionList.isEmpty() || OptionList==null) {				
				mav.setViewName("redirect:/alert");				
				return mav;
			}
			
			mav.addObject("OptionList", OptionList);
			mav.setViewName("layout/worldcup/worldcup_optionstart");	
			
			return mav;
		}
		
		@RequestMapping("/alert")
		public ModelAndView alert() {
			ModelAndView mav=new ModelAndView();
			
			mav.setViewName("layout/worldcup/alert");
			
			return mav;
		}
		
		@RequestMapping("/idelResult")
		public ModelAndView idelResult(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			String email=(String) session.getAttribute("s_email");
			
			mav.addObject("list", worldcupDAO.idelResult(email));
			mav.setViewName("/layout/mypage/idelResult");
			
			System.out.println(worldcupDAO.idelResult(email));
			
			return mav;
		}
}
