package spectrum.board.service;

import spectrum.board.dao.IQuestionAnswerBoardDao;
import spectrum.board.dao.IQuestionBoardDao;
import spectrum.board.dao.QuestionAnswerDaoImpl;
import spectrum.board.dao.QuestionDaoImpl;
import spectrum.board.vo.QuestionAnswerBoardVO;

public class QuestionAnswerBoardServiceImpl implements IQuestionAnswerBoardService {
	
	private static IQuestionAnswerBoardService qabService;

	// 사용할 DAO의 객체변수를 선언한다.
	private IQuestionAnswerBoardDao qabDao;

	private QuestionAnswerBoardServiceImpl() {
		qabDao = QuestionAnswerDaoImpl.getInstance();
	}

	public static IQuestionAnswerBoardService getInstance() {
		if (qabService == null) {
			qabService = new QuestionAnswerBoardServiceImpl();
		}
		return qabService;
	}
	
	@Override
	public int insertQuestionAnswerBoard(QuestionAnswerBoardVO qabv) {
		return qabDao.insertQuestionAnswerBoard(qabv);
	}

	@Override
	public QuestionAnswerBoardVO getQuestionAnswerBoard(String questionboardNum) {
		return qabDao.getQuestionAnswerBoard(questionboardNum);
	}
	
	@Override
	public int updateQuestionAnswerBoard(QuestionAnswerBoardVO qabv) {
		return qabDao.updateQuestionAnswerBoard(qabv);
	}

	@Override
	public int delteQuestionAnswerBoard(String questionboardNum) {
		return qabDao.delteQuestionAnswerBoard(questionboardNum);
	}

}
