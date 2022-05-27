package spectrum.board.service;


import java.util.List;

import spectrum.board.dao.INoticeBoardDao;
import spectrum.board.dao.NoticeDaoImpl;
import spectrum.board.vo.NoticeBoardVO;

public class NoticeBoardSeriveImpl implements INoticBoardService {

	private static INoticBoardService nbService;

	// 사용할 DAO의 객체변수를 선언한다.
	private INoticeBoardDao nbDao;

	private NoticeBoardSeriveImpl() {
		nbDao = NoticeDaoImpl.getInstance();
	}

	public static INoticBoardService getInstance() {
		if (nbService == null) {
			nbService = new NoticeBoardSeriveImpl();
		}
		return nbService;
	}

	
	@Override
	public int insertBoard(NoticeBoardVO bv) {
		return nbDao.insertBoard(bv);
		
	}

	@Override
	public List<NoticeBoardVO> getALLBoardList() {
		
		return nbDao.getALLBoardList();
	}

	@Override
	public NoticeBoardVO getBoard(String noticeboardNum) {
		return nbDao.getBoard(noticeboardNum);
	
	}

	@Override
	public int updateBoard(NoticeBoardVO bv) {
		return nbDao.updateBoard(bv);
	}

	@Override
	public int delteBoard(String noticeboardNum) {
		return nbDao.delteBoard(noticeboardNum);
	}

}
