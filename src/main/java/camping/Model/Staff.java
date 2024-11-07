package camping.Model;

public class Staff {

	private String username;
	private String password;
	private int staffIC;
	private int adminID;
	private String staffName;
	private String staffEmail;
	private String staffPhoneno;
	
	public Staff() {}

	public String getUsername() {
		return username;
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

	public int getStaffIC() {
		return staffIC;
	}

	public void setStaffIC(int staffIC) {
		this.staffIC = staffIC;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffEmail() {
		return staffEmail;
	}

	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}

	public String getStaffPhoneno() {
		return staffPhoneno;
	}

	public void setStaffPhoneno(String staffPhoneno) {
		this.staffPhoneno = staffPhoneno;
	}

	public int getAdminID() {
		return adminID;
	}

	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}
	
	
}
