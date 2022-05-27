
package spectrum.myspectrum.vo;


public class SpectrumBoardVO{
	
	
	private String specbrdSrlnmbr;
	private String specbrdCn;
	private String specbrdLikenum;
	private String specbrdParentserialnum;
	private String memberId;
	private String specbrdDate;
	private String memberNickname;
    private long   spctatcId =-1;

	
	
    public SpectrumBoardVO(){
    }
    


	public SpectrumBoardVO(String specbrdSrlnmbr, String specbrdCn, String specbrdLikenum,
			String specbrdParentserialnum, String memberId, String specbrdDate) {
		this.specbrdSrlnmbr = specbrdSrlnmbr;
		this.specbrdCn = specbrdCn;
		this.specbrdLikenum = specbrdLikenum;
		this.specbrdParentserialnum = specbrdParentserialnum;
		this.memberId = memberId;
		this.specbrdDate = specbrdDate;
		
	}


	public SpectrumBoardVO(String specbrdSrlnmbr, String specbrdCn, String specbrdLikenum,
			String specbrdParentserialnum, String memberId, String specbrdDate, long spctatcId
			,String memberNickname) {
		this.specbrdSrlnmbr = specbrdSrlnmbr;
		this.specbrdCn = specbrdCn;
		this.specbrdLikenum = specbrdLikenum;
		this.specbrdParentserialnum = specbrdParentserialnum;
		this.memberId = memberId;
		this.specbrdDate = specbrdDate;
		this.spctatcId = spctatcId;
		this.memberNickname=memberNickname;
	}


	public long getSpctatcId() {
		return spctatcId;
	}


	public void setSpctatcId(long spctatcId) {
		this.spctatcId = spctatcId;
	}


	public String getSpecbrdSrlnmbr(){
        return specbrdSrlnmbr;
    }

    public void setSpecbrdSrlnmbr(String specbrdSrlnmbr){
        this.specbrdSrlnmbr = specbrdSrlnmbr;
    }

    public String getSpecbrdCn(){
        return specbrdCn;
    }

    public void setSpecbrdCn(String specbrdCn){
        this.specbrdCn = specbrdCn;
    }

    public String getSpecbrdLikenum(){
        return specbrdLikenum;
    }

    public void setSpecbrdLikenum(String specbrdLikenum){
        this.specbrdLikenum = specbrdLikenum;
    }

    public String getSpecbrdParentserialnum(){
        return specbrdParentserialnum;
    }

    public void setSpecbrdParentserialnum(String specbrdParentserialnum){
        this.specbrdParentserialnum = specbrdParentserialnum;
    }

    public String getMemberId(){
        return memberId;
    }

    public void setMemberId(String memberId){
        this.memberId = memberId;
    }

    public String getSpecbrdDate(){
        return specbrdDate;
    }

    public void setSpecbrdDate(String specbrdDate){
        this.specbrdDate = specbrdDate;
    }



	public String getMemberNickname() {
		return memberNickname;
	}



	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
    

}
