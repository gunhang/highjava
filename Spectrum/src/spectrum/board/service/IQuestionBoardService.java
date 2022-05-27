package spectrum.board.service;

import java.util.List;

import spectrum.board.vo.NoticeBoardVO;
import spectrum.board.vo.QuestionAnswerBoardVO;
import spectrum.board.vo.QuestionBoardVO;

public interface IQuestionBoardService {
	
	/**
	 * QuestionBoardVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param qbv DB에 insert할 자료가 저장된 QuestionBoardVO 객체
	 * @return	DB작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환된다.
	 * 
	 */
	public int insertQuestionBoard(QuestionBoardVO qbv);
	
	/**
	 * DB의 QUESTIONBOARD 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return QuestionBoardVO객체를 담고 있는 List 객체
	 */
	public List<QuestionBoardVO> getALLQuestionBoardList();
	
	/**
	 * 주어진 질문 게시판 번호가 존재하는지 여부를 알아내기 위한 메서드
	 * @param questionboardNumber	검색할 질문 게시판 번호
	 * @return	해당질문 게시판 번호가 있으면 게시글정보 리턴함.
	 */
	public QuestionBoardVO getQuestionBoard(String questionboardNumber);
	
	/**
	 * 하나의 QuestionBoardVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param qbv update할 회원 정보가 담긴 QuestionBoardVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateQuestionBoard(QuestionBoardVO qbv);
	
	/**
	 * 게시글번호를 매개변수로 받아서 해당 게시글정보를 삭제하는 메서드
	 * @param noticeboardNum 삭제할 게시글번호
	 * @return 작업성공 : 1, 작업실패: 0
	 */
	public int delteQuestionBoard(String questionboardNumber);
	

}
