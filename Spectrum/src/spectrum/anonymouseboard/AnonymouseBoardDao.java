package spectrum.anonymouseboard;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.util.SqlMapClientFactory;

public class AnonymouseBoardDao {
	private static AnonymouseBoardDao dao;
	private AnonymouseBoardDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static AnonymouseBoardDao getInstance() {
		if(dao==null) {
			dao = new AnonymouseBoardDao();
		}
		return dao;
	}
	public AnonymouseBoardVO boardDetail(String boardNum) {
		AnonymouseBoardVO ambv=null;
		try {
			ambv=(AnonymouseBoardVO)smc.queryForObject("anonyboard.boardDetail",boardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ambv;
	}
	public List<AnonymouseBoardVO> boardList() {
		List<AnonymouseBoardVO> list=null ;
		try {
			list=smc.queryForList("anonyboard.boardList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public void boardDelete(String boardNum) {
		try {
			smc.delete("anonyboard.boardDelete",boardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void boardUpdate(AnonymouseBoardVO av) {
		try {
			smc.update("anonyboard.boardUpdate",av);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void boardInsert(AnonymouseBoardVO av) {
		try {
			smc.insert("anonyboard.boardInsert",av);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
