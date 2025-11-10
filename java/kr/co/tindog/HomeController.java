package kr.co.tindog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	public HomeController() {
		System.out.println("HomeController 생성");
	}
	
	//http://localhost:2000/ 
	//메인 홈페이지 
	@GetMapping("")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/home");
		return mav;
	}
	
}
