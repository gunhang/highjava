package spectrum.board.atch;

import java.sql.SQLException;
import java.util.List;


import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.util.SqlMapClientFactory;


public class AtchFileDaoImpl implements IAtchFileDao{
	private static IAtchFileDao fileDao;
	private SqlMapClient smc;
	private AtchFileDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IAtchFileDao getInstance() {
		if(fileDao==null) {
			fileDao = new AtchFileDaoImpl();
		}
		return fileDao;
	}
	@Override
	public int insertAtchFile(AtchFileVO atchFileVO) throws SQLException {

		int cnt =0;
		
		Object obj = smc.insert("boardatchFile.insertAtchFile",atchFileVO);
		
		if(obj == null) {
			cnt =1;
		}
			
		return cnt;
	}
	@Override
	public int insertAtchFileDetail(AtchFileVO atchFileVO) throws SQLException {
		int cnt =0;
		
		Object obj = smc.insert("boardatchFile.insertAtchFileDetail",atchFileVO);
		
		if(obj == null) {
			cnt =1;
		}
			
		return cnt;
	}
	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) throws SQLException {
		
		List<AtchFileVO> atchFileList = 
				smc.queryForList("boardatchFile.getAtchFileList",atchFileVO);
		
		return atchFileList;
	}
	@Override
	public AtchFileVO getAtchFileDetaul(AtchFileVO atchFileVO) throws SQLException {
		AtchFileVO FileVO = 
				(AtchFileVO) smc.queryForObject("boardatchFile.getAtchFileDetail",atchFileVO);
		
		return FileVO;
	}
	
}
