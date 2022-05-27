package spectrum.rank.vo;

public class RankVO {
	
	private String memberId;
	private String rankMemrank;
	private String memberWithdrawalyn;
	private String memberSigndate;
	private String memberHartnum;
	private String rankBenefit;
	
	
	
	
	public RankVO() {
	}
	
	public RankVO(String memberId, String rankMemrank, String memberWithdrawalyn, String memberSigndate,
			String memberHartnum, String rankBenefit) {
		super();
		this.memberId = memberId;
		this.rankMemrank = rankMemrank;
		this.memberWithdrawalyn = memberWithdrawalyn;
		this.memberSigndate = memberSigndate;
		this.memberHartnum = memberHartnum;
		this.rankBenefit = rankBenefit;
	}

	public String getRankBenefit() {
		return rankBenefit;
	}
	public void setRankBenefit(String rankBenefit) {
		this.rankBenefit = rankBenefit;
	}
	public String getMemberSigndate() {
		return memberSigndate;
	}
	public void setMemberSigndate(String memberSigndate) {
		this.memberSigndate = memberSigndate;
	}
	public String getMemberHartnum() {
		return memberHartnum;
	}
	public void setMemberHartnum(String memberHartnum) {
		this.memberHartnum = memberHartnum;
	}
	public String getMemberWithdrawalyn() {
		return memberWithdrawalyn;
	}
	public void setMemberWithdrawalyn(String memberWithdrawalyn) {
		this.memberWithdrawalyn = memberWithdrawalyn;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRankMemrank() {
		return rankMemrank;
	}
	public void setRankMemrank(String rankMemrank) {
		this.rankMemrank = rankMemrank;
	}
	
	
}
