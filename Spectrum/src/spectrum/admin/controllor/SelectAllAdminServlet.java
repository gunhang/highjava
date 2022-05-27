package spectrum.admin.controllor;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.admin.service.AdminServiceImpl;
import spectrum.admin.service.IAdminService;
import spectrum.admin.vo.AdminVO;

@WebServlet("/admin/adminlist.do")
public class SelectAllAdminServlet extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			// 1. 서비스 객체 생성하기
			IAdminService adService = AdminServiceImpl.getInstance();
			
			// 2. 회원정보 조회
			List<AdminVO> adList = adService.getALLAdminList();
			
			req.setAttribute("adList", adList);
			
			RequestDispatcher dispatcher = 
			req.getRequestDispatcher("/WEB-INF/views/admin/adminlist.jsp");
			dispatcher.forward(req, resp); // 뷰페이지로 전달
			
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
}
