package spectrum.board.dao;

import java.util.List;

import spectrum.board.vo.NoticeBoardVO;

public interface INoticeBoardDao {
	
	/**
	 * NoticeBoardVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param bv DB에 insert할 자료가 저장된 NoticeBoardVO 객체
	 * @return	DB작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환된다.
	 * 
	 */
	public int insertBoard(NoticeBoardVO bv);
	
	/**
	 * DB의 NoticeBoard 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return NoticeBoardVO객체를 담고 있는 List 객체
	 */
	public List<NoticeBoardVO> getALLBoardList();
	
	/**
	 * 주어진 게시글번호가 존재하는지 여부를 알아내기 위한 메서드
	 * @param noticeboardNum	검색할 게시글번호
	 * @return	해당게시글번호가 있으면 게시글정보 리턴함.
	 */
	public NoticeBoardVO getBoard(String noticeboardNum);
	
	/**
	 * 하나의 NoticeBoardVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param bv update할 회원 정보가 담긴 NoticeBoardVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateBoard(NoticeBoardVO bv);
	
	/**
	 * 게시글번호를 매개변수로 받아서 해당 게시글정보를 삭제하는 메서드
	 * @param noticeboardNum 삭제할 게시글번호
	 * @return 작업성공 : 1, 작업실패: 0
	 */
	public int delteBoard(String noticeboardNum);
	
	
}
