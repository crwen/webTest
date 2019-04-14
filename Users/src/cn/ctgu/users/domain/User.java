package cn.ctgu.users.domain;

public class User {
	private String id;
	private String gender;
	private String username;
	private String password;
	private String password2;
	
	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	private String sign;
	private String verify;
	public String getVerify() {
		return verify;
	}

	public void setVerifyCode(String verify) {
		this.verify = verify;
	}

	public User(String username, String password, String sign) {
		super();
		this.username = username;
		this.password = password;
		this.sign = sign;
	}
	
	public User(){}

	public String getUsername() {
		return username;
	}
	
	
	public String getGender() {
		return gender;
	}

	public void setGender(String id) {
		this.gender = id;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password
				+ ", sign=" + sign + "]";
	}
	
	
}
