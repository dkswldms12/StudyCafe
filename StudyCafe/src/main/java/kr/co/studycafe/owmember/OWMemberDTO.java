package kr.co.studycafe.owmember;

public class OWMemberDTO {
	private String owid;
	private String owpasswd;
	private String owname;
	private String owgender;
	private String owbirth;
	private String owphone;
	private String owemail;
	private String owjoindate;
	
	public OWMemberDTO() {}

	public String getOwid() {
		return owid;
	}

	public void setOwid(String owid) {
		this.owid = owid;
	}

	public String getOwpasswd() {
		return owpasswd;
	}

	public void setOwpasswd(String owpasswd) {
		this.owpasswd = owpasswd;
	}

	public String getOwname() {
		return owname;
	}

	public void setOwname(String owname) {
		this.owname = owname;
	}

	public String getOwgender() {
		return owgender;
	}

	public void setOwgender(String owgender) {
		this.owgender = owgender;
	}

	public String getOwbirth() {
		return owbirth;
	}

	public void setOwbirth(String owbirth) {
		this.owbirth = owbirth;
	}

	public String getOwphone() {
		return owphone;
	}

	public void setOwphone(String owphone) {
		this.owphone = owphone;
	}

	public String getOwemail() {
		return owemail;
	}

	public void setOwemail(String owemail) {
		this.owemail = owemail;
	}

	public String getOwjoindate() {
		return owjoindate;
	}

	public void setOwjoindate(String owjoindate) {
		this.owjoindate = owjoindate;
	}

	@Override
	public String toString() {
		return "OWMemberDTO [owid=" + owid + ", owpasswd=" + owpasswd + ", owname=" + owname + ", owgender=" + owgender
				+ ", owbirth=" + owbirth + ", owphone=" + owphone + ", owemail=" + owemail + ", owjoindate="
				+ owjoindate + "]";
	}

}
