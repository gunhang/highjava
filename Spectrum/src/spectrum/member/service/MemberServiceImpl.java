package spectrum.member.service;

import java.util.List;

import spectrum.member.dao.MemberDao;
import spectrum.member.dao.MemberDaoImpl;
import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.vo.FriendVO;
import spectrum.myspectrum.vo.SpectrumBoardVO;
import spectrum.myspectrum.vo.mySpectrumListVO;

public class MemberServiceImpl implements MemberService {

	private static MemberService memberService;

	private MemberDao memberDao;

	private MemberServiceImpl() {
		memberDao = MemberDaoImpl.getInstance();
	}
	

	public static MemberService getInstance() {
		if (memberService == null) {
			memberService = new MemberServiceImpl();
		}
		return memberService;
	}

	@Override
	public int insertMember(MemberVO mv) {
		return memberDao.insertMember(mv);
	}

	@Override
	public int insertFriends(FriendVO fv) {
		return memberDao.insertFriends(fv);
	}
	
	
	public String checkId(String userId) {
		return memberDao.checkId(userId);
	}
	
	@Override
	public String checkMail(String userMail) {
		return memberDao.checkMail(userMail);
	}

	@Override
	public String joinMember(MemberVO mv) {
		return memberDao.joinMember(mv);
	}

	@Override
	public int insertRank(MemberVO mv) {
		return memberDao.insertRank(mv);
	}

	@Override
	public int insertBoard(SpectrumBoardVO sv) {
		return memberDao.insertBoard(sv);
	}

	@Override
	public MemberVO getMember(String memberId) {
		return memberDao.getMember(memberId);
	}

	@Override
	public SpectrumBoardVO getBoard(String memId) {
		return memberDao.getBoard(memId);
	}

	@Override
	public int updateMember(MemberVO mv) {
		return memberDao.updateMember(mv);
	}

	@Override
	public int updateBoard(SpectrumBoardVO sv) {
		return memberDao.updateBoard(sv);
	  }
	   

	 @Override
		public int updateFriends(FriendVO fv) {
			return memberDao.updateFriends(fv);
		  }
		   
	
	@Override
	public int deleteMember(String memId) {
		return memberDao.deleteMember(memId);
	}
	
	
	  @Override
	   public int deleteBoard(String memId) {
	      return memberDao.deleteBoard(memId);
	   }
	  

	  @Override
	   public int deleteFriends(FriendVO fv) {
		  return memberDao.deleteFriends(fv);
	   }
	 

	  
	  
	  
	   @Override
	   public List<mySpectrumListVO> getAllBoardList(String memId) {
	      return memberDao.getAllBoardList(memId);
	   }
	   
	   @Override
	   public List<FriendVO> getAllFriendListY(String memId) {
	      return memberDao.getAllFriendListY(memId);
	   }
	   @Override
	   public List<FriendVO> getAllFriendListN(String memId) {
	      return memberDao.getAllFriendListN(memId);
	   }
	   
	   
	
	
	


	@Override
	public List<MemberVO> getAllMemberList() {
		return memberDao.getAllMemberList();
	}





	@Override
	public int updateChatHartnum(String memId) {
		return memberDao.updateChatHartnum(memId);
	}

	@Override
	public String findIdMember(MemberVO mv) {
		return memberDao.findIdMember(mv);
	}

	@Override
	public int checkMember(String memId) {
		return memberDao.checkMember(memId);
	}

	@Override
	public String getMail(String memId) {
		return memberDao.getMail(memId);
	}

	@Override
	public int updatePassword(MemberVO mv) {
		return memberDao.updatePassword(mv);
	}


	@Override
	public String checkNickName(String memberNickName) {
		return memberDao.checkNickName(memberNickName);
	}
}
