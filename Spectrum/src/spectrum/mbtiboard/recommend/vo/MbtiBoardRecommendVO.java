package spectrum.mbtiboard.recommend.vo;

public class MbtiBoardRecommendVO {
	private String recommendationNumber;
	private String anonymousboardPostnum;
	private String mbtiboardPostnum;
	private String recommendationRecommendyn;
	private String memberId;
	
	
	
	
	
	public MbtiBoardRecommendVO() {
	}
	public MbtiBoardRecommendVO(String recommendationNumber, String anonymousboardPostnum, String mbtiboardPostnum,
			String recommendationRecommendyn, String memberId) {
		this.recommendationNumber = recommendationNumber;
		this.anonymousboardPostnum = anonymousboardPostnum;
		this.mbtiboardPostnum = mbtiboardPostnum;
		this.recommendationRecommendyn = recommendationRecommendyn;
		this.memberId = memberId;
	}
	public String getRecommendationNumber() {
		return recommendationNumber;
	}
	public void setRecommendationNumber(String recommendationNumber) {
		this.recommendationNumber = recommendationNumber;
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
	public String getRecommendationRecommendyn() {
		return recommendationRecommendyn;
	}
	public void setRecommendationRecommendyn(String recommendationRecommendyn) {
		this.recommendationRecommendyn = recommendationRecommendyn;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	

}
