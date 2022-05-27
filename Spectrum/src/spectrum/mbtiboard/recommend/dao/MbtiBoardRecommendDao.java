package spectrum.mbtiboard.recommend.dao;

import java.sql.SQLException;


import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiboard.dao.MbtiBoardDao;
import spectrum.mbtiboard.recommend.vo.MbtiBoardRecommendVO;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.util.SqlMapClientFactory;

public class MbtiBoardRecommendDao {
	private static MbtiBoardRecommendDao dao;
	private MbtiBoardRecommendDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static MbtiBoardRecommendDao getInstance() {
		if(dao==null) {
			dao = new MbtiBoardRecommendDao();
		}
		return dao;
	}
	public void recommendInsert(MbtiBoardRecommendVO mrv) {
		
		try {
			smc.insert("mbtiboardrecommend.recommend",mrv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public String recommendYn(MbtiBoardRecommendVO mrv) {
		String result = null;
		
		try {
			
			result=(String)smc.queryForObject("mbtiboardrecommend.recommendYn",mrv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public void recommendupdate(MbtiBoardRecommendVO mrv) {
		try {
			smc.update("mbtiboardrecommend.recommendupdate",mrv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void recommend(MbtiBoardVO mv) {
		try {
			smc.update("mbtiboardrecommend.recommendnumber", mv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getRecommend(String boardNum) {
		String result=null;
		try {
			result = (String)smc.queryForObject("mbtiboardrecommend.getrecommend", boardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
}
