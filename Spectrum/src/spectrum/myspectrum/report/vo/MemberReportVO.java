package spectrum.myspectrum.report.vo;

public class MemberReportVO {
	private String memberReportNum;
    private String memberReportedId;
    private String memberReportId;
    private String memberReportDate;
    private String memberReportReason;
    
    
    
    
    
	public MemberReportVO() {
	}
	public MemberReportVO(String memberReportNum, String memberReportedId, String memberReportId, String memberReportDate,
			String memberReportReason) {
		this.memberReportNum = memberReportNum;
		this.memberReportedId = memberReportedId;
		this.memberReportId = memberReportId;
		this.memberReportDate = memberReportDate;
		this.memberReportReason = memberReportReason;
	}
	public String getMemberReportNum() {
		return memberReportNum;
	}
	public void setMemberReportNum(String memberReportNum) {
		this.memberReportNum = memberReportNum;
	}
	public String getMemberReportedId() {
		return memberReportedId;
	}
	public void setMemberReportedId(String memberReportedId) {
		this.memberReportedId = memberReportedId;
	}
	public String getMemberReportId() {
		return memberReportId;
	}
	public void setMemberReportId(String memberReportId) {
		this.memberReportId = memberReportId;
	}
	public String getMemberReportDate() {
		return memberReportDate;
	}
	public void setMemberReportDate(String memberReportDate) {
		this.memberReportDate = memberReportDate;
	}
	public String getMemberReportReason() {
		return memberReportReason;
	}
	public void setMemberReportReason(String memberReportReason) {
		this.memberReportReason = memberReportReason;
	}
    



}
