package spectrum.myspectrum.report.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiboard.recommend.dao.MbtiBoardRecommendDao;
import spectrum.mbtiboard.report.vo.MbtiBoardReportVO;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.report.vo.MemberReportVO;
import spectrum.util.SqlMapClientFactory;

public class MemberReportDao {
	private static MemberReportDao dao;
	private MemberReportDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static MemberReportDao getInstance() {
		if(dao==null) {
			dao = new MemberReportDao();
		}
		return dao;
	}
	public String reportCheck(MemberReportVO reportVO) {
		String result = null;
		try {
			result=(String)smc.queryForObject("memberreport.check",reportVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;		
	}
	
	public void reportInsert(MemberReportVO reportVO) {
		
		try {
			smc.insert("memberreport.reportinsert",reportVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public String count(String boardNum) {
		String result = null;
		
		try {
			result=(String)smc.queryForObject("memberreport.count",boardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public void ReportNum(MemberVO mv) {
		try {
			smc.update("memberreport.boardreportnum", mv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
