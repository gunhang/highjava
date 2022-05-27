package spectrum.board.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.board.vo.QuestionAnswerBoardVO;
import spectrum.board.vo.QuestionBoardVO;
import spectrum.util.SqlMapClientFactory;

public class QuestionAnswerDaoImpl implements IQuestionAnswerBoardDao {
	
	private static IQuestionAnswerBoardDao qabDao;
	private SqlMapClient smc;
	
	private QuestionAnswerDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IQuestionAnswerBoardDao getInstance() {
		if(qabDao == null) {
			qabDao = new QuestionAnswerDaoImpl();
		}
		return qabDao;
	}
	
	@Override
	public int insertQuestionAnswerBoard(QuestionAnswerBoardVO qabv) {
		int cnt =0;
		
		try {
			cnt = smc.update("board.insertQuestionAnswerBoard", qabv);
			smc.update("board.insertQuestionAnswerBoard2", qabv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public QuestionAnswerBoardVO getQuestionAnswerBoard(String questionboardNum) {
		QuestionAnswerBoardVO qabv = new QuestionAnswerBoardVO();
		try {
			qabv = (QuestionAnswerBoardVO)smc.queryForObject("board.getQuestionAnswerBoard", questionboardNum);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return qabv;
	}

	@Override
	public int updateQuestionAnswerBoard(QuestionAnswerBoardVO qabv) {
		int cnt =0;
		
		try {
		cnt = smc.update("board.updateQuestionAnswerBoard", qabv);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int delteQuestionAnswerBoard(String questionboardNum) {
		int cnt = 0;
		
		try {
			smc.delete("board.deleteQuestionAnswerBoard", questionboardNum);
			smc.update("board.deleteQuestionAnswerBoard2", questionboardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

}
