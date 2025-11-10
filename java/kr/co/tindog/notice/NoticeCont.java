package kr.co.tindog.notice;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class NoticeCont {

	public NoticeCont() {
		System.out.println("NoticeController 생성");
	}
	
	@Autowired
	NoticeDAO noticeDao;
	
		
		@RequestMapping("notice") 
		public ModelAndView list(HttpServletRequest req, HttpSession session) { 
			ModelAndView mav = new ModelAndView();
			mav.setViewName("layout/notice/list");
			
			
		   int Rowcnt = noticeDao.Rowcnt();	
			int Perpage   = 5;	//페이지당 
			int pagelist = 5;	
			
			String pageNum = req.getParameter("pageNum");	
			if(pageNum == null) {pageNum = "1";}
			int currentpage = Integer.parseInt(pageNum);		
			
			int startrow    = (currentpage - 1)*Perpage +1;	
			int endrow		= currentpage * Perpage;			
			int start =startrow-1;//
			
			//페이지 수 
			double totcnt = (double)Rowcnt / Perpage; 
			int totalPage = (int)Math.ceil(totcnt);				
			
			
			double dpage = (double)currentpage / pagelist;	
			int Pages	  = (int)Math.ceil(dpage) - 1;			
			int Pagestart = Pages * pagelist + 1;			
			int Pageend	  = Pagestart + pagelist -1;		
			
			
			List<Map<String, Object>> list = null;
			HashMap<String,Object> map= new HashMap<>();  
			map.put("start", start);
			//map.put("startrow",startrow);
			//map.put("endrow", endrow);
			if(Rowcnt > 0) {
				list = noticeDao.list(map); } 
			
			String memgrade = (String)session.getAttribute("s_grade");
			
			/*
			 * boolean isMaster = memgrade != null && memgrade.equals("M");
			 * 
			 * mav.addObject("isMaster", isMaster);
			 */
			mav.addObject("count", Rowcnt); //
			mav.addObject("pageNum", currentpage); 
			mav.addObject("totalPage", totalPage);
			mav.addObject("Pagestart", Pagestart); //
			mav.addObject("Pageend", Pageend);
			mav.addObject("list", list);
	
			return mav;
		}//list() end 
		
				
		//
		@RequestMapping("notice/write")
		public ModelAndView write() { //
			ModelAndView mav = new ModelAndView();
			mav.setViewName("layout/notice/write"); 
			return mav;
		}
		
		
		
		//
	
		@RequestMapping("notice/insert")
		public String insert(@RequestParam Map<String, Object> map) { 
			noticeDao.insert(map); 	
			return "redirect:/notice";  
		}//insert() end
		

		
		@RequestMapping("notice/{noticeno}")
		public ModelAndView detail(@PathVariable int noticeno) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("layout/notice/detail");
			mav.addObject("notice", noticeDao.detail(noticeno));
			return mav;
		}// detail() end 
		
	   
		@RequestMapping("notice/delete")
		public String delete(int noticeno) { 
			noticeDao.delete(noticeno); 
			
			return "redirect:/notice";  
		}//delete() end
		
   
		@RequestMapping("notice/update")
			public String update(@RequestParam Map<String, Object> map) {
				noticeDao.update(map);
				return "redirect:/notice";
			}// update() end
		
		
		
		

		
		
	
		
}







