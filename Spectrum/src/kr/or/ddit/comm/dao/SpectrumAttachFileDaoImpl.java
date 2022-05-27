package kr.or.ddit.comm.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.myspectrum.vo.SpectrumAttachFileVO;
import spectrum.util.SqlMapClientFactory;


public class SpectrumAttachFileDaoImpl implements ISpectrumAttachFileDao {
	
	private static ISpectrumAttachFileDao fileDao;
	private SqlMapClient smc;
	
	private SpectrumAttachFileDaoImpl() {
     smc = SqlMapClientFactory.getInstance();
	}
	
	public static ISpectrumAttachFileDao getInstance() {
		if(fileDao == null) {
			fileDao = new SpectrumAttachFileDaoImpl();
		}
		return fileDao;
	}

	@Override
	public int insertAtchFile(SpectrumAttachFileVO spectrumAttachFileVO) throws SQLException {
        int cnt = 0; 
        
        Object obj = smc.insert("atchFile.insertAtchFile", spectrumAttachFileVO);
        
       if(obj ==null) {
        	cnt=1;
       }
		return cnt;
	  }

	@Override
	public int insertAtchFileDetail(SpectrumAttachFileVO spectrumAttachFileVO) throws SQLException {
		   int cnt = 0; 
	        
	        Object obj = smc.insert("atchFile.insertAtchFileDetail", spectrumAttachFileVO);
	        
	       if(obj ==null) {
	        	cnt=1;
	       }
			return cnt;
		  }

	@Override
	public List<SpectrumAttachFileVO> getAtchFileList(SpectrumAttachFileVO spectrumAttachFileVO) throws SQLException {

		  List<SpectrumAttachFileVO> atchFileList = smc.queryForList("atchFile.getAtchFileList", spectrumAttachFileVO);
		
		return atchFileList;
	}

	@Override
	public SpectrumAttachFileVO getAtchFileDetail(SpectrumAttachFileVO spectrumAttachFileVO) throws SQLException {
		SpectrumAttachFileVO fileVO = (SpectrumAttachFileVO)smc.queryForObject("atchFile.getAtchFileDetail",spectrumAttachFileVO);
		return fileVO;
	}
	
	
	public SpectrumAttachFileVO getFileName(long str) {
		SpectrumAttachFileVO url=null;
			try {
				url =(SpectrumAttachFileVO) smc.queryForObject("atchFile.filePath",str);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return url;
	}

}
