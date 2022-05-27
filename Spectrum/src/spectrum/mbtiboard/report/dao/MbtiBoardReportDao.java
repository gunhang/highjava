package spectrum.mbtiboard.report.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiboard.recommend.dao.MbtiBoardRecommendDao;
import spectrum.mbtiboard.report.vo.MbtiBoardReportVO;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.util.SqlMapClientFactory;

public class MbtiBoardReportDao {
	private static MbtiBoardReportDao dao;
	private MbtiBoardReportDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static MbtiBoardReportDao getInstance() {
		if(dao==null) {
			dao = new MbtiBoardReportDao();
		}
		return dao;
	}
	public String reportCheck(MbtiBoardReportVO reportVO) {
		String result = null;
		try {
			result=(String)smc.queryForObject("mbtiboardreport.check",reportVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;		
	}
	public void reportInsert(MbtiBoardReportVO reportVO) {
		
		try {
			smc.insert("mbtiboardreport.reportinsert",reportVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public String count(String boardNum) {
		String result = null;
		
		try {
			smc.queryForObject("mbtiboardreport.count",boardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public void boardReportNum(MbtiBoardVO mv) {
		try {
			smc.update("mbtiboardreport.boardreportnum", mv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
