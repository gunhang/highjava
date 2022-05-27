package kr.or.ddit.comm.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import kr.or.ddit.comm.dao.SpectrumAttachFileDaoImpl;
import kr.or.ddit.comm.dao.ISpectrumAttachFileDao;
import spectrum.myspectrum.vo.SpectrumAttachFileVO;


public class SpectrumAtchFileServiceImpl implements ISpectrumAtchFileService{

	 private static final String UPLOAD_DIR = "upload_files";
	 
	private static ISpectrumAtchFileService fileService;
	private ISpectrumAttachFileDao atchFileDao;

	private SpectrumAtchFileServiceImpl() {
		 atchFileDao = SpectrumAttachFileDaoImpl.getInstance();
	}
	
	public static ISpectrumAtchFileService getInstance() {
		if(fileService == null) {
			fileService = new SpectrumAtchFileServiceImpl();
		}
		return fileService;
	}

	@Override
	public SpectrumAttachFileVO saveAtchFileList(HttpServletRequest req) throws Exception {
		

		String uploadPath = "C:\\Users\\PC-03\\git\\spectrum\\WebContent"; // 이쪽으로 파일 경로가 저장됨 .
		//String uploadPath = req.getServletContext().getRealPath("")
	    //		  + File.separator + UPLOAD_DIR;
	      File uploadDir = new File(uploadPath);
	      if(!uploadDir.exists()) {
	    	  uploadDir.mkdir();
	      }
	      
	      SpectrumAttachFileVO spectrumAttachFileVO = null;
	      
	      String fileName = "";
	      boolean isFirstFile = true; //첫번째 파일 여부
	      
	      for(Part part : req.getParts()) {
    		  
    		  
    		  fileName = getFileName(part);
    		  if(fileName != null && !fileName.equals("")) {
    			  //파일이 비어있지 않은 경우..(업로드할 파일이 존재하는 경우)
    			
    			 if(isFirstFile) {  //첫번째 업로드 파일인 경우
    				 isFirstFile = false;
    				 
    				 //파일 기본정보 저장하기
    				 spectrumAttachFileVO = new SpectrumAttachFileVO();
    				 
    				 //기본 파일정보 저장(VO에 atchFileId가 저장된다.)
    				 atchFileDao.insertAtchFile(spectrumAttachFileVO);
    			 }
    			    
    			    String orignFileName = fileName; //원본파일명
    			    long fileSize = part.getSize(); //파일 사이즈
    			    String saveFileName = ""; //저장파일명
    			    String saveFilePath = ""; //저장 파일경로
    			    File storeFile = null;  //저장 파일 객체
    			    
    			    do {
    			    	//저장파일명 추출
    			    	saveFileName = UUID.randomUUID().toString().replace("-", "");
    			    	
    			    	saveFilePath =uploadPath + File.separator + saveFileName;
    			    	storeFile = new File(saveFilePath);
    			    	
    			    	
    			    }while(storeFile.exists()); //저장 파일명 중복되는 지 체크
    			    
    			    //확장형 추출
    			    String fileExtension = orignFileName.lastIndexOf(".") < 0 ?
    			    		"" : orignFileName.substring(orignFileName.lastIndexOf(".") + 1);
    			    
    			    part.write(saveFilePath); //업로드 파일 저장

    			    spectrumAttachFileVO.setSpctatcdtlType(saveFileName);
    			    spectrumAttachFileVO.setSpctatcdtlSize(fileSize);
    			    spectrumAttachFileVO.setSpctatcdtlOriginalname(orignFileName);
    			    spectrumAttachFileVO.setSpctatcdtlPath(saveFilePath);
    			    spectrumAttachFileVO.setSpctatcdtlExtension(fileExtension);
    			    
    			    //파일 세부정보 저장
    			    atchFileDao.insertAtchFileDetail(spectrumAttachFileVO);
    			    
    			    part.delete(); //임시 업로드 파일 삭제하기
    			    
    		  }
    	  }
	      
	      return spectrumAttachFileVO;
		
	}

	@Override
	public List<SpectrumAttachFileVO> getAtchFileList(SpectrumAttachFileVO spectrumAttachFileVO) throws SQLException {
       return atchFileDao.getAtchFileList(spectrumAttachFileVO);

	}

	@Override
	public SpectrumAttachFileVO getAtchFileDetail(SpectrumAttachFileVO spectrumAttachFileVO) throws SQLException {
		 return atchFileDao.getAtchFileDetail(spectrumAttachFileVO);
				 
	}
	   /**
     * Part 객체 파싱하여 파일이름 추출하기
     * @param part
     * @return 파일명 : 파일명이 존재하지 않으면 NULL값 리턴함(폼필드)
     */
	private String getFileName(Part part) {
	
	
		
		   for(String content : part.getHeader("Content-Disposition").split(";")) {
			   
			   if(content.trim().startsWith("filename")) {
				   return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			   }
		   }
		
		
		return null;
	}
	public SpectrumAttachFileVO getFileName(long str) {
		return SpectrumAttachFileDaoImpl.getInstance().getFileName(str);
		
	}
	 
}
