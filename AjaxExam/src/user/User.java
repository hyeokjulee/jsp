package user;

public class User {
	private String userName;
	private int userAge;
	private String userGender;
	private String userEmail;
	private String userPhone;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	public User(String userName, int userAge, String userGender, String userEmail, String userPhone) {
		super();
		this.userName = userName;
		this.userAge = userAge;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
	}
}
