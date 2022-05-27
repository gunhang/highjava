package spectrum.board.fame.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.board.fame.vo.BoardFameVO;
import spectrum.util.SqlMapClientFactory;



public class FameBoardDao {
	private static FameBoardDao Dao;
	private SqlMapClient smc;
	
	private FameBoardDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static FameBoardDao getInstance() {
		if(Dao == null) {
			Dao = new FameBoardDao();
		}
		return Dao;
	}
	public List<BoardFameVO> boardFameSelect() {
		List<BoardFameVO> fameList = null;
		try {
			fameList=smc.queryForList("fameBoard.fameBoard");
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return fameList;
	}
}
