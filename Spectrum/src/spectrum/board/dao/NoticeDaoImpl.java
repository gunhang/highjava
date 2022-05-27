package spectrum.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;


import spectrum.board.vo.NoticeBoardVO;
import spectrum.util.SqlMapClientFactory;

public class NoticeDaoImpl implements INoticeBoardDao {
	
	private static INoticeBoardDao nbDao;
	private SqlMapClient smc;
	
	private NoticeDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static INoticeBoardDao getInstance() {
		if(nbDao == null) {
			nbDao = new NoticeDaoImpl();
		}
		return nbDao;
	}
	
	@Override
	public int insertBoard(NoticeBoardVO bv) {
	int cnt =0;
		
		try {
			cnt = smc.update("board.insertBoard", bv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<NoticeBoardVO> getALLBoardList() {
		List<NoticeBoardVO> boardList = new ArrayList<NoticeBoardVO>();
		
		try {
			boardList = smc.queryForList("board.getBoardAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardList;
	
	}

	@Override
	public NoticeBoardVO getBoard(String noticeboardNum) {

		 NoticeBoardVO bv = new NoticeBoardVO();
		
		try {
			bv = (NoticeBoardVO)smc.queryForObject("board.getBoard", noticeboardNum);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return bv;
	}

	@Override
	public int updateBoard(NoticeBoardVO bv) {
	int cnt =0;
		
		try {
		cnt = smc.update("board.updateBoard", bv);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int delteBoard(String noticeboardNum) {
		int cnt = 0;
		
		try {
			smc.delete("board.deleteBoard", noticeboardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

}
