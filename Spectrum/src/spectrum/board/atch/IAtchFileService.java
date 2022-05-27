package spectrum.board.atch;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.el.parser.AstListData;


public interface IAtchFileService {
	/**
	 * 첨부파일 목록을 저장하기 위한 메서드,
	 * @param req part 객체를 꺼내기위한 객체
	 * @return
	 * @throws Exception
	 */
	public  AtchFileVO saveAtchFileList(HttpServletRequest req)
			throws Exception;
	
	/**
	 * 첨부파일 목록 조회하기
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) throws SQLException;
	
	/**
	 * 첨부파일 세부정보 조회하기
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) throws SQLException;
}
