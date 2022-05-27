package spectrum.mbtiboard.report.vo;

public class MbtiBoardReportVO {
	private String  boardreportNumber;
	private String 	anonymousboardPostnum;
	private String 	mbtiboardPostnum;
	private String 	boardreportDate;
	private String 	boardClassificationCode;
	private String 	memberId;
	private String  boardreportReason;
	
	
	
	
	
	public MbtiBoardReportVO() {
	}
	public MbtiBoardReportVO(String boardreportNumber, String anonymousboardPostnum, String mbtiboardPostnum,
			String boardreportDate, String boardClassificationCode, String memberId, String boardreportReason) {
		this.boardreportNumber = boardreportNumber;
		this.anonymousboardPostnum = anonymousboardPostnum;
		this.mbtiboardPostnum = mbtiboardPostnum;
		this.boardreportDate = boardreportDate;
		this.boardClassificationCode = boardClassificationCode;
		this.memberId = memberId;
		this.boardreportReason = boardreportReason;
	}
	public String getBoardreportNumber() {
		return boardreportNumber;
	}
	public void setBoardreportNumber(String boardreportNumber) {
		this.boardreportNumber = boardreportNumber;
	}
	public String getAnonymousboardPostnum() {
		return anonymousboardPostnum;
	}
	public void setAnonymousboardPostnum(String anonymousboardPostnum) {
		this.anonymousboardPostnum = anonymousboardPostnum;
	}
	public String getMbtiboardPostnum() {
		return mbtiboardPostnum;
	}
	public void setMbtiboardPostnum(String mbtiboardPostnum) {
		this.mbtiboardPostnum = mbtiboardPostnum;
	}
	public String getBoardreportDate() {
		return boardreportDate;
	}
	public void setBoardreportDate(String boardreportDate) {
		this.boardreportDate = boardreportDate;
	}
	public String getBoardClassificationCode() {
		return boardClassificationCode;
	}
	public void setBoardClassificationCode(String boardClassificationCode) {
		this.boardClassificationCode = boardClassificationCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardreportReason() {
		return boardreportReason;
	}
	public void setBoardreportReason(String boardreportReason) {
		this.boardreportReason = boardreportReason;
	}
	
	
	
	
	
}
