package jdbc;

public class UserDTO {
	private String to;
	private String pass;
	private String name;
	private String content;
	
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public UserDTO(String to, String pass, String name, String content) {
		super();
		this.to = to;
		this.pass = pass;
		this.name = name;
		this.content = content;
	}
}
