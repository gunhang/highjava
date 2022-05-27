package spectrum.myatc.vo;

import java.util.Date;

public class MyAtcVO {
	
	private long	myflofileatcId = -1;    // 첨부파일ID  
	private Date 	myflofileatcDate;			// 생성일자
	private long	myflofileatcdtlNum = 1;         // 파일순번
	private String	myflofileatcdtlPath;  	// 파일저장경로
	private String	myflofileatcdtlStrefilenm;     	// 저장파일명
	private String	myflofileatcdtlOriginalname;   	// 원본파일명
	private String	myflofileatcdtlExtension;      	// 파일확장자
	private String	myflofileatcdtlContent;         	// 파일내용
	private long	myflofileatcdtlSize =0;       	// 파일크기
	private String  memberId;
	
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public long getMyflofileatcId() {
		return myflofileatcId;
	}
	public void setMyflofileatcId(long myflofileatcId) {
		this.myflofileatcId = myflofileatcId;
	}
	public Date getMyflofileatcDate() {
		return myflofileatcDate;
	}
	public void setMyflofileatcDate(Date myflofileatcDate) {
		this.myflofileatcDate = myflofileatcDate;
	}
	public long getMyflofileatcdtlNum() {
		return myflofileatcdtlNum;
	}
	public void setMyflofileatcdtlNum(long myflofileatcdtlNum) {
		this.myflofileatcdtlNum = myflofileatcdtlNum;
	}
	public String getMyflofileatcdtlPath() {
		return myflofileatcdtlPath;
	}
	public void setMyflofileatcdtlPath(String myflofileatcdtlPath) {
		this.myflofileatcdtlPath = myflofileatcdtlPath;
	}
	public String getMyflofileatcdtlStrefilenm() {
		return myflofileatcdtlStrefilenm;
	}
	public void setMyflofileatcdtlStrefilenm(String myflofileatcdtlStrefilenm) {
		this.myflofileatcdtlStrefilenm = myflofileatcdtlStrefilenm;
	}
	public String getMyflofileatcdtlOriginalname() {
		return myflofileatcdtlOriginalname;
	}
	public void setMyflofileatcdtlOriginalname(String myflofileatcdtlOriginalname) {
		this.myflofileatcdtlOriginalname = myflofileatcdtlOriginalname;
	}
	public String getMyflofileatcdtlExtension() {
		return myflofileatcdtlExtension;
	}
	public void setMyflofileatcdtlExtension(String myflofileatcdtlExtension) {
		this.myflofileatcdtlExtension = myflofileatcdtlExtension;
	}
	public String getMyflofileatcdtlContent() {
		return myflofileatcdtlContent;
	}
	public void setMyflofileatcdtlContent(String myflofileatcdtlContent) {
		this.myflofileatcdtlContent = myflofileatcdtlContent;
	}
	public long getMyflofileatcdtlSize() {
		return myflofileatcdtlSize;
	}
	public void setMyflofileatcdtlSize(long myflofileatcdtlSize) {
		this.myflofileatcdtlSize = myflofileatcdtlSize;
	}
	
	
}
