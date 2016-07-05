package domain;

/**
 * 管理员
 * @author jalena 
 */
public class Manager {

	/** ID */
	private int ID;
	/** 用户名 */
	private String userName;
	/** 用户密码 */
	private String userPwd;
	/** 用户邮箱 */
	private String email;

	public Manager() {
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Manager [ID=" + ID + ", userName=" + userName + ", userPwd=" + userPwd + ", email=" + email + "]";
	}

}
