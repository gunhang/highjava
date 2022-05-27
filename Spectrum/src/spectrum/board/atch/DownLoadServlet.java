package spectrum.board.atch;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/mbtiboard/mbtidownload")
public class DownLoadServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String atchFileId= req.getParameter("fileId") != null ?
				req.getParameter("fileId") :"-1";
		String fileSn = req.getParameter("fileSn")!=null?
				req.getParameter("fileSn") :"1";
				
		// 파일 세부 정보 조회
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = new AtchFileVO();
		atchFileVO.setBoardAttachmentId(atchFileId);
		atchFileVO.setBoardatcdtlNum(fileSn);
		
		try {
			atchFileVO =fileService.getAtchFileDetail(atchFileVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//파일 다운로드 처리를 위한 응답헤드 정보 설정하기
		resp.setContentType("application/octet-stream");
		//URL에는 공백문자를  포함할수 없다. URLEncoding을이용하여 인공딩 작업을 하면
		// 공백은 (+) 로표시되기뙈문이 ㅁ+문자를 공백문자인 %20으로 바꿔준다
		resp.setHeader("Content-Disposition", "attachment; filename=\""+
		URLEncoder.encode(atchFileVO.getBoardatcdtlOriginalname(), "UTF-8").replaceAll("\\+", "%20")+"\"");
		
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(atchFileVO.getBoardatcdtlPath()));
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
		
		int c = 0;
		while((c=bis.read())!= -1) {
			bos.write(c);
		}
		bis.close();
		bos.close();
		
		
		
				
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
