package spectrum.myatc.dao;

import java.sql.SQLException;
import java.util.List;


import spectrum.myatc.vo.MyAtcVO;
import spectrum.rank.vo.RankVO;

public interface IMyAtcDao {
	/**
	 * 첨부파일 저장
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 * 
	 */
	
	public int insertAtchFile(MyAtcVO MyAtcVO) throws SQLException;
	
	/**
	 * 첨부파일 세부정보 저장
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	public int insertAtchFileDetail(MyAtcVO MyAtcVO) throws SQLException;
	
	/**
	 *  첨부파일 목록 조회
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	public List<MyAtcVO> getAtchFileList(MyAtcVO MyAtcVO) throws SQLException;
	
	/**
	 *  첨부파일 세부정보 조회 메서드
	 * @param atchFileVO 가져올 첨부파일 정보(아이디 및 순번)
	 * @return 해당 첨부파일정보
	 * @throws SQLException
	 */
	public MyAtcVO getAtchFileDetail(MyAtcVO MyAtcVO) throws SQLException;
	/**
	 * 하나의 RankVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param rv update할 회원 정보가 담긴 RankVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public String getAtcId(String memberId);
	
	/**
	 * DB의 Rank 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return RankVO객체를 담고 있는 List 객체
	 */
	public List<MyAtcVO> getALLAtcDtlList(String myflofileatcId);
	
	/**
	 * 하나의 MemberVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param mv update할 회원 정보가 담긴 MemberVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateAtcId(MyAtcVO atchFileVO);
	
	
}
