package spectrum.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.board.vo.NoticeBoardVO;
import spectrum.board.vo.QuestionAnswerBoardVO;
import spectrum.board.vo.QuestionBoardVO;
import spectrum.util.SqlMapClientFactory;

public class QuestionDaoImpl implements IQuestionBoardDao {
	
	private static IQuestionBoardDao qbDao;
	private SqlMapClient smc;
	
	private QuestionDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IQuestionBoardDao getInstance() {
		if(qbDao == null) {
			qbDao = new QuestionDaoImpl();
		}
		return qbDao;
	}
	
	@Override
	public int insertQuestionBoard(QuestionBoardVO qbv) {
		int cnt =0;
		
		try {
			cnt = smc.update("board.insertQuestionBoard", qbv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<QuestionBoardVO> getALLQuestionBoardList() {
		List<QuestionBoardVO> questionboardList = new ArrayList<QuestionBoardVO>();
		
		try {
			questionboardList = smc.queryForList("board.getQuestionBoardAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return questionboardList;
	}

	@Override
	public QuestionBoardVO getQuestionBoard(String questionboardNumber) {
		QuestionBoardVO qbv = new QuestionBoardVO();
			
			try {
				qbv = (QuestionBoardVO)smc.queryForObject("board.getQuestionBoard", questionboardNumber);
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			return qbv;
	}

	@Override
	public int updateQuestionBoard(QuestionBoardVO qbv) {
		int cnt =0;
		
		try {
		cnt = smc.update("board.updateQuestionBoard", qbv);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int delteQuestionBoard(String questionboardNumber) {
		int cnt = 0;
		
		try {
			smc.delete("board.deleteQuestionBoard", questionboardNumber);
			smc.update("board.deleteQuestionBoard2", questionboardNumber);
			smc.delete("board.deleteQuestionBoard3", questionboardNumber);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	
	
	
}
