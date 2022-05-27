package spectrum.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.myspectrum.vo.FriendVO;

@WebServlet("/myFrindsUpdate.do")
public class UpdateFriendsServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String friendId = req.getParameter("friendId");
		HttpSession session = req.getSession();
		String memId =  (String)session.getAttribute("memberId");
		FriendVO fv = new FriendVO();
		fv.setFriendAppliedId(memId);
		fv.setFriendRequestedId(friendId);
		MemberServiceImpl.getInstance().updateFriends(fv);
		
		req.getRequestDispatcher("myFriendsList.do").forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
