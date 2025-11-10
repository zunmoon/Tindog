package kr.co.tindog.dbti;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpSession;

@Controller
public class DbtiCont {

	@Autowired
	DbtiDAO dbtiDao;
	
	@RequestMapping("/dbti")
	public ModelAndView dbti() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("layout/dbti/dbti");
		return mav;
	}
	
	@PostMapping("/dbtiinsert")
	public ModelAndView dbtiInsert(@RequestParam String data, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String email=(String)session.getAttribute("s_email");
		
		DbtiDTO dbtiDto=new DbtiDTO();
		dbtiDto.setEmail(email);
		dbtiDto.setDbti(data);
		System.out.println(email);
		System.out.println(data);
		
		List<DbtiDTO> ddto=dbtiDao.dbtiList(email);
		System.out.println(ddto);
		
		if(ddto.isEmpty() || ddto==null) {
			dbtiDao.dbtiInsert(dbtiDto);
		}else {
			dbtiDao.dbtiUpdate(dbtiDto);
		}
		
		mav.setViewName("/layout/dbti/dbti");
		
		return mav;	
	}
	
	@RequestMapping("/dbtiResult")
	public ModelAndView dbtiResult(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String email=(String) session.getAttribute("s_email");
		
		mav.addObject("list", dbtiDao.dbtiList(email));
		mav.setViewName("/layout/mypage/dbtiResult");
		
		System.out.println(dbtiDao.dbtiList(email));
		
		return mav;
	}
	
}
