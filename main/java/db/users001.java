package db;

public class users001 {
	private String userno;
	private String id;
	private String passwd;
	private String nickname;
	private String gender;
	private int age;
	private String loc;
	private String interest1;
	private String interest2;
	private String interest3;
	private String interest4;
	private String interest5;

	public users001() {
		super();
		// TODO Auto-generated constructor stub
	}

	public users001(String nickname, String gender, int age, String loc,
			String interest1, String interest2, String interest3, String interest4, String interest5) {
		super();
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.loc = loc;
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
		this.interest4 = interest4;
		this.interest5 = interest5;
	}

	public users001(String userno, String id, String passwd, String nickname, String gender, int age, String loc,
			String interest1, String interest2, String interest3, String interest4, String interest5) {
		super();
		this.userno = userno;
		this.id = id;
		this.passwd = passwd;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.loc = loc;
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
		this.interest4 = interest4;
		this.interest5 = interest5;
	}

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

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
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
	
}
