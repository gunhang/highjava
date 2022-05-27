package spectrum.blacklist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;


import spectrum.blacklist.vo.BlacklistVO;
import spectrum.util.SqlMapClientFactory;

public class BlacklistDaoImpl implements IBlacklistDao {
	
	
	private static IBlacklistDao blackDao;
	
	private SqlMapClient smc;
	
	private BlacklistDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IBlacklistDao getInstance() {
		if(blackDao == null) {
			blackDao = new BlacklistDaoImpl(); 
		}
		return blackDao;
	}
	
	
	@Override
	public List<BlacklistVO> getALLBlackList() {
		
		List<BlacklistVO> blackList = new ArrayList<BlacklistVO>();
		
		try {
			blackList = smc.queryForList("blacklist.getBlacklistAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return blackList;
	}

	@Override
	public BlacklistVO getBlacklist(String blacklistNumber) {
		
		BlacklistVO bv = new BlacklistVO();
		
		try {
			bv = (BlacklistVO)smc.queryForObject("blacklist.getBlacklist", blacklistNumber);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return bv;
	}

	@Override
	public int deleteBlacklist(String blacklistNumber) {
		int cnt = 0;
		
		try {
			cnt = smc.delete("blacklist.deleteBlacklist", blacklistNumber);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertBlacklist(BlacklistVO bv) {
		int cnt = 0;
		
		try {
			cnt = smc.update("blacklist.insertBlacklist", bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int getReportcount(String memberId) {

		int cnt = 0;
		
		try {
			cnt = (Integer)smc.queryForObject("blacklist.getReportcount", memberId);
			   
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertBlacklistAuto(String memberId) {
	int cnt = 0;
		
		try {
			cnt = smc.update("blacklist.insertBlacklistAuto", memberId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertBlacklistAutoBanDuplication(String memberId) {
		int cnt = 0;
		
		try {
			cnt = smc.delete("blacklist.insertBlacklistAutoBanDuplication", memberId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<BlacklistVO> getMemberlistAll() {
		List<BlacklistVO> blackList = new ArrayList<BlacklistVO>();
		
		try {
			blackList = smc.queryForList("blacklist.getMemberlistAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return blackList;
	}

	@Override
	public String gettoBlacklistCheck(String memberId) {
		String cnt="";
		
		try {
			cnt = (String) smc.queryForObject("blacklist.gettoBlacklistCheck", memberId);
			   
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public String getMemberSigndate(String memberId) {
		String cnt="";
		
		try {
			cnt = (String) smc.queryForObject("blacklist.gettoBlacklistCheck", memberId);
			   
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return cnt;
	}
	
}
