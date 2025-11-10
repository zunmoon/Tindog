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
import kr.co.tindog.chat.ChatDTO;

@Controller
public class ProductChatCont {
	
	@Autowired
	ProductChatDAO chatDao;
	
	@GetMapping("/productchat/{proomno}")
	public ModelAndView chat(HttpSession session, @PathVariable int proomno) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("s_proomno", proomno);
		mav.setViewName("product/productchat");
		mav.addObject("list", chatDao.chatLogs(proomno));
		System.out.println(chatDao.chatLogs(proomno));
		return mav;
	}
    
	@PostMapping("/productchat/chatLogInsert")
    @ResponseBody
    public int chatLogsInsert(@RequestParam int proomno, @RequestParam String message, HttpSession session) {
    	ProductChatDTO chatDto = new ProductChatDTO();
    	chatDto.setProomno(proomno);
    	chatDto.setMessage(message);
    	chatDto.setSender((String)session.getAttribute("s_nickname"));
    	
    	int cnt = chatDao.chatInsert(chatDto);
    	
    	return cnt;
    }
	
}
