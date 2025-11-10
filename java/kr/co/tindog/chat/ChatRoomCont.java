package kr.co.tindog.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import kr.co.tindog.cut.CutDTO;
import kr.co.tindog.product.chat.ProductChatRoomDAO;

@RestController
public class ChatRoomCont {
	
	@Autowired
	ChatRoomDAO chatRoomDao;
	
	@Autowired
	ProductChatRoomDAO productChatRoomDao;
	
//	@GetMapping("/chatRoomCheck/{followemail}")
//	public ModelAndView chatRoomCheck(@PathVariable String followemail, HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//		String nickname_to = chatRoomDao.getNickname(followemail);
//		session.setAttribute("c_nickname_to", nickname_to);
//		mav.setViewName("layout/chat/chatRoomCheck");
//		return mav;
//	}
	
	@RequestMapping("/chatList")
	public ModelAndView chatList(HttpSession session) {
		String nickname = "%" + (String)session.getAttribute("s_nickname") + "%";
		String s_nickname = (String)session.getAttribute("s_nickname");
		
		//ChatRoomDTO dto = new ChatRoomDTO();
		//dto.setTot_nickname(nickname);
		//String dogName = chatRoomDao.findDogName(s_nickname);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("layout/mypage/chatList");
		mav.addObject("list", chatRoomDao.findDogName(s_nickname));
		// mav.addObject("list", chatRoomDao.chatList(nickname));
		mav.addObject("list2", productChatRoomDao.chatList(nickname));
		// System.out.println(chatRoomDao.chatList(nickname));
		return mav;
	}
	
	@PostMapping("/chatList/checkGum")
	@ResponseBody
	public int checkGum(@RequestParam String s_nickname, HttpSession session) {
		int cnt = chatRoomDao.checkGum(s_nickname);
		
		return cnt;
	}
	
	@PostMapping("/chatList/insert")
	@ResponseBody
	public int chatRoomInsert(@RequestParam String nickname, HttpSession session) {
		String followNickname = nickname;
		String s_nickname = (String)session.getAttribute("s_nickname");
		int gumQty = chatRoomDao.checkGum(s_nickname);
		
		if(gumQty > 0) {
			try {
				ChatRoomDTO chatRoomDto = new ChatRoomDTO();
				chatRoomDto.setNickname_from((String)session.getAttribute("s_nickname"));
				chatRoomDto.setNickname_to(followNickname);
				chatRoomDto.setTot_nickname(followNickname + (String)session.getAttribute("s_nickname"));
				
				int check = chatRoomDao.chatRoomCheck(chatRoomDto);
				if(check==0) {
					int cnt = chatRoomDao.chatRoomInsert(chatRoomDto);
					chatRoomDao.useGum(s_nickname);
					session.removeAttribute("s_gumqty");
					session.setAttribute("s_gumqty", gumQty);
					return cnt;
				}else {
					return 0;
				}
						
			} catch (Exception e) {
			    e.printStackTrace();
			    return -1; // 예외가 발생한 경우 -1을 반환하거나 적절한 에러 코드를 반환하세요.
			}
		} else {
			return 0;
		}
		
	}
	
	@PostMapping("/chatList/delete/{droomno}")
	@ResponseBody
	public int chatRoomDelete(@PathVariable int droomno) {
		int cnt = chatRoomDao.chatRoomDelete(droomno);
		
		return cnt;
	}
	
	@PostMapping("/chatList/cut/{nickname}")
	@ResponseBody
	public int cut(@PathVariable String nickname, HttpSession session) {
		String email = (String)session.getAttribute("s_email");
		String cutEmail = chatRoomDao.findEmail(nickname);
		
		CutDTO cutDto = new CutDTO();
		cutDto.setEmail(email);
		cutDto.setCutEmail(cutEmail);
		cutDto.setCutCase(1);
		
		int cnt = chatRoomDao.cut(cutDto);
		
		return cnt;
	}
	
	@PostMapping("/chatList/cutP/{nickname}")
	@ResponseBody
	public int cutP(@PathVariable String nickname, HttpSession session) {
		String email = (String)session.getAttribute("s_email");
		String cutEmail = chatRoomDao.findEmail(nickname);
		
		CutDTO cutDto = new CutDTO();
		cutDto.setEmail(email);
		cutDto.setCutEmail(cutEmail);
		cutDto.setCutCase(2);
		
		int cnt = chatRoomDao.cutP(cutDto);
		
		return cnt;
	}
}
