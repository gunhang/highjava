package spectrum.mbtiSurvey.vo;

public class MbtiIndicatorVO {
	private double mbtiIndicatorsEI;
	private double mbtiIndicatorsSN;
	private double mbtiIndicatorsTF;
	private double mbtiIndicatorsJP;
	

	public MbtiIndicatorVO(double mbtiIndicatorsEI, double mbtiIndicatorsSN, double mbtiIndicatorsTF, double mbtiIndicatorsJP) {
		this.mbtiIndicatorsEI = mbtiIndicatorsEI;
		this.mbtiIndicatorsSN = mbtiIndicatorsSN;
		this.mbtiIndicatorsTF = mbtiIndicatorsTF;
		this.mbtiIndicatorsJP = mbtiIndicatorsJP;
	}
	
	public MbtiIndicatorVO() {
	}
	
	public String getMbtiCode() {
		String mbtiCode = null;
		if (mbtiIndicatorsEI >= 50) {
			mbtiCode = "E";
		} else {
			mbtiCode = "I";
		}
		if (mbtiIndicatorsSN >= 50) {
			mbtiCode += "S";
		} else {
			mbtiCode += "N";
		}
		if (mbtiIndicatorsTF >= 50) {
			mbtiCode += "T";
		} else {
			mbtiCode += "F";
		}
		if (mbtiIndicatorsJP >= 50) {
			mbtiCode += "J";
		} else {
			mbtiCode += "P";
		}
		return mbtiCode;
	}
	
	//기본검사 문항수 기준 백분율로 변환
	public void changeBasicValues() {
		mbtiIndicatorsEI = mbtiIndicatorsEI / 70 * 100;
		mbtiIndicatorsSN = mbtiIndicatorsSN / 70 * 100;
		mbtiIndicatorsTF = mbtiIndicatorsTF / 70 * 100;
		mbtiIndicatorsJP = mbtiIndicatorsJP / 70 * 100;
	}

	public double getMbtiIndicatorsEI() {
		return mbtiIndicatorsEI;
	}

	public void setMbtiIndicatorsEI(double mbtiIndicatorsEI) {
		this.mbtiIndicatorsEI = mbtiIndicatorsEI;
	}

	public double getMbtiIndicatorsSN() {
		return mbtiIndicatorsSN;
	}

	public void setMbtiIndicatorsSN(double mbtiIndicatorsSN) {
		this.mbtiIndicatorsSN = mbtiIndicatorsSN;
	}

	public double getMbtiIndicatorsTF() {
		return mbtiIndicatorsTF;
	}

	public void setMbtiIndicatorsTF(double mbtiIndicatorsTF) {
		this.mbtiIndicatorsTF = mbtiIndicatorsTF;
	}

	public double getMbtiIndicatorsJP() {
		return mbtiIndicatorsJP;
	}

	public void setMbtiIndicatorsJP(double mbtiIndicatorsJP) {
		this.mbtiIndicatorsJP = mbtiIndicatorsJP;
	}

}
