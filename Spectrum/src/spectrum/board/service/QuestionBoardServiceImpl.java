package spectrum.board.service;


import java.util.List;

import spectrum.board.dao.IQuestionBoardDao;

import spectrum.board.dao.QuestionDaoImpl;
import spectrum.board.vo.QuestionBoardVO;

public class QuestionBoardServiceImpl implements IQuestionBoardService {
	
	private static IQuestionBoardService qbService;

	// 사용할 DAO의 객체변수를 선언한다.
	private IQuestionBoardDao qbDao;

	private QuestionBoardServiceImpl() {
		qbDao = QuestionDaoImpl.getInstance();
	}

	public static IQuestionBoardService getInstance() {
		if (qbService == null) {
			qbService = new QuestionBoardServiceImpl();
		}
		return qbService;
	}
	
	@Override
	public int insertQuestionBoard(QuestionBoardVO qbv) {
		return qbDao.insertQuestionBoard(qbv);
		
	}

	@Override
	public List<QuestionBoardVO> getALLQuestionBoardList() {
		return qbDao.getALLQuestionBoardList();
	}

	@Override
	public QuestionBoardVO getQuestionBoard(String questionboardNumber) {
		return qbDao.getQuestionBoard(questionboardNumber);
	}

	@Override
	public int updateQuestionBoard(QuestionBoardVO qbv) {
		return qbDao.updateQuestionBoard(qbv);
	}

	@Override
	public int delteQuestionBoard(String questionboardNumber) {
		return qbDao.delteQuestionBoard(questionboardNumber);
	}



}
