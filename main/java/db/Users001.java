package db;

public class Users001 {
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
	private String image;
	private int age_s;
	private int age_e;
	private String auth;

	public Users001() {
		super();
	}
	
	public Users001(String userno, String id, String password, String nickname, String gender, int age, String loc,
			String interest1, String interest2, String interest3, String interest4, String interest5, String image,
			int age_s, int age_e, String auth) {
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
		this.image = image;
		this.age_s = age_s;
		this.age_e = age_e;
		this.auth = auth;
	}

	// 회원가입1
	public Users001(String id, String password, String nickname, String gender, int age, String loc) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.loc = loc;
	}	
	
	public Users001(String userno, String nickname, String gender, int age, String loc,
			String interest1, String interest2, String interest3, String interest4, String interest5) {
		super();
		this.userno = userno;
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
	
	public Users001(String nickname, String gender, int age, String loc,
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

	// 회원가입3 - 관심사
	public Users001(String interest1, String interest2, String interest3, String interest4,
			String interest5, String id) {
		super();
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
		this.interest4 = interest4;
		this.interest5 = interest5;
		this.id = id;
	}
	
	// 회원가입4 - 이미지(대신 파일명) 업로드
	public Users001(String image, String id) {
		this.image = image;
		this.id = id;
	}
	
	public Users001(String userno, String id, String password, String nickname, String gender, int age, String loc,
			String interest1, String interest2, String interest3, String interest4, String interest5) {
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
	}
	
	public Users001(String userno, String id, String password, String nickname, String gender, int age, String loc,
			String interest1, String interest2, String interest3, String interest4, String interest5,
			 int age_s, int age_e) {
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
		this.age_s = age_s;
		this.age_e = age_e;
	}

	public Users001(String gender, String loc, int age_s, int age_e) {
		super();
		this.gender = gender;
		this.loc = loc;
		this.age_s = age_s;
		this.age_e = age_e;
	}

	

	public Users001(String id, String nickname, String loc, String interest1, String interest2, String interest3,
			String interest4, String interest5) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.loc = loc;
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
		this.interest4 = interest4;
		this.interest5 = interest5;
	}

	public Users001(String userno) {
		super();
		this.userno = userno;
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
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getAge_s() {
		return age_s;
	}

	public void setAge_s(int age_s) {
		this.age_s = age_s;
	}

	public int getAge_e() {
		return age_e;
	}

	public void setAge_e(int age_e) {
		this.age_e = age_e;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
}
