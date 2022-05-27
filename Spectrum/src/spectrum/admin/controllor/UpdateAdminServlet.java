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

@WebServlet("/admin/adminupdate.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)
public class UpdateAdminServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String adminId = req.getParameter("adminId");
				
		// 2. 서비스 객체 가져오기
		IAdminService adService =
				AdminServiceImpl.getInstance();
		
				
		// 3. 회원정보 조회
		AdminVO av = adService.getAdmin(adminId);
		
		
		
		req.setAttribute("av", av);
		
		
		// 4. 업데이트 화면으로 포워딩
		req.getRequestDispatcher("/WEB-INF/views/admin/adminupdateForm.jsp")
			.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 요청 파라미터 정보 가져오기
		String adminId = req.getParameter("adminId");
		String adminPassword = req.getParameter("adminPassword");
		String adminRegno = req.getParameter("adminRegno");
		String adminPhonenum = req.getParameter("adminPhonenum");
		String adminZipcode = req.getParameter("adminZipcode");
		String adminMail = req.getParameter("adminMail");
		String adminNickname = req.getParameter("adminNickname");
		String adminAddr1 = req.getParameter("adminAddr1");
		String adminAddr2 = req.getParameter("adminAddr2");
	
								
		// 2. 서비스 객체 생성하기
		IAdminService adService =
				AdminServiceImpl.getInstance();
		
	
		// 3. 회원정보 수정
		
		AdminVO av = new AdminVO();
		av.setAdminId(adminId);
		av.setAdminAddr1(adminAddr1);
		av.setAdminAddr2(adminAddr2);
		av.setAdminMail(adminMail);
		av.setAdminNickname(adminNickname);
		av.setAdminPassword(adminPassword);
		av.setAdminPhonenum(adminPhonenum);
		av.setAdminRegno(adminRegno);
		av.setAdminZipcode(adminZipcode);
	
		
		int cnt = adService.updateAdmin(av);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.setAttribute("msg", msg);
		
		// 4. 목록 조회화면으로 이동
		/*req.getRequestDispatcher("/member/list.do")
			.forward(req, resp);*/
		String redirecturl =req.getContextPath() + "/admin/admindetail.do?msg=" + URLEncoder.encode(msg, "UTF-8")+"&&adminId=" +adminId;
													
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
}
