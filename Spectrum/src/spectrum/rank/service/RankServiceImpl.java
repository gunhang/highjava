package spectrum.rank.service;

import java.util.List;


import spectrum.rank.dao.IRankDao;
import spectrum.rank.dao.RankDaoImpl;
import spectrum.rank.vo.RankVO;


public class RankServiceImpl implements IRankService {
	
	private static IRankService rankService;
	
		// 사용할 DAO의 객체변수를 선언한다.
	private IRankDao rankDao;
	

	private RankServiceImpl() {
		rankDao = RankDaoImpl.getInstance();
	}

	public static IRankService getInstance() {
		if(rankService == null) {
			rankService = new RankServiceImpl();
		}
		return rankService;
	}
	
	@Override
	public List<RankVO> getALLMemberWhiteList() {
		return rankDao.getALLMemberWhiteList();
	}

	@Override
	public RankVO getRankMember(String memberId) {
		return rankDao.getRankMember(memberId);
	}

	@Override
	public int updateRankMember(RankVO rv) {
		return rankDao.updateRankMember(rv);
	}

	@Override
	public int updateHeartWhiteMember(String memberId) {
		return rankDao.updateHeartWhiteMember(memberId);
	}

	@Override
	public int updateHeartYellowMember(String memberId) {
		return rankDao.updateHeartYellowMember(memberId);
	}

	@Override
	public int updateHeartPurpleMember(String memberId) {
		return rankDao.updateHeartPurpleMember(memberId);
	}

	@Override
	public int updateHeartRainbowMember(String memberId) {
		return rankDao.updateHeartRainbowMember(memberId);
	}

	@Override
	public RankVO getTimeRankMember(String memberId) {
		return rankDao.getTimeRankMember(memberId);
	}

	@Override
	public int updateRankBenfitAfter(String memberId) {
		return rankDao.updateRankBenfitAfter(memberId);
	}

	@Override
	public String getTotalPayment(String memberId) {
		return rankDao.getTotalPayment(memberId);
	}

	@Override
	public int updateRankYellow(String memberId) {
		return rankDao.updateRankYellow(memberId);
	}

	@Override
	public int updateRankPurple(String memberId) {
		return rankDao.updateRankPurple(memberId);
	}

	@Override
	public int updateRankRainbow(String memberId) {
		return rankDao.updateRankRainbow(memberId);
	}

}
