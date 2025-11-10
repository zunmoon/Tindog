package kr.co.tindog.pay;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Payment;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import jakarta.servlet.http.HttpSession;
import kr.co.tindog.chat.ChatRoomDAO;
import kr.co.tindog.member.MemberDAO;
import net.minidev.json.JSONObject;

@RestController
public class PayCont {
	
	@Autowired
	PayDAO payDAO;
	
	@Autowired
	ChatRoomDAO chatRoomDao;
	
	
   private IamportClient api;

    private PayCont() {
        this.api = new IamportClient("1272712856040007",
                "0r366VoATh7DnJrUuBWZcsZcqMUx7V0rGN6flVAmM1wGsmNLRhFmWfkQd4OgA13F9JluUkWR6VbDUu7R");
    }
	
	@RequestMapping("/mypageIndex")
	public ModelAndView dogGumPay(HttpSession session) {
		String email = (String)session.getAttribute("s_email");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("layout/common/mypageIndex");
		mav.addObject("email",email);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/confirmPay/{imp_uid}", method=RequestMethod.POST)
	public int paymentByImpUid(@PathVariable(value= "imp_uid") String imp_uid, HttpSession session) throws IamportResponseException, IOException{	
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("s_email");
			payDTO payDTO = new payDTO();
			System.out.println(imp_uid);
			Payment payment = this.api.paymentByImpUid(imp_uid).getResponse(); // 검증처리
			
			try {
				
				if(payment.getStatus().equals("paid")) {
			
						
						System.out.println("paid");
						
						payDTO.setEmail(email);
						payDTO.setOrderno(payment.getMerchantUid());
						payDTO.setGumqty(Integer.parseInt(payment.getName()));//개껌갯수
						payDTO.setPrice(payment.getAmount().toString());
						System.out.println(payDTO.toString());
						payDAO.payInsert(payDTO);
						//mav.setViewName("layout/mypage/paySuccess");
										
						String s_nickanem = (String)session.getAttribute("s_nickname");
						int gumQty = chatRoomDao.checkGum(s_nickanem);
						
						session.removeAttribute("s_gumqty"); 
						session.setAttribute("s_gumqty", gumQty);
						
						return 1;
						
				}else {
						
						System.out.println("failed");
						mav.setViewName("layout/mypage/payFail");
						return 0;

				} // switch
				
				//res.add("result", result);
				//res.add("orderNum", payment.getMerchantUid());
			} catch (ServiceException e) {
				throw (e);
			} // try-catch
			
			
			
			/*
			// 리턴받은 payment의 status가 결제완료이면 DB조작 메소드 실행
			try {
				switch(payment.getStatus()) {
					case "paid" :
						
						
						System.out.println("paid");
						
						payDTO.setEmail(email);
						payDTO.setOrderno(payment.getMerchantUid());
						payDTO.setGumqty(Integer.parseInt(payment.getName()));//개껌갯수
						payDTO.setPrice(payment.getAmount().toString());
						System.out.println(payDTO.toString());
						payDAO.payInsert(payDTO);
						

						break;
					case "failed" :
						System.out.println("failed");
						
						break;
				} // switch
				
				//res.add("result", result);
				//res.add("orderNum", payment.getMerchantUid());
			} catch (ServiceException e) {
				throw (e);
			} // try-catch
			
			*/
	}//class end
	
}//class end
