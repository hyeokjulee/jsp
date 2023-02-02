package jdbc;

public class FeedDTO {
	private String no, id, content, ts;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTs() {
		return ts;
	}

	public void setTs(String ts) {
		this.ts = ts;
	}

	public FeedDTO(String no, String id, String content, String ts) {
		super();
		this.no = no;
		this.id = id;
		this.content = content;
		this.ts = ts;
	}
}