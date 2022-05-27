package spectrum.chat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.member.dao.MemberDao;
import spectrum.member.dao.MemberDaoImpl;
import spectrum.member.vo.MemberVO;

@WebServlet("/mbtiPrivateChatWaiting")
public class MbtiPrivateChatWaiting extends HttpServlet{
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 req.getRequestDispatcher("/WEB-INF/views/chat/mbtiPrivateChatWaiting.jsp").forward(req, resp);
	}
	 
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession();
		 
		 String chatMbtiSelect = req.getParameter("chatMbtiSelect");
		 String memberId = (String) session.getAttribute("memberId");
		 String roomName = chatMbtiSelect+"/"+memberId+"/"+session.getAttribute("mbtiCode");
		 String checkRoom = MbtiPrivateChat.checkRoom((String) session.getAttribute("mbtiCode"), chatMbtiSelect);
		 if(checkRoom.equals("0")) {
			 session.setAttribute("privateRoomName", roomName);
		 }else {
			 session.setAttribute("privateRoomName", checkRoom);
		 }
		 session.setAttribute("chatMbtiSelect", chatMbtiSelect);
		 MemberDao memberDao = MemberDaoImpl.getInstance();
		 memberDao.updateChatHartnum(memberId);
		 System.out.println(memberId +" 채팅요청 하트1개 차감");
		 MemberVO mv = memberDao.getMember(memberId);
		 session.setAttribute("mv", mv);
		 System.out.println(memberId + " 현재 하트 개수: " +mv.getMemberHartnum());
		 req.getRequestDispatcher("/WEB-INF/views/chat/mbtiPrivateChat.jsp").forward(req, resp);;
	 }
	
	
}
