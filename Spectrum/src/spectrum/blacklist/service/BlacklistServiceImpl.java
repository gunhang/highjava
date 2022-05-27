package spectrum.blacklist.service;

import java.util.List;

import spectrum.blacklist.dao.BlacklistDaoImpl;
import spectrum.blacklist.dao.IBlacklistDao;
import spectrum.blacklist.vo.BlacklistVO;

public class BlacklistServiceImpl implements IBlacklistService{
	
	
	private static IBlacklistService blackService;
	
		// 사용할 DAO의 객체변수를 선언한다.
	private IBlacklistDao blackDao;
	
	private BlacklistServiceImpl() {
		blackDao = BlacklistDaoImpl.getInstance();
	}
	
	public static IBlacklistService getInstance() {
		if(blackService == null) {
			blackService = new BlacklistServiceImpl();
		}
		return blackService;
	}
	
	@Override
	public List<BlacklistVO> getALLBlackList() {
		return blackDao.getALLBlackList();
	}

	@Override
	public BlacklistVO getBlacklist(String blacklistNumber) {
		
		return blackDao.getBlacklist(blacklistNumber);
	}

	@Override
	public int deleteBlacklist(String blacklistNumber) {
		return blackDao.deleteBlacklist(blacklistNumber);
	}

	@Override
	public int insertBlacklist(BlacklistVO bv) {
		return blackDao.insertBlacklist(bv);
	}

	@Override
	public int getReportcount(String memberId) {
		return blackDao.getReportcount(memberId);
	}

	@Override
	public int insertBlacklistAuto(String memberId) {
		return blackDao.insertBlacklistAuto(memberId);
	}

	@Override
	public int insertBlacklistAutoBanDuplication(String memberId) {
		return blackDao.insertBlacklistAutoBanDuplication(memberId);
	}

	@Override
	public List<BlacklistVO> getMemberlistAll() {
		return blackDao.getMemberlistAll();
	}

	@Override
	public String gettoBlacklistCheck(String memberId) {
		return blackDao.gettoBlacklistCheck(memberId);
	}

	@Override
	public String getMemberSigndate(String memberId) {
		return blackDao.getMemberSigndate(memberId);
	}

}
