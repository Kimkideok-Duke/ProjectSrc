package user;

public class User {
	private String userno;
	private String id;
	private String password;
	private String nickname;
	private String gender;
	private int age;
	private String loc;
	private String interest1;
	private String interest2;
	private String interest3;
	private String interest4;
	private String interest5;
	private String loc1;
	private String loc2;
	private String loc3;
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getInterest1() {
		return interest1;
	}
	public void setInterest1(String interest1) {
		this.interest1 = interest1;
	}
	public String getInterest2() {
		return interest2;
	}
	public void setInterest2(String interest2) {
		this.interest2 = interest2;
	}
	public String getInterest3() {
		return interest3;
	}
	public void setInterest3(String interest3) {
		this.interest3 = interest3;
	}
	public String getInterest4() {
		return interest4;
	}
	public void setInterest4(String interest4) {
		this.interest4 = interest4;
	}
	public String getInterest5() {
		return interest5;
	}
	public void setInterest5(String interest5) {
		this.interest5 = interest5;
	}
	public String getLoc1() {
		return loc1;
	}
	public void setLoc1(String loc1) {
		this.loc1 = loc1;
	}
	public String getLoc2() {
		return loc2;
	}
	public void setLoc2(String loc2) {
		this.loc2 = loc2;
	}
	public String getLoc3() {
		return loc3;
	}
	public void setLoc3(String loc3) {
		this.loc3 = loc3;
	}
	public User(String userno, String id, String password, String nickname, String gender, int age, String loc,
			String interest1, String interest2, String interest3, String interest4, String interest5, String loc1,
			String loc2, String loc3) {
		super();
		this.userno = userno;
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.loc = loc;
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
		this.interest4 = interest4;
		this.interest5 = interest5;
		this.loc1 = loc1;
		this.loc2 = loc2;
		this.loc3 = loc3;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
