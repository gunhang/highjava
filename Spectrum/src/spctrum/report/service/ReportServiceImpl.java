package spctrum.report.service;

import java.util.List;

import spctrum.report.dao.IReportDao;
import spctrum.report.dao.ReportDaoImpl;
import spctrum.report.vo.ReportVO;
import spectrum.blacklist.dao.BlacklistDaoImpl;
import spectrum.blacklist.dao.IBlacklistDao;
import spectrum.blacklist.service.BlacklistServiceImpl;
import spectrum.blacklist.service.IBlacklistService;
import spectrum.blacklist.vo.BlacklistVO;

public class ReportServiceImpl implements IReportService {
	
	private static IReportService reportService;
	
		// 사용할 DAO의 객체변수를 선언한다.
	private IReportDao reportDao;

	private ReportServiceImpl(){
		reportDao = ReportDaoImpl.getInstance();
	}
	
	public static IReportService getInstance() {
		if(reportService == null) {
			reportService = new ReportServiceImpl();
		}
		return reportService;
	}


	@Override
	public List<ReportVO> getALLUserReportList() {
		return reportDao.getALLUserReportList();
		
	}

	@Override
	public List<ReportVO> getALLBoardReportList() {
		return reportDao.getALLBoardReportList();
		
	}

	@Override
	public int deleteBoardReport(String boardreportNumber) {
		return reportDao.deleteBoardReport(boardreportNumber);
	}

	@Override
	public int deleteUserReport(String memberReportNum) {
		return reportDao.deleteUserReport(memberReportNum);
		
	}

	@Override
	public int deleteBoardUseIdReport(String memberId) {
		return reportDao.deleteBoardUseIdReport(memberId);
	}

	@Override
	public int deleteUserUseIdReport(String memberReportedId) {
		return reportDao.deleteUserUseIdReport(memberReportedId);
	}

}
