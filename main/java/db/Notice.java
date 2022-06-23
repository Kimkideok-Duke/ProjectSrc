package db;

public class Notice {
	private String noticeno;
    private String nttitle;
    private String ntcontent;
    
    public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(String noticeno, String nttitle, String ntcontent) {
		super();
		this.noticeno = noticeno;
		this.nttitle = nttitle;
		this.ntcontent = ntcontent;
	}

	public String getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}

	public String getNttitle() {
		return nttitle;
	}

	public void setNttitle(String nttitle) {
		this.nttitle = nttitle;
	}

	public String getNtcontent() {
		return ntcontent;
	}

	public void setNtcontent(String ntcontent) {
		this.ntcontent = ntcontent;
	}

}

