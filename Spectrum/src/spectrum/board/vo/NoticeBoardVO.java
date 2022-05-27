package spectrum.board.vo;

public class NoticeBoardVO {
	
	private String noticeboardNum;
	private String noticeboardTitle;
	private String noticeboardContent;
	private String noticeboardDate;
	private String adminId;
	private String noticeboardType;
	
	
	
	
	public NoticeBoardVO() {
	}
	public NoticeBoardVO(String noticeboardNum, String noticeboardTitle, String noticeboardContent,
			String noticeboardDate, String adminId, String noticeboardType) {
		this.noticeboardNum = noticeboardNum;
		this.noticeboardTitle = noticeboardTitle;
		this.noticeboardContent = noticeboardContent;
		this.noticeboardDate = noticeboardDate;
		this.adminId = adminId;
		this.noticeboardType = noticeboardType;
	}
	public String getNoticeboardNum() {
		return noticeboardNum;
	}
	public void setNoticeboardNum(String noticeboardNum) {
		this.noticeboardNum = noticeboardNum;
	}
	public String getNoticeboardTitle() {
		return noticeboardTitle;
	}
	public void setNoticeboardTitle(String noticeboardTitle) {
		this.noticeboardTitle = noticeboardTitle;
	}
	public String getNoticeboardContent() {
		return noticeboardContent;
	}
	public void setNoticeboardContent(String noticeboardContent) {
		this.noticeboardContent = noticeboardContent;
	}
	public String getNoticeboardDate() {
		return noticeboardDate;
	}
	public void setNoticeboardDate(String noticeboardDate) {
		this.noticeboardDate = noticeboardDate;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getNoticeboardType() {
		return noticeboardType;
	}
	public void setNoticeboardType(String noticeboardType) {
		this.noticeboardType = noticeboardType;
	}
	
	
	
}
