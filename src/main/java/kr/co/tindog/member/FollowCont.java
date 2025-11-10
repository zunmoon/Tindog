package kr.co.tindog.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@RestController
public class FollowCont {
	
	@Autowired
	FollowDAO followDao;
	
	@RequestMapping("/follow")
	public ModelAndView follow(HttpSession session) {
		String email = (String)session.getAttribute("s_email");
		// System.out.println(email);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/mypage/follow");
		mav.addObject("list", followDao.followList(email));
		return mav;
	}
	
	@PostMapping("/follow/delete/{email}")
	@ResponseBody
	public int followCancel(@PathVariable String email) {
		int cnt = followDao.followCancel(email);
		
		return cnt;
	}
}
