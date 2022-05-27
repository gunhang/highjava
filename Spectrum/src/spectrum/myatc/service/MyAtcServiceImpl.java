package spectrum.myatc.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import spectrum.myatc.dao.IMyAtcDao;
import spectrum.myatc.dao.MyAtcDaoImpl;
import spectrum.myatc.vo.MyAtcVO;

public class MyAtcServiceImpl implements IMyAtcService {
	
	private static IMyAtcService fileService;
	private IMyAtcDao atchFileDao;
	private static final String UPLOAD_DIR = "upload_files";
	
	private MyAtcServiceImpl() {
		atchFileDao = MyAtcDaoImpl.getInstance();
	}
	
	public static IMyAtcService getInstance() {
		if(fileService == null) {
			fileService = new MyAtcServiceImpl();
		}
		
		return fileService;
	}
	@Override
	public MyAtcVO saveAtchFileList(HttpServletRequest req) throws Exception {
		
		
		String uploadPath = "C:\\Users\\PC-22\\git\\spectrum\\WebContent\\imeges";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		MyAtcVO MyAtcVO = null;
		
		String fileName = "";
		boolean isFirstFile = true; // 첫번째 파일 여부
		
		for(Part part : req.getParts()) {
					
			fileName = getFileName(part);
			if(fileName != null && !fileName.equals("")) {
				// 파일이 비어있지 않은 경우...(업로드할 파일이 존재하는 경우)
				
				if(isFirstFile) { // 첫번째 업로드 파일인 경우
					isFirstFile = false;
					
					// 파일 기본정보 저장하기
					MyAtcVO = new MyAtcVO();
					HttpSession session = req.getSession();
					String memberId = (String) session.getAttribute("memberId");
					
					MyAtcVO.setMemberId(memberId);
					// 기본 파일정보 저장(VO에 atchFileId가 저장된다.)
					atchFileDao.insertAtchFile(MyAtcVO);

					
				}
				
				String myflofileatcdtlOriginalname = fileName; // 원본파일명
				long myflofileatcdtlSize = part.getSize(); // 파일 사이즈
				String myflofileatcdtlStrefilenm = ""; // 저장 파일명
				String myflofileatcdtlPath = ""; // 저장 파일경로
				File storeFile = null;    // 저장 파일 객체
				
				
				do {
					// 저장파일명 추출
					myflofileatcdtlStrefilenm = UUID.randomUUID().toString().replace("-", "");
					
					myflofileatcdtlPath = uploadPath + File.separator + myflofileatcdtlStrefilenm;
					storeFile = new File(myflofileatcdtlPath);
					
				}while(storeFile.exists()); // 저장파일명 중복되는지 체크
				
				// 확장명 추출
				String myflofileatcdtlExtension = myflofileatcdtlOriginalname.lastIndexOf(".") < 0 ?
						"" : myflofileatcdtlOriginalname.substring(
								myflofileatcdtlOriginalname.lastIndexOf(".") + 1);
				part.write(myflofileatcdtlPath); // 업로드 파일 저장
				
				
			
				MyAtcVO.setMyflofileatcdtlStrefilenm(myflofileatcdtlStrefilenm);
				MyAtcVO.setMyflofileatcdtlSize(myflofileatcdtlSize);
				MyAtcVO.setMyflofileatcdtlOriginalname(myflofileatcdtlOriginalname);
				MyAtcVO.setMyflofileatcdtlPath(myflofileatcdtlPath);
				MyAtcVO.setMyflofileatcdtlExtension(myflofileatcdtlExtension);
				
				// 파일 세부정보 저장
				atchFileDao.insertAtchFileDetail(MyAtcVO);
				
				part.delete(); // 임시 업로드 파일 삭제하기
				
				
			}
			
		}
		
		return MyAtcVO;
	}
	
	private String getFileName(Part part) {
		
			for(String content 
					: part.getHeader("Content-Disposition").split(";")) {
				
				if(content.trim().startsWith("filename")) {
					return content.substring(content.indexOf("=") + 1)
							.trim().replace("\"", "");
				}
			}
			
			return null;
	}



	@Override
	public List<MyAtcVO> getAtchFileList(MyAtcVO MyAtcVO) throws SQLException {
		
		return atchFileDao.getAtchFileList(MyAtcVO);
	}

	@Override
	public MyAtcVO getAtchFileDetail(MyAtcVO MyAtcVO) throws SQLException {
		return atchFileDao.getAtchFileDetail(MyAtcVO);
	}

	@Override
	public String getAtcId(String memberId) {
		return atchFileDao.getAtcId(memberId);
	}

	@Override
	public List<MyAtcVO> getALLAtcDtlList(String myflofileatcId) {
		return atchFileDao.getALLAtcDtlList(myflofileatcId);
	}

	@Override
	public int updateAtcId(MyAtcVO atchFileVO) {
		return atchFileDao.updateAtcId(atchFileVO);
	}







	
}
