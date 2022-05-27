package spectrum.admin.controllor;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import spectrum.admin.service.AdminServiceImpl;
import spectrum.admin.service.IAdminService;
import spectrum.admin.vo.AdminVO;

@WebServlet("/admin/admindelete.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)
public class DeleteAdminServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String adminId = req.getParameter("adminId");
				
		// 2. 서비스 객체 가져오기
		IAdminService adService =
				AdminServiceImpl.getInstance();
		
		
		
		AdminVO av = new AdminVO();
		av.setAdminId(adminId);	
		// 3. 회원정보 조회
		int cnt = adService.deleteAdmin(av);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.setAttribute("msg", msg);
		
		String redirecturl =req.getContextPath() + "/admin/adminlist.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
