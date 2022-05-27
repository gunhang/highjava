package spectrum.mbtiboard.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.util.SqlMapClientFactory;

public class MbtiBoardDao {
	private static MbtiBoardDao dao;
	private MbtiBoardDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static MbtiBoardDao getInstance() {
		if(dao==null) {
			dao = new MbtiBoardDao();
		}
		return dao;
	}
	public List<MbtiBoardVO> mbtiBoardList(MbtiBoardVO mv) {
		List<MbtiBoardVO> mbv =new ArrayList<>();
		try {
			mbv=(List<MbtiBoardVO>)smc.queryForList("mbtiboard.boardList",mv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mbv;
				
	}
	public int mbtiBoardInsert(MbtiBoardVO mv) {
		int cnt = -1;
		try {
			cnt =smc.update("mbtiboard.insertBoard",mv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;	
	}
	public MbtiBoardVO mbtiBoardDetail(String boardNum) {
		MbtiBoardVO mv=null;
		try {
			mv= (MbtiBoardVO) smc.queryForObject("mbtiboard.mbtiboardDetail",boardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	public int mbtiBoardUdate(MbtiBoardVO mv) {
		int cnt = -1;
		try {
			cnt = smc.update("mbtiboard.mbtiBoardUpdate",mv);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	public int mbtiBoardDelete(String boardNum) {
		int cnt = -1;
		try {
			cnt = smc.delete("mbtiboard.mbtiBoardDelete",boardNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	public int mbtiBoardReInsert(MbtiBoardVO mv) {
		int cnt = -1;
		try {
			cnt = smc.update("mbtiboard.mbtiBoardRe",mv);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return cnt;
	}
	public List<MbtiBoardVO> mbtiBoardReSelect(String boardNum) {
		List<MbtiBoardVO> mv = null;
		try {
			mv=(ArrayList<MbtiBoardVO>)smc.queryForList("mbtiboard.mbtiBoardReSelect",boardNum);
			if(mv==null) {
				mv=new ArrayList<MbtiBoardVO>();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return mv;
	}
	public String mbtiBoardCode(String boardNum) {
		String result=null;
			try {
				boardNum = (String) smc.queryForObject("mbtiboard.mbtiCode",boardNum);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
	public int mbtiBoardReUpdate(MbtiBoardVO mv) {
		int cnt = -1;
			try {
				cnt = smc.update("mbtiboard.mbtiBoardReUpdate",mv);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return cnt;
		
	}
	public String mbtiparent(String num) {
		String result = null;
		try {
			result =(String) smc.queryForObject("mbtiboard.mbtiparent",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public List<MbtiBoardVO> serch(MbtiBoardVO mv){
		List<MbtiBoardVO> result= null;
		try {
			result = (List<MbtiBoardVO>)smc.queryForList("mbtiboard.mbtiBoardSerch",mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int totalCount(String mbti) {
		int result=0;
		try {
			result = (int)smc.queryForObject("mbtiboard.count",mbti);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return result;
	}
	public void reportDelete(String postNum) {
		try {
			smc.delete("mbtiboard.reportdelete",postNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void recommendDelete(String postNum) {
		try {
			smc.delete("mbtiboard.recommenddelete",postNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void reDelete(String postNum) {
		try {
			smc.delete("mbtiboard.redelete",postNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
}
