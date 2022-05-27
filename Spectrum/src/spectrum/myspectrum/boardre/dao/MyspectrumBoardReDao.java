package spectrum.myspectrum.boardre.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.myspectrum.vo.SpectrumBoardVO;
import spectrum.payment.dao.PaymentDao;
import spectrum.util.SqlMapClientFactory;

public class MyspectrumBoardReDao {
	private static MyspectrumBoardReDao dao;
		
	private SqlMapClient smc;
	
	private MyspectrumBoardReDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static MyspectrumBoardReDao getInstance() {
		if(dao==null) {
			dao=new MyspectrumBoardReDao();
		}
		return dao;
	}
	
	public List<SpectrumBoardVO> spectrumBoardReSelect(String parent) {
		List<SpectrumBoardVO> spv =null;
			try {
				spv = (List<SpectrumBoardVO>)smc.queryForList("myspectrumboardre.boardReSelect",parent);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return spv;
		
	}
	public void spectrumBoardInsert(SpectrumBoardVO sbv) {
		try {
			smc.insert("myspectrumboardre.BoardRe",sbv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void spectrumBoardUpdate(SpectrumBoardVO sbv) {
		try {
			smc.update("myspectrumboardre.boardReUpdate",sbv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void spectrumBoardDelete(String boardNum) {
		
		try {
			smc.delete("myspectrumboardre.boardReDelete",boardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String parent (String boardNum) {
		String result=null;
		
		try {
			result=(String) smc.queryForObject(boardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
}
