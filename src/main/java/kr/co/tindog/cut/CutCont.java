package kr.co.tindog.cut;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@RestController
public class CutCont {
	
	@Autowired
	CutDAO cutDao;
	
	@RequestMapping("/cut")
	public ModelAndView cutList(HttpSession session) {
		String s_email = (String)session.getAttribute("s_email");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("layout/mypage/cut");
		mav.addObject("list", cutDao.cutList(s_email));
		mav.addObject("list2", cutDao.cutPList(s_email));
		//mav.addObject("list2", productChatRoomDao.chatList(nickname));
		return mav;
	}
	
	@PostMapping("/cut/cancel/{email}")
	@ResponseBody
	public int cutCancel(@PathVariable String email, HttpSession session) {
		String cutEmail = email;
		String s_email = (String)session.getAttribute("s_email");
		CutDTO cutDto = new CutDTO();
		cutDto.setEmail(s_email);
		cutDto.setCutEmail(cutEmail);
		
		int cnt = cutDao.cutCancel(cutDto);
		
		return cnt;
	}
}
