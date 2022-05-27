package spectrum.chat;

import javax.websocket.Session;

public class ChatMemberVO {
	private String memberNickname;
	private Session session;
	
	public ChatMemberVO(String memberNickname, Session session) {
		super();
		this.memberNickname = memberNickname;
		this.session = session;
	}

	public String getNickname() {
		return memberNickname;
	}

	public void setNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}
	
	
}
