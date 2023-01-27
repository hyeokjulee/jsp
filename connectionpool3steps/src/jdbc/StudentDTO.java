package jdbc;

public class StudentDTO {

	private String hakbun;
	private String name;
	private String dept;
	private String addr;
	
	public String getHakbun() {
		return hakbun;
	}
	
	public void setHakbun(String hakbun) {
		this.hakbun = hakbun;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDept() {
		return dept;
	}
	
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}

	public StudentDTO(String hakbun, String name, String dept, String addr) {
		super();
		this.hakbun = hakbun;
		this.name = name;
		this.dept = dept;
		this.addr = addr;
	}
}