package spectrum.board.fame.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.board.fame.dao.FameBoardDao;
import spectrum.board.fame.vo.BoardFameVO;
import spectrum.util.SqlMapClientFactory;

public class FameBoardService {
	private static FameBoardService service;
	private SqlMapClient smc;
	
	private FameBoardService() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static FameBoardService getInstance() {
		if(service == null) {
			service = new FameBoardService();
		}
		return service;
	}
	public List<BoardFameVO> boardFameSelect() {
		return FameBoardDao.getInstance().boardFameSelect();
	}
}
