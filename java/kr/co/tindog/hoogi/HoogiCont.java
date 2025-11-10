package kr.co.tindog.hoogi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.tindog.hoogi.HoogiDTO;
import kr.co.tindog.product.ProductDAO;

@Controller
@RequestMapping("/hoogi")
public class HoogiCont {

	public HoogiCont() {
		System.out.println("HoogiCont() 객체 생성됨");
	}//class end
	
	@Autowired
	private HoogiDAO hoogiDao;	
	
	@RequestMapping("/{nickname}")
	public ModelAndView list(@PathVariable String nickname, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// String sellerNickname=(String)session.getAttribute("nickname");

		
		mav.setViewName("hoogi/comment");
	    mav.addObject("list", hoogiDao.list(nickname));
	   
		return mav;
	}//list() end
	
	
	 @PostMapping("/insert")
	   @ResponseBody
	   public int mCommentServiceInsert(@RequestParam String nickname, @RequestParam String context, HttpSession session,
			                                                           @ModelAttribute HoogiDTO hoogiDTO,
			                                                             HttpServletRequest req)
	   throws Exception{
	
		   HoogiDTO hoogiDto = new HoogiDTO();
		   String s_nickname=(String)session.getAttribute("s_nickname");
		   hoogiDto.setSeller(nickname);
		   hoogiDto.setContext(context);
		   hoogiDto.setConsumer(s_nickname);
		  
		   int cnt = hoogiDao.hoogiInsert(hoogiDto);
		   
		   return cnt;
	   }//mCommentServiceInsert
	   
	   @GetMapping("/list")
	   @ResponseBody
	    public List<HoogiDTO> mCommentServiceList(@RequestParam String nickname, HttpSession session) throws Exception{
		   List<HoogiDTO> list2 = hoogiDao.hoogiList(nickname);
		   //System.out.println(list);
		   return list2; 
	   }// mCommentServiceList() end
	   
	   
	   @PostMapping("/update")
	   @ResponseBody
	   public int mCommentServiceUpdateProc(@RequestParam int review_no, @RequestParam String context, HttpSession session)
	   throws Exception{
		   HoogiDTO hoogiDto = new HoogiDTO();
		   String s_nickname=(String)session.getAttribute("s_nickname");
		   hoogiDto.setReview_no(review_no);
		   hoogiDto.setContext(context);  
		   hoogiDto.setConsumer(s_nickname);
		   int cnt = hoogiDao.hoogiUpdate(hoogiDto); 
		   return cnt;
	   }//mCommentServiceUpdateProc() end
	   
	   @PostMapping("/delete/{review_no}")
	   @ResponseBody
	   public int mCommentServiceDelete(@PathVariable int review_no, HttpSession session) throws Exception{
		   
		   HoogiDTO hoogiDto = new HoogiDTO();
		   String s_nickname=(String)session.getAttribute("s_nickname");
		   hoogiDto.setConsumer(s_nickname);
		   hoogiDto.setReview_no(review_no);
		   
		   int cnt = hoogiDao.hoogiDelete(hoogiDto);
		   return cnt;
	   }//mCommentServiceDelete  
	
	
	
	
	
	
	
	
	
	
	
}
