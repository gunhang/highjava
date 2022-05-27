package spectrum.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import spectrum.member.vo.MemberVO;


@ServerEndpoint(value = "/mbtiGroupMultiChat.do", configurator = HttpSessionConfigurator.class)
public class MbtiGroupMutiChat {
	
	//유저 집합 리스트
	private static Map<String, List<ChatMemberVO>> sessionUsersMap = 
			Collections.synchronizedMap(new HashMap<String, List<ChatMemberVO>>());
	
	/**
	 * 웹 소켓이 접속되면 전체방의 유저리스트에 세션을 넣는다.
	 * @param userSession 웹 소켓 세션
	 */
	@OnOpen
	public void handleOpen(Session userSession){
		
		HttpSession session = (HttpSession) userSession.getUserProperties().get(HttpSessionConfigurator.Session);
		MemberVO mv = (MemberVO) session.getAttribute("mv");
		if(!sessionUsersMap.containsKey(mv.getMbticode())) {
			sessionUsersMap.put(mv.getMbticode(), new ArrayList<ChatMemberVO>() );
		}
		ChatMemberVO chatVo = new ChatMemberVO(mv.getMemberNickname(), userSession);
		sessionUsersMap.get(mv.getMbticode()).add(chatVo);	
		System.out.println(mv.getMemberId()+" / "+mv.getMemberNickname()+" : "+ mv.getMbticode()+ " 채팅방 접속\n");
	}
	
	
	/**
	 * 웹 소켓으로부터 메시지가 오면 호출한다.
	 * @param message 메시지
	 * @param userSession
	 * @throws IOException
	 */
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException{
		HttpSession session = (HttpSession) userSession.getUserProperties().get(HttpSessionConfigurator.Session);
		MemberVO mv = (MemberVO) session.getAttribute("mv");
		
		String username = (String)userSession.getUserProperties().get("username");
		String room = mv.getMbticode();
		System.out.println("&&&&&& memberNickname = " + mv.getMemberNickname());
		System.out.println("++++++ room = " + room);
		
		// JSON구조의 문자열로 온 메시지를 객체형으로 변환한다.
		Gson gson = new Gson();
		ChatMessageVO chatMessageVo = gson.fromJson(message, ChatMessageVO.class);
		System.out.println("***" + chatMessageVo);
		
		// 세션 프로퍼티에 username이 없으면 username을 선언하고 해당 세션으로 메시지를 보낸다.(json 형식이다.)
		// 최초 메시지는 username 설정  
		// 처음에는 무조건 '전체'라는 채팅방에 추가된다.
		if(username == null || "connect".equals(chatMessageVo.getCommand()) ){
			for(ChatMemberVO chatVo : sessionUsersMap.get(room)){
				if(userSession.equals(chatVo.getSession())){
					userSession.getUserProperties().put("username", mv.getMemberNickname());
					userSession.getUserProperties().put("room", room);
					
					userSession.getBasicRemote().sendText(buildJsonData("System", mv.getMemberNickname() + "님이 입장했습니다.", userSession));
					
					Iterator<ChatMemberVO> iterator = sessionUsersMap.get(room).iterator();
					while(iterator.hasNext()){
						ChatMemberVO chVo = iterator.next();
						if(!chVo.getSession().equals(chatVo.getSession())){
							chVo.getSession().getBasicRemote().sendText(buildJsonData("System", mv.getMemberNickname() + "님이 입장했습니다.", userSession));
						}
					}
					
					// 채팅 방 목록과 해당 방의 멤버 목록을 갱신하는 메서드 호출
					roomUpdateAll(userSession);
					return;
				}
			}
		}
		
		if("message".equals(chatMessageVo.getCommand()) ){
			// username이 있으면 해당 채팅방 전체에게 메시지를 보낸다.
			sendToAll(room, username, chatMessageVo.getMessage());
		}
		
	}
	
	// 채팅 방 목록과 해당 방의 멤버 목록을 보내는 메서드
	public void roomUpdateAll(Session userSession) throws IOException{
		for(String roomName : sessionUsersMap.keySet()) {
			for(ChatMemberVO chatVo : sessionUsersMap.get(roomName)) {
				if(userSession != chatVo.getSession())
					chatVo.getSession().getBasicRemote().sendText(buildJsonData(null, null, chatVo.getSession()));
			}
		}

	}
	
	/**
	 * 해당 채팅방 전체에게 메시지를 보낸다.
	 * @param room 채팅방이름
	 * @param username 사용자 이름
	 * @param message 메시지
	 * @throws IOException
	 */
	public void sendToAll(String room, String username, String message) throws IOException{
		// username이 있으면 채팅방 전체에게 메시지를 보낸다.
		if(sessionUsersMap.containsKey(room)) {
			Iterator<ChatMemberVO> iterator = sessionUsersMap.get(room).iterator();
			while(iterator.hasNext()){
				iterator.next().getSession().getBasicRemote().sendText(buildJsonData(username, message, null));
			}
		}
	}
	
	/**
	 * 웹소켓을 닫으면 해당 유저를 유저리스트에서 뺀다.
	 * @param userSession
	 * @throws IOException */
	@OnClose
	public void handleClose(Session userSession) throws IOException, NullPointerException{
		HttpSession session = (HttpSession) userSession.getUserProperties().get(HttpSessionConfigurator.Session);
		
		System.out.println(session.getAttribute("memberId") +" / "+ (String) userSession.getUserProperties().get("username") + "접속 종료...");
		String room = (String) userSession.getUserProperties().get("room");
		
		String delName = null;
		Iterator<ChatMemberVO> chatIter = sessionUsersMap.get(room).iterator();
		while(chatIter.hasNext()){
			ChatMemberVO chatVo = chatIter.next();
			if(userSession.equals(chatVo.getSession())){
				delName = chatVo.getNickname();
				//sessionUsers.remove(chatVo);
				chatIter.remove();
			}
		}
		if(sessionUsersMap.get(room).size() > 0 ) {	
			sendToAll(room, "System", delName + "님이 퇴장했습니다.");
		}else {
			
		}
		
		// 채팅 방 목록과 해당 방의 멤버 목록을 갱신하는 메서드 호출
		roomUpdateAll(userSession);

	}
	
	/**
     * 웹 소켓이 에러가 나면 호출되는 이벤트
     * @param t
     */
    @OnError
    public void handleError(Throwable t){
        t.printStackTrace();
    }
    
	
	/**
	 * json타입의 메시지 만들기
	 * @param username
	 * @param message
	 * @return
	 */
	public String buildJsonData(String username, String message, Session userSession){
		Gson gson = new Gson();
		Map<String, String> jsonMap = new HashMap<String, String>();
		
		if(message!=null) {
			jsonMap.put("username", username);
			jsonMap.put("message", message);
		}
		
		if(userSession!=null) {
			List<String> roomList = new ArrayList<String>(sessionUsersMap.keySet());
			//System.out.println("roomList ===> " + roomList);
			
			String room = (String) userSession.getUserProperties().get("room");
			
			List<String> roomMemList = new ArrayList<>();
			for(ChatMemberVO dditCharVo : sessionUsersMap.get(room))	{
				roomMemList.add(dditCharVo.getNickname());
			}
			//System.out.println("roomMemList ===> " + roomMemList);
			
			jsonMap.put("roomName", room);
			jsonMap.put("roomList", gson.toJson(roomList));
			jsonMap.put("roomMemList", gson.toJson(roomMemList));
		}
		String strJson = gson.toJson(jsonMap);
		System.out.println("strJson = " + strJson);
		
		return strJson;
		
		
	}
}





