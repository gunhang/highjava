package spectrum.member.dao;

import java.util.List;

import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.vo.FriendVO;
import spectrum.myspectrum.vo.SpectrumBoardVO;
import spectrum.myspectrum.vo.mySpectrumListVO;

/**
 * 실제 DB에 연결해서 SQL문을 수행하여 결과를 작성해 Service에 전달하는 DAO의 인터페이스
 * 
 * @author PC-13
 *
 */
public interface MemberDao {
	
		/**
		 * MemberVO에 담겨진 자료를 DB에 insert하는 메서드
		 * 
		 * @param mv DB에 insert할 자료가 저장된 MemberVO객체
		 * @return DB작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환된다.
		 */
		public int insertMember(MemberVO mv);
		public int insertFriends(FriendVO fv);
		
		
		/**
		 * 
		 * @param id
		 * @return
		 */
		public String checkId(String id);
	
		public int insertRank(MemberVO mv);
		public int insertBoard(SpectrumBoardVO sv); 
	    public SpectrumBoardVO getBoard(String memId);
		   
		public int updateMember(MemberVO mv);
		public int updateBoard(SpectrumBoardVO sv);
		public int updateFriends(FriendVO fv);

			
		public int deleteMember(String memId);
		public int deleteBoard(String memId);
		public int deleteFriends(FriendVO fv);
		
		
		public List<mySpectrumListVO> getAllBoardList(String memId);
		public List<FriendVO> getAllFriendListY(String memId);
		public List<FriendVO> getAllFriendListN(String memId);
		
		  
		

	/**
	 * MemberVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param mv
	 *            DB에 insert할 자료가 저장된 MemberVO객체
	 * @return DB작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환된다.
	 */

	/**
	 * 
	 * @param id
	 * @return
	 */

	public String checkMail(String userMail);



	public MemberVO getMember(String memberId);






	public List<MemberVO> getAllMemberList();
	public int updateChatHartnum(String memId);


	public String joinMember(MemberVO mv);
	
	public String findIdMember(MemberVO mv);

	public int checkMember(String memId);
	
	public String getMail(String memId);
	
	public int updatePassword(MemberVO mv);
	
	public String checkNickName(String memberNickName);
}
