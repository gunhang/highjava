package spectrum.board.atch;

import java.sql.SQLException;
import java.util.List;


public interface IAtchFileDao {

	
	
	/**
	 * 첨부파일 저장
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	public int insertAtchFile(AtchFileVO atchFileVO) throws SQLException ;
	
	/**
	 * 첨부파일 저장
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	public int insertAtchFileDetail(AtchFileVO atchFileVO) throws SQLException ;
	/**
	 * 첨부파일 조회
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) throws SQLException;
	/**
	 * 첨부파일 세부정보 조회 메서드
	 * @param atchFileVO
	 * @return 해당정보로 조회한 첨부파일 세부정보
	 * @throws SQLException
	 */
	public AtchFileVO getAtchFileDetaul(AtchFileVO atchFileVO) throws SQLException;
	
	

}
