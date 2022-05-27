package spectrum.myspectrum.report.service;


import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiboard.report.dao.MbtiBoardReportDao;
import spectrum.mbtiboard.report.vo.MbtiBoardReportVO;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.member.dao.MemberDao;
import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.report.dao.MemberReportDao;
import spectrum.myspectrum.report.vo.MemberReportVO;
import spectrum.util.SqlMapClientFactory;

public class MemberReportService {
	private static MemberReportService dao;
	private MemberReportService() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static MemberReportService getInstance() {
		if(dao==null) {
			dao = new MemberReportService();
		}
		return dao;
	}
	public String reportCheck(MemberReportVO reportVO) {
		return MemberReportDao.getInstance().reportCheck(reportVO);
		
	} 
	
	public void reportInsert(MemberReportVO reportVO) {
		MemberReportDao.getInstance().reportInsert(reportVO);
		
	}
	public String count(String boardNum) {
		return MemberReportDao.getInstance().count(boardNum);
		
	}
	public void ReportNum(MemberVO mv) {
		MemberReportDao.getInstance().ReportNum(mv);
		
	}
}
