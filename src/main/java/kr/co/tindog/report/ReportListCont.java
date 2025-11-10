package kr.co.tindog.report;

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
public class ReportListCont {
	
	@Autowired
	ReportListDAO reportListDao;
	
	@RequestMapping("/reportList")
	public ModelAndView report(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/reportList");
		mav.addObject("list", reportListDao.list());
		mav.addObject("list2", reportListDao.list2());
		return mav;
	}
	
	@PostMapping("/reportList/susCheck/{reported}")
	public String susCheck(@PathVariable String reported) {
		String memgrade = reportListDao.susCheck(reported);
		
		return memgrade;
	}
	
	@PostMapping("/reportList/suspended/{reported}")
	public int suspended(@PathVariable String reported) {
		int cnt = reportListDao.suspended(reported);
		
		return cnt;
	}
	
	@PostMapping("/reportList/susTot/{reported}")
	public int susTot(@PathVariable String reported) {
		int cnt = reportListDao.susTot(reported);
		
		return cnt;
	}
	
	@PostMapping("/reportList/suspended2/{reported}")
	public int suspended2(@PathVariable String reported) {
		int cnt = reportListDao.suspended2(reported);
		
		return cnt;
	}
	
	@PostMapping("/reportList/kick/{reported}")
	public int kick(@PathVariable String reported) {
		int cnt = reportListDao.kick(reported);
		
		return cnt;
	}
}
