package spectrum.mbtiSurvey.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiSurvey.vo.MbtiSurveyVO;
import spectrum.util.SqlMapClientFactory;

public class MbtiSurveyDao {
	private static MbtiSurveyDao mbtiSurveyDao;
	private SqlMapClient smc;
	
	private MbtiSurveyDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static MbtiSurveyDao getInstasnce() {
		if(mbtiSurveyDao == null) {
			mbtiSurveyDao = new MbtiSurveyDao();
			}
			return mbtiSurveyDao;
	}
	
	public int insertMbtiSurvey(MbtiSurveyVO vo) {
		int cnt = 0;

		try {
			cnt = smc.update("mbtiSurvey.insertMbtiSurvey", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int updateMbtiSurvey(MbtiSurveyVO vo) {
		
		int cnt = 0;
		try {
			cnt = smc.update("mbtiSurvey.updateMbtiSurvey", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int deleteMbtiSurvey(String mbtiSurveyNumber) {
		
		int cnt = 0;
		try {
			cnt = smc.update("mbtiSurvey.deleteMbtiSurvey", mbtiSurveyNumber);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public MbtiSurveyVO getMbtiSurvey(String mbtiSurveyNumber) {
		MbtiSurveyVO vo = new MbtiSurveyVO();
		try {
			vo = (MbtiSurveyVO) smc.queryForObject("mbtiSurvey.getMbtiSurvey", mbtiSurveyNumber);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<MbtiSurveyVO>getBasicMbtiSurveyList() {
		List<MbtiSurveyVO> surveyList = new ArrayList<MbtiSurveyVO>();
		try {
			surveyList = smc.queryForList("mbtiSurvey.getBasicMbtiSurveyList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return surveyList;
	}
	
	public List<MbtiSurveyVO> getAllMbtiSurveyList() {
		List<MbtiSurveyVO> surveyList = new ArrayList<MbtiSurveyVO>();
		try {
			surveyList = smc.queryForList("mbtiSurvey.getMbtiSurveyAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return surveyList;
	}
	
}
