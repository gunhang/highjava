package spectrum.myspectrum.boardre.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.myspectrum.boardre.controller.MyspectrumBoardReInsert;
import spectrum.myspectrum.boardre.controller.MyspectrumBoardReList;
import spectrum.myspectrum.boardre.dao.MyspectrumBoardReDao;
import spectrum.myspectrum.vo.SpectrumBoardVO;
import spectrum.util.SqlMapClientFactory;

public class MyspectrumBoardReService {
	private static MyspectrumBoardReService service;
	
	private SqlMapClient smc;
	
	private MyspectrumBoardReService() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static MyspectrumBoardReService getInstance() {
		if(service==null) {
			service=new MyspectrumBoardReService();
		}
		return service;
	}
	public List<SpectrumBoardVO> spectrumBoardReSelect(String parent) {
		return MyspectrumBoardReDao.getInstance().spectrumBoardReSelect(parent);
	}
	
	public void spectrumBoardInsert(SpectrumBoardVO sbv) {
		MyspectrumBoardReDao.getInstance().spectrumBoardInsert(sbv);
		
		
	}
	public void spectrumBoardUpdate(SpectrumBoardVO sbv) {
		MyspectrumBoardReDao.getInstance().spectrumBoardUpdate(sbv);
		
		
	}
	public void spectrumBoardDelete(String boardNum) {
		MyspectrumBoardReDao.getInstance().spectrumBoardDelete(boardNum);
		
	}
	public String parent (String boardNum) {
		return MyspectrumBoardReDao.getInstance().parent(boardNum);
		
	}
	
	
	
	
	
	
}
