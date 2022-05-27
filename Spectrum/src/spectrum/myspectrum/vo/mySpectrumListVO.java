
package spectrum.myspectrum.vo;


public class mySpectrumListVO{
	
	private String mbticode;
	private String memberNickname;
	private String memberProfileimagepath;
	private String memberStatusmessage;
	private String memberId;
	private String specbrdSrlnmbr;
    private long spctatcId =1;
    private String specbrdCn;
   
    
    
    
    
    
	public mySpectrumListVO() {
	}
	public mySpectrumListVO(String mbticode, String memberNickname, String memberProfileimagepath,
			String memberStatusmessage, String memberId, String specbrdSrlnmbr, long spctatcId,
			String specbrdCn) {
		this.mbticode = mbticode;
		this.memberNickname = memberNickname;
		this.memberProfileimagepath = memberProfileimagepath;
		this.memberStatusmessage = memberStatusmessage;
		this.memberId = memberId;
		this.specbrdSrlnmbr = specbrdSrlnmbr;
		this.spctatcId = spctatcId;
		this.specbrdCn = specbrdCn;
	}
	public String getSpecbrdSrlnmbr() {
		return specbrdSrlnmbr;
	}
	public void setSpecbrdSrlnmbr(String specbrdSrlnmbr) {
		this.specbrdSrlnmbr = specbrdSrlnmbr;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMbticode() {
		return mbticode;
	}
	public void setMbticode(String mbticode) {
		this.mbticode = mbticode;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberProfileimagepath() {
		return memberProfileimagepath;
	}
	public void setMemberProfileimagepath(String memberProfileimagepath) {
		this.memberProfileimagepath = memberProfileimagepath;
	}
	public String getMemberStatusmessage() {
		return memberStatusmessage;
	}
	public void setMemberStatusmessage(String memberStatusmessage) {
		this.memberStatusmessage = memberStatusmessage;
	}
	public long getSpctatcId() {
		return spctatcId;
	}
	public void setSpctatcId(long spctatcId) {
		this.spctatcId = spctatcId;
	}
	public String getSpecbrdCn() {
		return specbrdCn;
	}
	public void setSpecbrdCn(String specbrdCn) {
		this.specbrdCn = specbrdCn;
	}
	
	
}
	