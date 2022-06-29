package db;

public class Result_Match {
	private String usernoM;
	private String usernoF;
	private String choiceMF;
	private String choiceFM;
	public Result_Match() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Result_Match(String usernoM, String usernoF, String choiceMF, String choiceFM) {
		this.usernoM = usernoM;
		this.usernoF = usernoF;
		this.choiceMF = choiceMF;
		this.choiceFM = choiceFM;
	}

	public Result_Match(String usernoM, String usernoF) {
		this.usernoM = usernoM;
		this.usernoF = usernoF;
	}

	public String getUsernoM() {
		return this.usernoM;
	}

	public void setUsernoM(String usernoM) {
		this.usernoM = usernoM;
	}

	public String getUsernoF() {
		return this.usernoF;
	}

	public void setUsernoF(String usernoF) {
		this.usernoF = usernoF;
	}

	public String getChoiceMF() {
		return this.choiceMF;
	}

	public void setChoiceMF(String choiceMF) {
		this.choiceMF = choiceMF;
	}

	public String getChoiceFM() {
		return this.choiceFM;
	}

	public void setChoiceFM(String choiceFM) {
		this.choiceFM = choiceFM;
	}	
	
}
