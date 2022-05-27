package spctrum.report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spctrum.report.vo.ReportVO;

import spectrum.util.SqlMapClientFactory;

public class ReportDaoImpl implements IReportDao {
	
	
	
	private static IReportDao reportDao;
	
	private SqlMapClient smc;
	
	private ReportDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IReportDao getInstance() {
		if(reportDao == null) {
			reportDao = new ReportDaoImpl(); 
		}
		return reportDao;
	}

	@Override
	public List<ReportVO> getALLUserReportList() {
		List<ReportVO> reportUserList = new ArrayList<ReportVO>();
		
		try {
			reportUserList = smc.queryForList("report.getALLUserReportList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reportUserList;
	}

	@Override
	public List<ReportVO> getALLBoardReportList() {
		List<ReportVO> reportBoardList = new ArrayList<ReportVO>();
		
		try {
			reportBoardList = smc.queryForList("report.getALLBoardReportList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reportBoardList;
	}

	@Override
	public int deleteBoardReport(String boardreportNumber) {
		int cnt = 0;
		
		try {
			smc.delete("report.deleteBoardReport", boardreportNumber);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteUserReport(String memberReportNum) {
		int cnt = 0;
		
		try {
			smc.delete("report.deleteUserReport", memberReportNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteBoardUseIdReport(String memberId) {
		int cnt = 0;
		
		try {
			smc.delete("report.deleteBoardUseIdReport", memberId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteUserUseIdReport(String memberReportedId) {
		int cnt = 0;
		
		try {
			smc.delete("report.deleteUserUseIdReport", memberReportedId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}


}
