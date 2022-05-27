package spectrum.mbtiResult.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiResult.vo.MbtiResultVO;
import spectrum.member.vo.MemberVO;
import spectrum.util.SqlMapClientFactory;

public class MbtiResultDao {
	private static MbtiResultDao mbtiResultDao;
	private SqlMapClient smc;
	
	private MbtiResultDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static MbtiResultDao getInstasnce() {
		if(mbtiResultDao == null) {
			mbtiResultDao = new MbtiResultDao();
			}
			return mbtiResultDao;
	}
	
	public int insertBasicMbtiResult(MbtiResultVO vo) {
		int cnt = 0;

		try {
			cnt = smc.update("mbtiResult.insertBasicMbtiResult", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int insertExtraMbtiResult(MbtiResultVO vo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("mbtiResult.insertExtraMbtiResult", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int updateMbtiResultLatestN(String memberId) {
		
		int cnt = 0;
		try {
			cnt = smc.update("mbtiResult.updateMbtiResultLatestN", memberId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public int updateMbtiResultLatestY(String memberId) {
		
		int cnt = 0;
		try {
			cnt = smc.update("mbtiResult.updateMbtiResultLatestY", memberId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public int updateMbtiCodeMember(MemberVO vo) {
		
		int cnt = 0;
		try {
			cnt = smc.update("mbtiResult.updateMbtiCodeMember", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int deleteMbtiResult(String mbtiResultUniquekey) {
		
		int cnt = 0;
		try {
			cnt = smc.update("mbtiResult.deleteMbtiResult", mbtiResultUniquekey);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public MbtiResultVO getMbtiResult(String memberId) {
		MbtiResultVO vo = new MbtiResultVO();
		try {
			vo = (MbtiResultVO) smc.queryForObject("mbtiResult.getMbtiResult", memberId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	public MbtiResultVO getMbtiResultByUniquekey(String mbtiResultUniquekey) {
		MbtiResultVO vo = new MbtiResultVO();
		try {
			vo = (MbtiResultVO) smc.queryForObject("mbtiResult.getMbtiResultByUniquekey", mbtiResultUniquekey);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<MbtiResultVO>getMbtiResultAll() {
		List<MbtiResultVO> resultList = new ArrayList<MbtiResultVO>();
		try {
			resultList = smc.queryForList("mbtiResult.getMbtiResultAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	
}


