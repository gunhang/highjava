package spectrum.board.vo;

public class QuestionBoardVO {
	
	 private String questionboardNumber;
	 private String memberId;
	 private String questionboardTitle;
	 private String questionboardContent;
	 private String questionboardDate;
	 private String questionboardAnsweryn;
	 
	 
	 
	 
	 
	 
	public QuestionBoardVO() {
	}
	public QuestionBoardVO(String questionboardNumber, String memberId, String questionboardTitle,
			String questionboardContent, String questionboardDate, String questionboardAnsweryn) {
		this.questionboardNumber = questionboardNumber;
		this.memberId = memberId;
		this.questionboardTitle = questionboardTitle;
		this.questionboardContent = questionboardContent;
		this.questionboardDate = questionboardDate;
		this.questionboardAnsweryn = questionboardAnsweryn;
	}
	public String getQuestionboardNumber() {
		return questionboardNumber;
	}
	public void setQuestionboardNumber(String questionboardNumber) {
		this.questionboardNumber = questionboardNumber;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getQuestionboardTitle() {
		return questionboardTitle;
	}
	public void setQuestionboardTitle(String questionboardTitle) {
		this.questionboardTitle = questionboardTitle;
	}
	public String getQuestionboardContent() {
		return questionboardContent;
	}
	public void setQuestionboardContent(String questionboardContent) {
		this.questionboardContent = questionboardContent;
	}
	public String getQuestionboardDate() {
		return questionboardDate;
	}
	public void setQuestionboardDate(String questionboardDate) {
		this.questionboardDate = questionboardDate;
	}
	public String getQuestionboardAnsweryn() {
		return questionboardAnsweryn;
	}
	public void setQuestionboardAnsweryn(String questionboardAnsweryn) {
		this.questionboardAnsweryn = questionboardAnsweryn;
	}
	 
	 
}
