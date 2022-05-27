package spectrum.rank.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.rank.vo.RankVO;

import spectrum.util.SqlMapClientFactory;

public class RankDaoImpl implements IRankDao {
	
	
	private static IRankDao rankDao;
	
	private SqlMapClient smc;
	
	private RankDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IRankDao getInstance() {
		if(rankDao == null) {
			rankDao = new RankDaoImpl();
		}
		return rankDao;
	}
	
	@Override
	public List<RankVO> getALLMemberWhiteList() {
		List<RankVO> whiteList = new ArrayList<RankVO>();
		
		try {
						
			whiteList = smc.queryForList("rank.getALLMemberWhiteList");
			int whiteSize = whiteList.size();
			
			for(int i=0; i< whiteSize; i++) {
				if(whiteList.get(i).getRankBenefit() == null) {
					
					String memberId	= whiteList.get(i).getMemberId();
					smc.update("rank.updateRankBenfit",memberId);
					
				}
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return whiteList;
	}

	@Override
	public RankVO getRankMember(String memberId) {
		RankVO rv = new RankVO();
		
		try {
			rv = (RankVO)smc.queryForObject("rank.getRankMember", memberId);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return rv;
	}

	@Override
	public int updateRankMember(RankVO rv) {
		int cnt =0;
		
		try {
		cnt = smc.update("rank.updateRankMember", rv);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateHeartWhiteMember(String memberId) {
		int cnt =0;
		
		try {
		cnt = smc.update("rank.updateHeartWhiteMember", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateHeartYellowMember(String memberId) {
		int cnt =0;
		
		try {
		cnt = smc.update("rank.updateHeartYellowMember", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateHeartPurpleMember(String memberId) {
	int cnt =0;
		
		try {
		cnt = smc.update("rank.updateHeartPurpleMember", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateHeartRainbowMember(String memberId) {
	int cnt =0;
		
		try {
		cnt = smc.update("rank.updateHeartRainbowMember", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public RankVO getTimeRankMember(String memberId) {
		RankVO tv = new RankVO();
		
		try {
			tv = (RankVO)smc.queryForObject("rank.getTimeRankMember", memberId);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return tv;
	}

	@Override
	public int updateRankBenfitAfter(String memberId) {
		int cnt =0;
		
		try {
		cnt = smc.update("rank.updateRankBenfitAfter", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public String getTotalPayment(String memberId) {
		String cnt ="123";
		
		try {
		cnt = (String) smc.queryForObject("rank.getTotalPayment", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateRankYellow(String memberId) {
		int cnt =0;
		
		try {
		cnt = smc.update("rank.updateRankYellow", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateRankPurple(String memberId) {
		int cnt =0;
		
		try {
		cnt = smc.update("rank.updateRankPurple", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateRankRainbow(String memberId) {
		int cnt =0;
		
		try {
		cnt = smc.update("rank.updateRankRainbow", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}


	
}
