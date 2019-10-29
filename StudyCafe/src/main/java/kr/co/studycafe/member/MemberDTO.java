package kr.co.studycafe.member;

public class MemberDTO{
	private String gid;
	private String gpasswd;
	private String gname;
	private String ggender;
	private String gbirth;
	private String gphone;
	private String gemail;
	private String gaddr1;
	private String gaddr2;
	private String gaddr3;
	private String gjoindate;
	
	public MemberDTO() {}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getGpasswd() {
		return gpasswd;
	}

	public void setGpasswd(String gpasswd) {
		this.gpasswd = gpasswd;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGgender() {
		return ggender;
	}

	public void setGgender(String ggender) {
		this.ggender = ggender;
	}

	public String getGbirth() {
		return gbirth;
	}

	public void setGbirth(String gbirth) {
		this.gbirth = gbirth;
	}

	public String getGphone() {
		return gphone;
	}

	public void setGphone(String gphone) {
		this.gphone = gphone;
	}

	public String getGemail() {
		return gemail;
	}

	public void setGemail(String gemail) {
		this.gemail = gemail;
	}

	public String getGaddr1() {
		return gaddr1;
	}

	public void setGaddr1(String gaddr1) {
		this.gaddr1 = gaddr1;
	}

	public String getGaddr2() {
		return gaddr2;
	}

	public void setGaddr2(String gaddr2) {
		this.gaddr2 = gaddr2;
	}

	public String getGaddr3() {
		return gaddr3;
	}

	public void setGaddr3(String gaddr3) {
		this.gaddr3 = gaddr3;
	}

	public String getGjoindate() {
		return gjoindate;
	}

	public void setGjoindate(String gjoindate) {
		this.gjoindate = gjoindate;
	}

	@Override
	public String toString() {
		return "MemberDTO [gid=" + gid + ", gpasswd=" + gpasswd + ", gname=" + gname + ", ggender=" + ggender
				+ ", gbirth=" + gbirth + ", gphone=" + gphone + ", gemail=" + gemail + ", gaddr1=" + gaddr1
				+ ", gaddr2=" + gaddr2 + ", gaddr3=" + gaddr3 + ", gjoindate=" + gjoindate + "]";
	}
	
}
