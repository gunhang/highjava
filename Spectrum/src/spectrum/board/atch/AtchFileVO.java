package spectrum.board.atch;

import java.util.Date;

public class AtchFileVO {
	
	private String boardAttachmentId ="-1";
	private String boardatcdtlNum;
	private String boardatcdtlPath;
	private String boardatcdtlOriginalname;
	private String boardatcdtlType;
	private   long boardatcdtlSize =0;
	private String boardatcdtlExtension;
	private String boardatcdtlContent;
	public AtchFileVO(String boardAttachmentId, String boardatcdtlNum, String boardatcdtlPath,
			String boardatcdtlOriginalname, String boardatcdtlType, long boardatcdtlSize, String boardatcdtlExtension,
			String boardatcdtlContent) {
		super();
		this.boardAttachmentId = boardAttachmentId;
		this.boardatcdtlNum = boardatcdtlNum;
		this.boardatcdtlPath = boardatcdtlPath;
		this.boardatcdtlOriginalname = boardatcdtlOriginalname;
		this.boardatcdtlType = boardatcdtlType;
		this.boardatcdtlSize = boardatcdtlSize;
		this.boardatcdtlExtension = boardatcdtlExtension;
		this.boardatcdtlContent = boardatcdtlContent;
	}
	
	
	
	public AtchFileVO() {
		super();
	}



	public String getBoardAttachmentId() {
		return boardAttachmentId;
	}
	public void setBoardAttachmentId(String boardAttachmentId) {
		this.boardAttachmentId = boardAttachmentId;
	}
	public String getBoardatcdtlNum() {
		return boardatcdtlNum;
	}
	public void setBoardatcdtlNum(String boardatcdtlNum) {
		this.boardatcdtlNum = boardatcdtlNum;
	}
	public String getBoardatcdtlPath() {
		return boardatcdtlPath;
	}
	public void setBoardatcdtlPath(String boardatcdtlPath) {
		this.boardatcdtlPath = boardatcdtlPath;
	}
	public String getBoardatcdtlOriginalname() {
		return boardatcdtlOriginalname;
	}
	public void setBoardatcdtlOriginalname(String boardatcdtlOriginalname) {
		this.boardatcdtlOriginalname = boardatcdtlOriginalname;
	}
	public String getBoardatcdtlType() {
		return boardatcdtlType;
	}
	public void setBoardatcdtlType(String boardatcdtlType) {
		this.boardatcdtlType = boardatcdtlType;
	}
	public long getBoardatcdtlSize() {
		return boardatcdtlSize;
	}
	public void setBoardatcdtlSize(long boardatcdtlSize) {
		this.boardatcdtlSize = boardatcdtlSize;
	}
	public String getBoardatcdtlExtension() {
		return boardatcdtlExtension;
	}
	public void setBoardatcdtlExtension(String boardatcdtlExtension) {
		this.boardatcdtlExtension = boardatcdtlExtension;
	}
	public String getBoardatcdtlContent() {
		return boardatcdtlContent;
	}
	public void setBoardatcdtlContent(String boardatcdtlContent) {
		this.boardatcdtlContent = boardatcdtlContent;
	}
	
	
	
	
	
	
	
}	
