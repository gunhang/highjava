package spectrum.mbtiSurvey.vo;

public class MbtiSurveyVO {
	private String mbtiSurveyNumber;
	private String mbtiSurveyContent;
	private String mbtiSurveyType;
	private String mbtiSurveyExtraYn;
	
	public MbtiSurveyVO() {
		
	}
	
	public MbtiSurveyVO(String mbtiSurveyNumber, String mbtiSurveyContent, String mbtiSurveyType,
			String mbtiSurveyAddyn) {
		this.mbtiSurveyNumber = mbtiSurveyNumber;
		this.mbtiSurveyContent = mbtiSurveyContent;
		this.mbtiSurveyType = mbtiSurveyType;
		this.mbtiSurveyExtraYn = mbtiSurveyAddyn;
	}
	public String getMbtiSurveyNumber() {
		return mbtiSurveyNumber;
	}
	public void setMbtiSurveyNumber(String mbtiSurveyNumber) {
		this.mbtiSurveyNumber = mbtiSurveyNumber;
	}
	public String getMbtiSurveyContent() {
		return mbtiSurveyContent;
	}
	public void setMbtiSurveyContent(String mbtiSurveyContent) {
		this.mbtiSurveyContent = mbtiSurveyContent;
	}
	public String getMbtiSurveyType() {
		return mbtiSurveyType;
	}
	public void setMbtiSurveyType(String mbtiSurveyType) {
		this.mbtiSurveyType = mbtiSurveyType;
	}
	public String getMbtiSurveyAddyn() {
		return mbtiSurveyExtraYn;
	}
	public void setMbtiSurveyAddyn(String mbtiSurveyAddyn) {
		this.mbtiSurveyExtraYn = mbtiSurveyAddyn;
	}
	
	

}
