package spectrum.mbtiResult.vo;

import spectrum.mbtiSurvey.vo.MbtiIndicatorVO;

public class MbtiResultVO {
	private String mbtiResultUniquekey;
	private String mbtiCode;
	private String memberId;
	private String mbtiResultDate;
	private String mbtiIndicatorsEI;
	private String mbtiIndicatorsSN;
	private String mbtiIndicatorsTF;
	private String mbtiIndicatorsJP;
	private String mbtiResultLatestYn;
	private String mbtiResultExtraYn;
	
	public MbtiResultVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public MbtiResultVO(String mbtiCode, String memberId, MbtiIndicatorVO vo) {
		this.mbtiCode = mbtiCode;
		this.memberId = memberId;
		setMbtiIndicators(vo);
	}



	

	public MbtiResultVO(String mbtiResultUniquekey, String mbtiCode, String memberId, String mbtiResultDate,
			String mbtiIndicatorsEI, String mbtiIndicatorsSN, String mbtiIndicatorsTF, String mbtiIndicatorsJP,
			String mbtiResultLatestYn, String mbtiResultExtraYn) {
		super();
		this.mbtiResultUniquekey = mbtiResultUniquekey;
		this.mbtiCode = mbtiCode;
		this.memberId = memberId;
		this.mbtiResultDate = mbtiResultDate;
		this.mbtiIndicatorsEI = mbtiIndicatorsEI;
		this.mbtiIndicatorsSN = mbtiIndicatorsSN;
		this.mbtiIndicatorsTF = mbtiIndicatorsTF;
		this.mbtiIndicatorsJP = mbtiIndicatorsJP;
		this.mbtiResultLatestYn = mbtiResultLatestYn;
		this.mbtiResultExtraYn = mbtiResultExtraYn;
	}



	public void setMbtiIndicators(MbtiIndicatorVO vo) {
		this.mbtiIndicatorsEI = Double.toString(vo.getMbtiIndicatorsEI());
		this.mbtiIndicatorsSN = Double.toString(vo.getMbtiIndicatorsSN());
		this.mbtiIndicatorsTF = Double.toString(vo.getMbtiIndicatorsTF());
		this.mbtiIndicatorsJP = Double.toString(vo.getMbtiIndicatorsJP());
	}

	public String getMbtiResultUniquekey() {
		return mbtiResultUniquekey;
	}
	public void setMbtiResultUniquekey(String mbtiResultUniquekey) {
		this.mbtiResultUniquekey = mbtiResultUniquekey;
	}
	public String getMbtiCode() {
		return mbtiCode;
	}
	public void setMbtiCode(String mbtiCode) {
		this.mbtiCode = mbtiCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMbtiResultDate() {
		return mbtiResultDate;
	}
	public void setMbtiResultDate(String mbtiResultDate) {
		this.mbtiResultDate = mbtiResultDate;
	}
	public String getMbtiIndicatorsEI() {
		return mbtiIndicatorsEI;
	}
	public void setMbtiIndicatorsEI(String mbtiIndicatorsET) {
		this.mbtiIndicatorsEI = mbtiIndicatorsET;
	}
	public String getMbtiIndicatorsSN() {
		return mbtiIndicatorsSN;
	}
	public void setMbtiIndicatorsSN(String mbtiIndicatorsSN) {
		this.mbtiIndicatorsSN = mbtiIndicatorsSN;
	}
	public String getMbtiIndicatorsTF() {
		return mbtiIndicatorsTF;
	}
	public void setMbtiIndicatorsTF(String mbtiIndicatorsTF) {
		this.mbtiIndicatorsTF = mbtiIndicatorsTF;
	}
	public String getMbtiIndicatorsJP() {
		return mbtiIndicatorsJP;
	}
	public void setMbtiIndicatorsJP(String mbtiIndicatorsJP) {
		this.mbtiIndicatorsJP = mbtiIndicatorsJP;
	}
	public String getMbtiResultLatestYN() {
		return mbtiResultLatestYn;
	}
	public void setMbtiResultLatestYN(String mbtiResultLatestYN) {
		this.mbtiResultLatestYn = mbtiResultLatestYN;
	}
	public String getMbtiResultAddYN() {
		return mbtiResultExtraYn;
	}
	public void setMbtiResultAddYN(String mbtiResultAddYN) {
		this.mbtiResultExtraYn = mbtiResultAddYN;
	}
	
	

}
