package spectrum.mbtiboard.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.mbtiboard.dao.MbtiBoardDao;
import spectrum.mbtiboard.vo.MbtiBoardVO;

public class MbtiBoardService {
	private static MbtiBoardService service;
	private MbtiBoardService() {}
	private SqlMapClient smc;
	public static MbtiBoardService getInstance() {
		if(service==null) {
			service = new MbtiBoardService();
		}
		return service;
	}
	public List<MbtiBoardVO> mbtiBoardList(MbtiBoardVO mv) {
		
		return MbtiBoardDao.getInstance().mbtiBoardList(mv);
				
	}
	public int mbtiBoardInsert(MbtiBoardVO mv) {
		return MbtiBoardDao.getInstance().mbtiBoardInsert(mv);
	}
	public MbtiBoardVO mbtiBoardDetail(String boardNum) {
		return MbtiBoardDao.getInstance().mbtiBoardDetail(boardNum);
		
		
	}
	public int mbtiBoardUdate(MbtiBoardVO mv) {
		return MbtiBoardDao.getInstance().mbtiBoardUdate(mv);
	}
	
	public int mbtiBoardDelete(String boardNum) {
				MbtiBoardDao.getInstance().recommendDelete(boardNum);
				MbtiBoardDao.getInstance().reDelete(boardNum);
				MbtiBoardDao.getInstance().reportDelete(boardNum);
		
		return MbtiBoardDao.getInstance().mbtiBoardDelete(boardNum);
	}
	public int mbtiBoardReInsert(MbtiBoardVO mv) {
		return MbtiBoardDao.getInstance().mbtiBoardReInsert(mv);
	}
	public List<MbtiBoardVO> mbtiBoardReSelect(String boardNum) {
		return MbtiBoardDao.getInstance().mbtiBoardReSelect(boardNum);
	}
	public String mbtiBoardCode(String boardNum) {
		return MbtiBoardDao.getInstance().mbtiBoardCode(boardNum);
	}
	
	public int mbtiBoardReUpdate(MbtiBoardVO mv) {
		return MbtiBoardDao.getInstance().mbtiBoardReUpdate(mv);
	}
	public String mbtiparent(String num) {
		return MbtiBoardDao.getInstance().mbtiparent(num);
	}
	public List<MbtiBoardVO> serch(MbtiBoardVO mv){
		return MbtiBoardDao.getInstance().serch(mv);
	}
	public int totalCount(String mbti) {
		return MbtiBoardDao.getInstance().totalCount(mbti);
	}
	
	
}
