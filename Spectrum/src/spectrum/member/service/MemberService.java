package spectrum.member.service;

import java.util.List;

import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.vo.FriendVO;
import spectrum.myspectrum.vo.SpectrumBoardVO;
import spectrum.myspectrum.vo.mySpectrumListVO;

/**
 * Service객체는 Dao에 설정된 메서드를 원하는 작업에 맞게 호출하여 결과를 받아오고, 받아온 데이터를 Controller에게 보내주는
 * 역할을 수행한다.
 * 
 * @author PC-13
 */
public interface MemberService {

	/**
	 * MemberVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param mv
	 *            DB에 insert할 자료가 저장된 MemberVO 객체
	 * @return DB작업이 성공하면 1이상의 값이 반환 실패하면 0이 반환된다.
	 * 
	 */
	
	public int insertMember(MemberVO mv);
	public int insertFriends(FriendVO fv);
	public int insertRank(MemberVO mv);
	 public int insertBoard(SpectrumBoardVO sv);
	   
     
     public MemberVO getMember(String memId);
     public SpectrumBoardVO getBoard(String memId);
	   
     
	   public int updateMember(MemberVO mv);
	   public int updateBoard(SpectrumBoardVO sv);
	   public int updateFriends(FriendVO fv);
	   
	   public int updateChatHartnum(String memId);
	   
	   
	   public int deleteMember(String memId);
	   public int deleteBoard(String memId);
	   public int deleteFriends(FriendVO fv);
	   
	   public String joinMember(MemberVO mv);
	   public List<mySpectrumListVO> getAllBoardList(String memId);
	   public List<FriendVO> getAllFriendListY(String memId);
	   public List<FriendVO> getAllFriendListN(String memId);

	public String checkId(String memId);
	
	public String checkMail(String userMail);
	
	public String checkNickName(String memberNickName);



	public List<MemberVO> getAllMemberList();

	
	public String findIdMember(MemberVO mv);
	
	public int checkMember(String memId);
	
	public String getMail(String memId);
	
	public int updatePassword(MemberVO mv);

}
