package jdbc;

public class BoardDTO {

	private String bno;
	private String btitle;
	private String bwriter;
	private String bcontent;
	private String bdate;
	
	public String getBno() {
		return bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public String getBwriter() {
		return bwriter;
	}
	public String getBcontent() {
		return bcontent;
	}
	public String getBdate() {
		return bdate;
	}
	
	public BoardDTO(String bno, String btitle, String bwriter, String bcontent, String bdate) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bcontent = bcontent;
		this.bdate = bdate;
	}
}