package kr.co.tindog.product.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import kr.co.tindog.chat.ChatRoomDTO;

@Controller
public class ProductChatRoomCont {
	
	@Autowired
	ProductChatRoomDAO chatRoomDao;
	
	@PostMapping("/product_chatList/insert")
	@ResponseBody
	public int chatRoomInsert(@RequestParam String nickname, @RequestParam int uproduct_no, HttpSession session) {
		
		try {
			ProductChatRoomDTO chatRoomDto = new ProductChatRoomDTO();
			chatRoomDto.setUproduct_no(uproduct_no);
			chatRoomDto.setNickname_from((String)session.getAttribute("s_nickname"));
			chatRoomDto.setNickname_to(nickname);
			chatRoomDto.setTot_nickname(nickname + (String)session.getAttribute("s_nickname"));
			System.out.println(chatRoomDto);
			
			int check = chatRoomDao.chatRoomCheck(chatRoomDto);
			if(check==0) {
				int cnt = chatRoomDao.chatRoomInsert(chatRoomDto);
				
				return cnt;
			}else {
				return 0;
			}
					
		} catch (Exception e) {
		    e.printStackTrace();
		    return -1; // 예외가 발생한 경우 -1을 반환하거나 적절한 에러 코드를 반환하세요.
		}
	}
	
	@PostMapping("/product_chatList/delete/{proomno}")
	@ResponseBody
	public int chatRoomDelete(@PathVariable int proomno) {
		int cnt = chatRoomDao.chatRoomDelete(proomno);
		
		return cnt;
	}
    
}
