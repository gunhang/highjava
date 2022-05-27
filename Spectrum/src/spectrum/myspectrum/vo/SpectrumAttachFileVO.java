
package spectrum.myspectrum.vo;

import java.util.Date;

public class SpectrumAttachFileVO{
	
	
	private long spctatcId = -1;
	private Date spctatcDate;
	private String spctatcUseyn;
	private String spctatcSerialnum;
	private long spctatcdtlNum = 1;
	private String spctatcdtlPath;
	private String spctatcdtlOriginalname;
	private String spctatcdtlType;
	private long spctatcdtlSize = 0;
	private String spctatcdtlContent;
	private String spctatcdtlExtension;
	
	
	
	
	
	public SpectrumAttachFileVO() {
	}
	public SpectrumAttachFileVO(long spctatcId, Date spctatcDate, String spctatcUseyn, String spctatcSerialnum,
			long spctatcdtlNum, String spctatcdtlPath, String spctatcdtlOriginalname, String spctatcdtlType,
			long spctatcdtlSize, String spctatcdtlContent, String spctatcdtlExtension) {
		this.spctatcId = spctatcId;
		this.spctatcDate = spctatcDate;
		this.spctatcUseyn = spctatcUseyn;
		this.spctatcSerialnum = spctatcSerialnum;
		this.spctatcdtlNum = spctatcdtlNum;
		this.spctatcdtlPath = spctatcdtlPath;
		this.spctatcdtlOriginalname = spctatcdtlOriginalname;
		this.spctatcdtlType = spctatcdtlType;
		this.spctatcdtlSize = spctatcdtlSize;
		this.spctatcdtlContent = spctatcdtlContent;
		this.spctatcdtlExtension = spctatcdtlExtension;
	}
	public long getSpctatcId() {
		return spctatcId;
	}
	public void setSpctatcId(long spctatcId) {
		this.spctatcId = spctatcId;
	}
	public Date getSpctatcDate() {
		return spctatcDate;
	}
	public void setSpctatcDate(Date spctatcDate) {
		this.spctatcDate = spctatcDate;
	}
	public String getSpctatcUseyn() {
		return spctatcUseyn;
	}
	public void setSpctatcUseyn(String spctatcUseyn) {
		this.spctatcUseyn = spctatcUseyn;
	}
	public String getSpctatcSerialnum() {
		return spctatcSerialnum;
	}
	public void setSpctatcSerialnum(String spctatcSerialnum) {
		this.spctatcSerialnum = spctatcSerialnum;
	}
	public long getSpctatcdtlNum() {
		return spctatcdtlNum;
	}
	public void setSpctatcdtlNum(long spctatcdtlNum) {
		this.spctatcdtlNum = spctatcdtlNum;
	}
	public String getSpctatcdtlPath() {
		return spctatcdtlPath;
	}
	public void setSpctatcdtlPath(String spctatcdtlPath) {
		this.spctatcdtlPath = spctatcdtlPath;
	}
	public String getSpctatcdtlOriginalname() {
		return spctatcdtlOriginalname;
	}
	public void setSpctatcdtlOriginalname(String spctatcdtlOriginalname) {
		this.spctatcdtlOriginalname = spctatcdtlOriginalname;
	}
	public String getSpctatcdtlType() {
		return spctatcdtlType;
	}
	public void setSpctatcdtlType(String spctatcdtlType) {
		this.spctatcdtlType = spctatcdtlType;
	}
	public long getSpctatcdtlSize() {
		return spctatcdtlSize;
	}
	public void setSpctatcdtlSize(long spctatcdtlSize) {
		this.spctatcdtlSize = spctatcdtlSize;
	}
	public String getSpctatcdtlContent() {
		return spctatcdtlContent;
	}
	public void setSpctatcdtlContent(String spctatcdtlContent) {
		this.spctatcdtlContent = spctatcdtlContent;
	}
	public String getSpctatcdtlExtension() {
		return spctatcdtlExtension;
	}
	public void setSpctatcdtlExtension(String spctatcdtlExtension) {
		this.spctatcdtlExtension = spctatcdtlExtension;
	}


	
}
