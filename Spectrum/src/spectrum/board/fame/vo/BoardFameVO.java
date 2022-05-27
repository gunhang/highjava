package spectrum.board.fame.vo;

public class BoardFameVO {
    private String mbtiboardPostnum;
    private String recommend;
    private String mbtiboardClassificationcode;
    private String mbtiboardTitle;
    private String mbtiboardTypecode;
    private String memberNickname;
    private String dateboard;
	
    
    
    
    public BoardFameVO() {
	}

	public BoardFameVO(String mbtiboardPostnum, String recommend, String mbtiboardClassificationcode,
			String mbtiboardTitle, String mbtiboardTypecode, String memberNickname, String dateboard) {
		super();
		this.mbtiboardPostnum = mbtiboardPostnum;
		this.recommend = recommend;
		this.mbtiboardClassificationcode = mbtiboardClassificationcode;
		this.mbtiboardTitle = mbtiboardTitle;
		this.mbtiboardTypecode = mbtiboardTypecode;
		this.memberNickname = memberNickname;
		this.dateboard = dateboard;
	}

	public String getMbtiboardPostnum() {
		return mbtiboardPostnum;
	}
	public void setMbtiboardPostnum(String mbtiboardPostnum) {
		this.mbtiboardPostnum = mbtiboardPostnum;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getMbtiboardClassificationcode() {
		return mbtiboardClassificationcode;
	}
	public void setMbtiboardClassificationcode(String mbtiboardClassificationcode) {
		this.mbtiboardClassificationcode = mbtiboardClassificationcode;
	}
	public String getMbtiboardTitle() {
		return mbtiboardTitle;
	}
	public void setMbtiboardTitle(String mbtiboardTitle) {
		this.mbtiboardTitle = mbtiboardTitle;
	}
	public String getMbtiboardTypecode() {
		return mbtiboardTypecode;
	}
	public void setMbtiboardTypecode(String mbtiboardTypecode) {
		this.mbtiboardTypecode = mbtiboardTypecode;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getDateboard() {
		return dateboard;
	}

	public void setDateboard(String dateboard) {
		this.dateboard = dateboard;
	}
    
    
    
}
