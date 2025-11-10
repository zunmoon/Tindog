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
public class ReportCont {
	
	@Autowired
	ReportDAO reportDao;
	
	@RequestMapping("/report/{nickname}")
	public ModelAndView report(@PathVariable String nickname, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/report");
		mav.addObject("list", reportDao.report(nickname));
		return mav;
	}
	
	@PostMapping("/report/insert")
	public int reportInsert(@RequestParam String reported, @RequestParam String reason, HttpSession session) {
		String reporter = (String)session.getAttribute("s_email");
		ReportDTO reportDto = new ReportDTO();
		reportDto.setReporter(reporter);
		reportDto.setReported(reported);
		reportDto.setReason(reason);
		reportDto.setReportcase(1);
		
		int cnt = reportDao.reportInsert(reportDto);
		
		return cnt;
	}
	
	@RequestMapping("/report2/{nickname}")
	public ModelAndView report2(@PathVariable String nickname, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/report2");
		mav.addObject("list", reportDao.report2(nickname));
		return mav;
	}
	
	@PostMapping("/report2/insert")
	public int reportInsert2(@RequestParam String reported, @RequestParam String reason, HttpSession session) {
		String reporter = (String)session.getAttribute("s_email");
		ReportDTO reportDto = new ReportDTO();
		reportDto.setReporter(reporter);
		reportDto.setReported(reported);
		reportDto.setReason(reason);
		reportDto.setReportcase(2);
		
		int cnt = reportDao.reportInsert2(reportDto);
		
		return cnt;
	}
}
