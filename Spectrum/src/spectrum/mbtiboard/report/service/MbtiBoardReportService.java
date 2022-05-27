package spectrum.mbtiboard.report.service;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiboard.report.dao.MbtiBoardReportDao;
import spectrum.mbtiboard.report.vo.MbtiBoardReportVO;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.util.SqlMapClientFactory;

public class MbtiBoardReportService {
	private static MbtiBoardReportService dao;
	private MbtiBoardReportService() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static MbtiBoardReportService getInstance() {
		if(dao==null) {
			dao = new MbtiBoardReportService();
		}
		return dao;
	}
	public String reportCheck(MbtiBoardReportVO reportVO) {
		return MbtiBoardReportDao.getInstance().reportCheck(reportVO);
		
	}
	
	public void reportInsert(MbtiBoardReportVO reportVO) {
		MbtiBoardReportDao.getInstance().reportInsert(reportVO);
		
	}
	public String count(String boardNum) {
		return MbtiBoardReportDao.getInstance().count(boardNum);
		
	}
	public void boardReportNum(MbtiBoardVO mv) {
		MbtiBoardReportDao.getInstance().boardReportNum(mv);
		
	}
}
