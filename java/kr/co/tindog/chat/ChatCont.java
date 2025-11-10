package kr.co.tindog.chat;

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

@Controller
public class ChatCont {
	
	@Autowired
	ChatDAO chatDao;
	
	@MessageMapping("/chat.register")
	@SendTo("/topic/public")
    public ChatMessage register(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage;
    }
	
	@MessageMapping("/chat.send")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        return chatMessage;
    }
    
    @GetMapping("/chat/{droomno}")
	public ModelAndView chat(HttpSession session, @PathVariable int droomno) {
		ModelAndView mav = new ModelAndView();
		String dname = chatDao.findDogName((String)session.getAttribute("s_email"));
		session.setAttribute("s_dname", dname);
		session.setAttribute("s_droomno", droomno);
		
		mav.setViewName("layout/mypage/chat");
		mav.addObject("list", chatDao.chatLogs(droomno));
		System.out.println(chatDao.chatLogs(droomno));
		return mav;
	}
    
    @PostMapping("/chat/chatLogInsert")
    @ResponseBody
    public int chatLogsInsert(@RequestParam int droomno, @RequestParam String message, HttpSession session) {
    	ChatDTO chatDto = new ChatDTO();
    	chatDto.setDroomno(droomno);
    	chatDto.setMessage(message);
    	chatDto.setSender((String)session.getAttribute("s_nickname"));
    	
    	int cnt = chatDao.chatInsert(chatDto);
    	
    	return cnt;
    }
    
}
