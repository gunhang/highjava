package spectrum.board.atch;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class AtchFileServiceImpl implements IAtchFileService{
	private static IAtchFileService fileService;
	private IAtchFileDao atchFileDao;
	private static final String UPLOAD_DIR = "upload_files";
	private AtchFileServiceImpl() {
		atchFileDao = AtchFileDaoImpl.getInstance();
	}
	public static IAtchFileService getInstance() {
		if(fileService==null) {
			fileService=new AtchFileServiceImpl();
		}
		return fileService;
	}
	
	
	@Override
	public AtchFileVO saveAtchFileList(HttpServletRequest req) throws Exception {
		String uploadPath ="D:/D_Other/uploadFiles";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		AtchFileVO atchFileVO = null;
		
		String fileName="";
		boolean isFirstFile =true; // 첫번쨰 파일 여부
		for(Part part : req.getParts()) {
			
			fileName = getFileName(part);
			if(fileName != null && !fileName.equals("")) {
				//파일 이 비어있지 않은 경우....(업로드할 파일이 존재할경우) 
				
				if(isFirstFile) { //첫번째 업로드 파일인 경우...
					isFirstFile = false;
					
					//파일 기본정보 저장하기
					atchFileVO = new AtchFileVO();
					
					// 기본 파일정보 저장 (VO에 atchFileId가 저장된다.)
					atchFileDao.insertAtchFile(atchFileVO);
					
					
				}
				
				String orignFileName = fileName;//원본 파일명
				long fileSize= part.getSize();// 파일 사이즈
				String saveFileName = "";// 저장 파일명
				String saveFilePath ="";
				File storeFile = null ; //저장 파일 객체
				
				do {
					saveFileName = UUID.randomUUID().toString().replace("-", "");
					
					saveFilePath = uploadPath +File.separator+saveFileName;
					
					storeFile =new File(saveFilePath);
					
				}while(storeFile.exists());//저장파일명 중복되는지 체크
				
				// 확장명 추출
				String fileExtension = orignFileName.lastIndexOf(".")<0 ?
						"" : orignFileName.substring(orignFileName.indexOf(".")+1);
				
				part.write(saveFilePath); // 업로드 파일 저장
				
				atchFileVO.setBoardatcdtlType(saveFileName);
				atchFileVO.setBoardatcdtlSize(fileSize);
				atchFileVO.setBoardatcdtlOriginalname(orignFileName);
				atchFileVO.setBoardatcdtlPath(saveFilePath);
				atchFileVO.setBoardatcdtlExtension(fileExtension);
				
				//파일 세부정보 저장
				atchFileDao.insertAtchFileDetail(atchFileVO);
				
				part.delete(); // 임시업로드 파일 삭제
						
			}
		}
		
		
		return atchFileVO;
		
	}

	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) throws SQLException {
		// TODO Auto-generated method stub
		return atchFileDao.getAtchFileList(atchFileVO);
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) throws SQLException {
		// TODO Auto-generated method stub
		return atchFileDao.getAtchFileDetaul(atchFileVO);
	}
	private String getFileName(Part part) {
		/*
		 * Content-Disposition 헤더에 대하여 ...
			1.respone header에서 사용되는 경우 .. ex) 파일 다운로드
			Content-Disposition: inline(default)
			Content-Disposition: attachment //파일 다운로드
			Content-Disposition: attachment; filename="a.jpg"//해당이름으로 다운로드
			
			2.multipart body를 위한 헤더정보로 사용되는 경우.....  ex) 파일업로드
			Content-Disposition: form-data
			Content-Disposition: form-data; name="fieldName
			Content-Disposition: for,-data; name ="fileName";filename="a.jpg"
		 */
		
			for(String content : part.getHeader("Content-Disposition").split(";")) {
				
				// 파일명 ㄱ라져오기
				if(content.trim().startsWith("filename")) {
					return content.substring(content.indexOf("=")+1).trim().replace("\"", "" );
				}
			}
		
		return null;
	}
}
