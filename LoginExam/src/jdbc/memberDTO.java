package jdbc;

public class memberDTO {

	private String mno;
	private String mname;
	private String mid;
	private String mpass;
	private String mgender;
	private String memail;
	private String mdate;
	
	public String getMno() {
		return mno;
	}
	public String getMname() {
		return mname;
	}
	public String getMid() {
		return mid;
	}
	public String getMpass() {
		return mpass;
	}
	public String getMgender() {
		return mgender;
	}
	public String getMemail() {
		return memail;
	}
	public String getMdate() {
		return mdate;
	}
	
	public memberDTO(String mno, String mname, String mid, String mpass, String mgender, String memail, String mdate) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mid = mid;
		this.mpass = mpass;
		this.mgender = mgender;
		this.memail = memail;
		this.mdate = mdate;
	}
}