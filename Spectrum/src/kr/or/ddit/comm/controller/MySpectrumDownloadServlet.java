package kr.or.ddit.comm.controller;

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

import kr.or.ddit.comm.service.ISpectrumAtchFileService;
import kr.or.ddit.comm.service.SpectrumAtchFileServiceImpl;
import spectrum.myspectrum.vo.SpectrumAttachFileVO;


@WebServlet("/comm/mySpectrumDownload.do")
public class MySpectrumDownloadServlet extends HttpServlet{

	  @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     
		   long spctatcId = req.getParameter("spctatcId") != null ? Long.parseLong(req.getParameter("spctatcId")) : -1;
		   int spctatcdtlNum = req.getParameter("spctatcdtlNum") != null ? Integer.parseInt(req.getParameter("spctatcdtlNum")) : 1;
	  
	       // 파일 정보 세부 조회
		   ISpectrumAtchFileService fileService = SpectrumAtchFileServiceImpl.getInstance();
            
		   SpectrumAttachFileVO atchFileVO = new SpectrumAttachFileVO();
            atchFileVO.setSpctatcId(spctatcId);
            atchFileVO.setSpctatcdtlNum (spctatcdtlNum);
          
            try {
				atchFileVO = fileService.getAtchFileDetail(atchFileVO);
			} catch (SQLException e) {
				e.printStackTrace();
			}
                     
           //파일 다운로드 처리를 위한 응답헤더 정보 설정하기
            resp.setContentType("application/octet-stream");
            
            //URL에는 공백문자를 포함할 수 없다. URLEncoding을 이용하여 인코딩  작업을 하면 공백은(+)로 표시되기 때문에 +문자를 공백문자인 %20으로 바꿔준다. 
            resp.setHeader("Content-Disposition", "attachment; filename=\"" 
                          + URLEncoder.encode(atchFileVO.getSpctatcdtlOriginalname(),"UTF-8").replaceAll("\\+", "%20") +"\"");
		   
        
            
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(atchFileVO.getSpctatcdtlPath()));
        	 BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
       	 
       	 int c =0;
       	 while((c=bis.read())!=-1){
       		 bos.write(c);
       	 }
       	 
       	 bis.close();
       	 bos.close();
       	}
            
	  
	  
	  @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	}
}
