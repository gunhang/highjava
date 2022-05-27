package spctrum.report.dao;

import java.util.List;

import spctrum.report.vo.ReportVO;


public interface IReportDao {
	/**
	 * DB의 mymember 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return MemberVO객체를 담고 있는 List 객체
	 */
	public List<ReportVO> getALLUserReportList();
	
	/**
	 * DB의 mymember 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return MemberVO객체를 담고 있는 List 객체
	 */
	public List<ReportVO> getALLBoardReportList();
	
	/**
	 * 게시글번호를 매개변수로 받아서 해당 게시글정보를 삭제하는 메서드
	 * @param noticeboardNum 삭제할 게시글번호
	 * @return 작업성공 : 1, 작업실패: 0
	 */
	public int deleteBoardReport(String boardreportNumber);
	
	/**
	 * 게시글번호를 매개변수로 받아서 해당 게시글정보를 삭제하는 메서드
	 * @param noticeboardNum 삭제할 게시글번호
	 * @return 작업성공 : 1, 작업실패: 0
	 */
	public int deleteUserReport(String memberReportNum);
	
	/**
	 * 게시글번호를 매개변수로 받아서 해당 게시글정보를 삭제하는 메서드
	 * @param noticeboardNum 삭제할 게시글번호
	 * @return 작업성공 : 1, 작업실패: 0
	 */
	public int deleteBoardUseIdReport(String memberId);
	
	/**
	 * 게시글번호를 매개변수로 받아서 해당 게시글정보를 삭제하는 메서드
	 * @param noticeboardNum 삭제할 게시글번호
	 * @return 작업성공 : 1, 작업실패: 0
	 */
	public int deleteUserUseIdReport(String memberReportedId);
}
