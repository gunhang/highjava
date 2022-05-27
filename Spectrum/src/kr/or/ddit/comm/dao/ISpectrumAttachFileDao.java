package kr.or.ddit.comm.dao;

import java.sql.SQLException;
import java.util.List;

import spectrum.myspectrum.vo.SpectrumAttachFileVO;


public interface ISpectrumAttachFileDao {
	
   /**
    * 
    * @param atchFileVO
    * @return
    * @throws SQLException
    */
	public int insertAtchFile(SpectrumAttachFileVO spectrumAttachFileVO)
	throws SQLException;
	
	/**
	 * 첨부파일 세부정보 저장
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	public int insertAtchFileDetail(SpectrumAttachFileVO spectrumAttachFileVO)
			throws SQLException;
	/**
	 * 첨부파일 목록 조회
	 * @param atchFileVO
	 * @return
	 * @throws SQLException
	 */
	public List<SpectrumAttachFileVO> getAtchFileList(SpectrumAttachFileVO spectrumAttachFileVO)
			throws SQLException;
	
	/**
	 * 첨부파일 세부정보 조회 메서드
	 * @param atchFileVO 가져올 첨부파일 정보(아이디 및 순번)
	 * @return 해당 정보로 조회한 첨부파일 세부정보
	 * @throws SQLException
	 */
	public SpectrumAttachFileVO getAtchFileDetail(SpectrumAttachFileVO spectrumAttachFileVO)
			throws SQLException;
	public SpectrumAttachFileVO getFileName(long str) ;
}
