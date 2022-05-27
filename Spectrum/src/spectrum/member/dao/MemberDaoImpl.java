package spectrum.member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.vo.FriendVO;
import spectrum.myspectrum.vo.SpectrumBoardVO;
import spectrum.myspectrum.vo.mySpectrumListVO;
import spectrum.util.SqlMapClientFactory;

public class MemberDaoImpl implements MemberDao{
	
	private static MemberDao memberDao;
	
	private SqlMapClient smc;
	
	private MemberDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static MemberDao getInstance() {
		if(memberDao==null) {
			memberDao=new MemberDaoImpl();
		}
		return memberDao;
	}

	
	
	@Override
	public int insertMember(MemberVO mv) {
		
		int cnt = 0;
		
		try {
			cnt = smc.update("memberspec.insertMember",mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int insertBoard(SpectrumBoardVO sv) {
		
		
		int cnt = 0;
		
		try {
			cnt = smc.update("member.insertBoard",sv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertFriends(FriendVO fv) {
		
		
		int cnt = 0;
		
		try {
			cnt = smc.update("member.insertFriends",fv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public String checkId(String userId) {
		
		String checkId = null;
		 try {
			checkId =(String)smc.queryForObject("memberspec.checkId", userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return checkId;
	}
	
	public String checkMail(String userMail) {
	String checkMail = null;
	 try {
		checkMail =(String)smc.queryForObject("memberspec.checkMail", userMail);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return checkMail;
}


	@Override
	public String joinMember(MemberVO mv) {
		
		String isExists = null;
		try {
			isExists = (String) smc.queryForObject("memberspec.joinMember",mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isExists;
	}

	@Override
	public int insertRank(MemberVO mv) {
		
		int cnt = 0;
		
		try {
			cnt = smc.update("memberspec.insertRank",mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	

	@Override
	public MemberVO getMember(String memId) {
		MemberVO mv = new MemberVO();   
		
		try {
			mv = (MemberVO)smc.queryForObject("member.getMember",memId);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@Override
	public SpectrumBoardVO getBoard(String memId) {
		SpectrumBoardVO sv = new SpectrumBoardVO();   
		
		try {
			sv = (SpectrumBoardVO)smc.queryForObject("member.getBoard",memId);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sv;
	}
	
	
	
	@Override
	public int updateMember(MemberVO mv) {

		int cnt =0;
		
		 try {
			cnt = smc.update("member.updateMember", mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}


	@Override
	public int updateBoard(SpectrumBoardVO sv) {
		int cnt =0;
		
		 try {
			cnt = smc.update("member.updateBoard", sv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int updateFriends(FriendVO fv) {
		int cnt =0;
		
		 try {
			cnt = smc.update("member.updateFriends", fv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	
	
	
	
	@Override
	public int deleteMember(String memId) {

		int cnt = 0;
		
		try {
			cnt = smc.delete("member.deleteMember", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteBoard(String memId) {

		int cnt = 0;
		
		try {
			cnt = smc.delete("member.deleteBoard", memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int deleteFriends(FriendVO fv) {

		int cnt = 0;
		
		try {
			cnt = smc.delete("member.deleteFriends", fv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	
	
	

	@Override
	public List<mySpectrumListVO> getAllBoardList(String memId) {

		List<mySpectrumListVO> memList = new ArrayList<mySpectrumListVO>();
		
		try {
			memList = (List<mySpectrumListVO>)smc.queryForList("member.getAllBoardList",memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memList;
	}
	

	@Override
	public List<FriendVO> getAllFriendListY(String memId) {

		List<FriendVO> memList = new ArrayList<FriendVO>();
		
		try {
			memList = smc.queryForList("member.getAllFriendListY",memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memList;
	}
	
	@Override
	public List<FriendVO> getAllFriendListN(String memId) {

		List<FriendVO> memList = new ArrayList<FriendVO>();
		
		try {
			memList = smc.queryForList("member.getAllFriendListN",memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memList;
	}

	@Override
	public List<MemberVO> getAllMemberList() {
		

		List<MemberVO> memList = new ArrayList<MemberVO>();
		
		try {
			memList = smc.queryForList("member.getMemberAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memList;
	}

	@Override
	public int updateChatHartnum(String memId) {
		int cnt =0;
		 try {
			cnt = smc.update("member.updateChatHartnum", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	

	public String findIdMember(MemberVO mv) {
		String findId= null;
		 try {
			 findId =(String)smc.queryForObject("memberspec.findIdMember", mv);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return findId;
		
		
	}

	@Override
	public int checkMember(String memId) {

		int cnt = 0;

		try {
			cnt =(int)smc.queryForObject("memberspec.checkMember", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public String getMail(String memId) {
		String getMail= null;
		 try {
			 getMail =(String)smc.queryForObject("memberspec.getMail", memId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return getMail;
		
		
	}

	@Override
	public int updatePassword(MemberVO mv){
		int cnt =0;
		 try {
			cnt = smc.update("memberspec.updatePassword",mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public String checkNickName(String memberNickName) {
		String checkNickName = null;
		 try {
			 checkNickName =(String)smc.queryForObject("memberspec.checkNickName", memberNickName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return checkNickName;
	}

}
