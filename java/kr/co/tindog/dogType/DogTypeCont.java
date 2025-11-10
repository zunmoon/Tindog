package kr.co.tindog.dogType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@RestController
public class DogTypeCont {
	
	@Autowired
	DogTypeDAO dogtypeDao;
	
	@RequestMapping("/dogtype")
	public ModelAndView dogType(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("layout/dogtype");
		return mav;
	}
	
	@PostMapping("/dogtype/insert")
	@ResponseBody
	public int dogtypeInsert(@RequestParam String dogtype) {
		dogtype = dogtype.trim();
		int check = dogtypeDao.check(dogtype);
		
		if(check == 0) {
			int cnt = dogtypeDao.insert(dogtype);
			return cnt;
		} else {
			return -1;
		}
	}
}
