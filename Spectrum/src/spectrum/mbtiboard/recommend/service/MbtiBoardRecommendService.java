package spectrum.mbtiboard.recommend.service;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiboard.recommend.dao.MbtiBoardRecommendDao;
import spectrum.mbtiboard.recommend.vo.MbtiBoardRecommendVO;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.util.SqlMapClientFactory;

public class MbtiBoardRecommendService {
	private static MbtiBoardRecommendService service;
	private MbtiBoardRecommendService() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static MbtiBoardRecommendService getInstance() {
		if(service==null) {
			service = new MbtiBoardRecommendService();
		}
		return service;
	}
	public void recommendInsert(MbtiBoardRecommendVO mrv) {
		MbtiBoardRecommendDao.getInstance().recommendInsert(mrv);
		
	}
	public void recommendupdate(MbtiBoardRecommendVO mrv) {
		MbtiBoardRecommendDao.getInstance().recommendupdate(mrv);
	}
	public String recommendYn(MbtiBoardRecommendVO mrv) {
		return MbtiBoardRecommendDao.getInstance().recommendYn(mrv);
	}
	public void recommend(MbtiBoardVO mv) {// 업데이트
		MbtiBoardRecommendDao.getInstance().recommend(mv);
	}
	public String getRecommend(String boardNum) {
		return MbtiBoardRecommendDao.getInstance().getRecommend(boardNum);
	}
	
}
