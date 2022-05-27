package spectrum.board.vo;

public class QuestionAnswerBoardVO {
	
	private String questionboardNum;
	private String qstn_ansbrdCn;
	private String adminId;
	private String questionAnswerboardNum;
	
	
	
	
	
	
	public QuestionAnswerBoardVO() {
	}
	public QuestionAnswerBoardVO(String questionboardNum, String qstn_ansbrdCn, String adminId,
			String questionAnswerboardNum) {
		this.questionboardNum = questionboardNum;
		this.qstn_ansbrdCn = qstn_ansbrdCn;
		this.adminId = adminId;
		this.questionAnswerboardNum = questionAnswerboardNum;
	}
	public String getQuestionAnswerboardNum() {
		return questionAnswerboardNum;
	}
	public void setQuestionAnswerboardNum(String questionAnswerboardNum) {
		this.questionAnswerboardNum = questionAnswerboardNum;
	}
	public String getQuestionboardNum() {
		return questionboardNum;
	}
	public void setQuestionboardNum(String questionboardNum) {
		this.questionboardNum = questionboardNum;
	}
	public String getQstn_ansbrdCn() {
		return qstn_ansbrdCn;
	}
	public void setQstn_ansbrdCn(String qstn_ansbrdCn) {
		this.qstn_ansbrdCn = qstn_ansbrdCn;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	
	
	
}
