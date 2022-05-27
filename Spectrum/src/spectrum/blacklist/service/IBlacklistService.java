package spectrum.blacklist.service;

import java.util.List;


import spectrum.blacklist.vo.BlacklistVO;

public interface IBlacklistService {
	/**
	 * DB의 mymember 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return MemberVO객체를 담고 있는 List 객체
	 */
	public List<BlacklistVO> getALLBlackList();
	
	/**
	 * 주어진 회원ID가 존재하는지 여부를 알아내기 위한 메서드
	 * @param memId	검색할 회원 ID
	 * @return	해당회원 ID가 있으면 회원정보 리턴함.
	 */
	public BlacklistVO getBlacklist(String blacklistNumber);
	
	/**
	 * 회원ID를 매개변수로 받아서 해당 회원정보를 삭제하는 메서드
	 * @param memId 삭제할 회원 ID
	 * @return 작업성공 : 1, 작업실패 : 0
	 */
	public int deleteBlacklist(String blacklistNumber);
	
	/**
	 * MemberVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param mv DB에 insert할 자료가 저장된 MemberVO 객체
	 * @return DB작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환된다.
	 */
	public int insertBlacklist(BlacklistVO bv);
	
	/**
	 * MemberVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param mv DB에 insert할 자료가 저장된 MemberVO 객체
	 * @return DB작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환된다.
	 */
	public int insertBlacklistAuto(String memberId);
	
	/**
	 * 주어진 회원ID가 존재하는지 여부를 알아내기 위한 메서드
	 * @param memId	검색할 회원 ID
	 * @return	해당회원 ID가 있으면 회원정보 리턴함.
	 */
	public int getReportcount(String memberId);
	
	
	/**
	 * 회원ID를 매개변수로 받아서 해당 회원정보를 삭제하는 메서드
	 * @param memId 삭제할 회원 ID
	 * @return 작업성공 : 1, 작업실패 : 0
	 */
	public int insertBlacklistAutoBanDuplication(String memberId);
	
	/**
	 * DB의 mymember 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return MemberVO객체를 담고 있는 List 객체
	 */
	public List<BlacklistVO> getMemberlistAll();
	
	/**
	 * 주어진 회원ID가 존재하는지 여부를 알아내기 위한 메서드
	 * @param memId	검색할 회원 ID
	 * @return	해당회원 ID가 있으면 회원정보 리턴함.
	 */
	public String gettoBlacklistCheck(String memberId);
	
	/**
	 * 주어진 회원ID가 존재하는지 여부를 알아내기 위한 메서드
	 * @param memId	검색할 회원 ID
	 * @return	해당회원 ID가 있으면 회원정보 리턴함.
	 */
	public String getMemberSigndate(String memberId);
}
