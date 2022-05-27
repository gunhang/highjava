package spectrum.myatc.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.board.vo.NoticeBoardVO;
import spectrum.myatc.vo.MyAtcVO;
import spectrum.rank.vo.RankVO;
import spectrum.util.SqlMapClientFactory;

public class MyAtcDaoImpl implements IMyAtcDao {
	
	private static IMyAtcDao fileDao;
	private SqlMapClient smc;
	
	private MyAtcDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IMyAtcDao getInstance() {
		if(fileDao == null) {
			fileDao = new MyAtcDaoImpl();
		}
		return fileDao;
	}
	
	@Override
	public int insertAtchFile(MyAtcVO MyAtcVO) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("myatc.insertAtchFile", MyAtcVO);
				
		if(obj == null) {
			cnt = 1;
		}
		
		
		return cnt;
	}

	@Override
	public int insertAtchFileDetail(MyAtcVO MyAtcVO) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("myatc.insertAtchFileDetail", MyAtcVO);
				
		if(obj == null) {
			cnt = 1;
		}
		
		
		return cnt;
	}

	@Override
	public List<MyAtcVO> getAtchFileList(MyAtcVO MyAtcVO) throws SQLException {
		
		List<MyAtcVO> atchFileList = smc.queryForList("myatc.getAtchFileList"
								, MyAtcVO);
		
		return atchFileList;
	}

	@Override
	public MyAtcVO getAtchFileDetail(MyAtcVO MyAtcVO) throws SQLException {
		MyAtcVO fileVO = (MyAtcVO) smc.queryForObject("myatc.getAtchFileDetail", MyAtcVO);
		return fileVO;
	}

	@Override
	public String getAtcId(String memberId) {
		String cnt ="";
		
		try {
		cnt = (String) smc.queryForObject("myatc.getAtcId", memberId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<MyAtcVO> getALLAtcDtlList(String myflofileatcId) {
		List<MyAtcVO> atcdtlList = new ArrayList<MyAtcVO>();
		
		try {
			atcdtlList = smc.queryForList("myatc.getALLAtcDtlList", myflofileatcId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return atcdtlList;
	
	}

	@Override
	public int updateAtcId(MyAtcVO atchFileVO) {
		int cnt =0;
		
		try {
		cnt = smc.update("myatc.updateAtcId", atchFileVO);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}



	
}
