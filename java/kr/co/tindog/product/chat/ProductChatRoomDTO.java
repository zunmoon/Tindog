package kr.co.tindog.product.chat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductChatRoomDTO {
	private int proomno;
	private String nickname_to;
	private String nickname_from;	
	private String tot_nickname;
	private int uproduct_no;
}
