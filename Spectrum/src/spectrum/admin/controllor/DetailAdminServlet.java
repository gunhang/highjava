package spectrum.admin.controllor;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.admin.service.AdminServiceImpl;
import spectrum.admin.service.IAdminService;
import spectrum.admin.vo.AdminVO;

@WebServlet("/admin/admindetail.do")
public class DetailAdminServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String adminId = req.getParameter("adminId");
		
		// 2. 서비스 객체 가져오기
		IAdminService adService = AdminServiceImpl.getInstance();
		
		
		
		// 3. 회원정보 조회
		AdminVO av = adService.getAdmin(adminId);
		
	
		
		req.setAttribute("av", av);
		
		// 결과를 VIEW화면에 출력하기
		req.getRequestDispatcher("/WEB-INF/views/admin/admindetail.jsp")
				.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
