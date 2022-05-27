package spectrum.anonymouseboard;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.myspectrum.boardre.service.MyspectrumBoardReService;
import spectrum.util.SqlMapClientFactory;

public class AnonymouseBoardService {
	private static AnonymouseBoardService service;
	
	private SqlMapClient smc;
	
	private AnonymouseBoardService() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static AnonymouseBoardService getInstance() {
		if(service==null) {
			service=new AnonymouseBoardService();
		}
		return service;
	}
	public AnonymouseBoardVO boardDetail(String boardNum) {
		return AnonymouseBoardDao.getInstance().boardDetail(boardNum);
	}
	public List<AnonymouseBoardVO> boardList() {
		return AnonymouseBoardDao.getInstance().boardList();
	}
	public void boardDelete(String boardNum) {
		AnonymouseBoardDao.getInstance().boardDelete(boardNum);
	}
	public void boardUpdate(AnonymouseBoardVO av) {
		AnonymouseBoardDao.getInstance().boardUpdate(av);
	}
	public void boardInsert(AnonymouseBoardVO av) {
		AnonymouseBoardDao.getInstance().boardInsert(av);
	}
	
	
	
}
