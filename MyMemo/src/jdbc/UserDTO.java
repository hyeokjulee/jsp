package jdbc;

public class UserDTO {
	private String id, password, name, ts;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTs() {
		return ts;
	}

	public void setTs(String ts) {
		this.ts = ts;
	}

	public UserDTO(String id, String password, String name, String ts) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.ts = ts;
	}

	public UserDTO() {
	}
}
