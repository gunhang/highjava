package spectrum.rank.dao;

import java.util.List;


import spectrum.rank.vo.RankVO;


public interface IRankDao {
	/**
	 * DB의 Rank 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return RankVO객체를 담고 있는 List 객체
	 */
	public List<RankVO> getALLMemberWhiteList();
	/**
	 * 주어진 회원ID가 존재하는지 여부를 알아내기 위한 메서드
	 * @param memberId 검색할 회원 ID
	 * @return	해당회원 ID가 있으면 회원정보 리턴함.
	 */
	public RankVO getRankMember(String memberId);
	
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateRankMember(RankVO rv);
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateHeartWhiteMember(String memberId);
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateHeartYellowMember(String memberId);
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateHeartPurpleMember(String memberId);
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateHeartRainbowMember(String memberId);
	
	/**
	 * 주어진 회원ID가 존재하는지 여부를 알아내기 위한 메서드
	 * @param memberId 검색할 회원 ID
	 * @return	해당회원 ID가 있으면 회원정보 리턴함.
	 */
	public RankVO getTimeRankMember(String memberId);
	
	
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateRankBenfitAfter(String memberId);
	
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateRankYellow(String memberId);
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateRankPurple(String memberId);
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateRankRainbow(String memberId);
	
	
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public String getTotalPayment(String memberId);
	
}
