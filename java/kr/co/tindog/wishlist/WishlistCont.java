package kr.co.tindog.wishlist;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import kr.co.tindog.wishlist.WishlistDTO;
import kr.co.tindog.wishlist.WishlistDAO;

@Controller
@RequestMapping("/layout")
public class WishlistCont {
	
	public WishlistCont() {
		System.out.println("WishlistCont() 객체 생성됨");
	}

	@Autowired
	WishlistDAO wishlistDao;
	
	@PostMapping("/insert")
	public String wishlistInsert(@ModelAttribute WishlistDTO wishlistDto, HttpSession session) {
		
		wishlistDto.setEmail((String)session.getAttribute("s_email"));
		
		wishlistDao.wishlistInsert(wishlistDto);
		
		return "redirect:/layout/wishlist"; //찜목록 페이지
			
	}//wishlistInsert() end	
	
	
	@RequestMapping("/wishlist")
	public ModelAndView list(HttpSession session) {
		
		//로그인 했다면
		//String s_id=session.getAttribute("s_id")
		String s_email=(String)session.getAttribute("s_email");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/wishlist");
		mav.addObject("list", wishlistDao.wishlistList(s_email));
		return mav;
	}//wishlist() end

	
	@GetMapping("/delete")
	public String delete(String wishlist_no, HttpSession session) {
	
		
		WishlistDTO wishlistDto = new WishlistDTO();
		wishlistDto.setWishlist_no(wishlist_no);
		wishlistDto.setEmail((String)session.getAttribute("s_email"));
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("no", wishlist_no);
		map.put("s_email", session.getAttribute("s_email"));
		wishlistDao.WishlistDelete(map);
		return "redirect:/layout/wishlist";
	}//delete() end
	
	
}
