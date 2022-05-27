package spectrum.admin.vo;

public class AdminVO {
	
	private String adminId;
	private String adminPassword;
	private String adminRegno;
	private String adminPhonenum;
	private String adminZipcode;
	private String adminMail;
	private String adminNickname;
	private String adminAddr1;
	private String adminAddr2;
	private String adminWithdrawalyn;
	private String adminWthdrdate;
	
	
	
	
	public AdminVO() {}
	
	
	
	
	public AdminVO(String adminId, String adminPassword, String adminRegno, String adminPhonenum, String adminZipcode,
			String adminMail, String adminNickname, String adminAddr1, String adminAddr2, String adminWithdrawalyn,
			String adminWthdrdate) {
		super();
		this.adminId = adminId;
		this.adminPassword = adminPassword;
		this.adminRegno = adminRegno;
		this.adminPhonenum = adminPhonenum;
		this.adminZipcode = adminZipcode;
		this.adminMail = adminMail;
		this.adminNickname = adminNickname;
		this.adminAddr1 = adminAddr1;
		this.adminAddr2 = adminAddr2;
		this.adminWithdrawalyn = adminWithdrawalyn;
		this.adminWthdrdate = adminWthdrdate;
	}




	public String getAdminWithdrawalyn() {
		return adminWithdrawalyn;
	}
	public void setAdminWithdrawalyn(String adminWithdrawalyn) {
		this.adminWithdrawalyn = adminWithdrawalyn;
	}
	public String getAdminWthdrdate() {
		return adminWthdrdate;
	}
	public void setAdminWthdrdate(String adminWthdrdate) {
		this.adminWthdrdate = adminWthdrdate;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminRegno() {
		return adminRegno;
	}
	public void setAdminRegno(String adminRegno) {
		this.adminRegno = adminRegno;
	}
	public String getAdminPhonenum() {
		return adminPhonenum;
	}
	public void setAdminPhonenum(String adminPhonenum) {
		this.adminPhonenum = adminPhonenum;
	}
	public String getAdminZipcode() {
		return adminZipcode;
	}
	public void setAdminZipcode(String adminZipcode) {
		this.adminZipcode = adminZipcode;
	}
	public String getAdminMail() {
		return adminMail;
	}
	public void setAdminMail(String adminMail) {
		this.adminMail = adminMail;
	}
	public String getAdminNickname() {
		return adminNickname;
	}
	public void setAdminNickname(String adminNickname) {
		this.adminNickname = adminNickname;
	}
	public String getAdminAddr1() {
		return adminAddr1;
	}
	public void setAdminAddr1(String adminAddr1) {
		this.adminAddr1 = adminAddr1;
	}
	public String getAdminAddr2() {
		return adminAddr2;
	}
	public void setAdminAddr2(String adminAddr2) {
		this.adminAddr2 = adminAddr2;
	}
	
	
}
