package kr.co.tindog.chat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomDTO {
	
	private int droomno ;
	private String nickname_to;
	private String nickname_from;	
	private String tot_nickname;
}
