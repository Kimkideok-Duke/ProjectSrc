package db;

import java.util.Date;

public class Notice {
	private String noticeno;
    private String nttitle;
	private Date ntdate;
    private String ntcontent;
    public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(String noticeno, String nttitle, Date ntdate, String ntcontent) {
		super();
		this.noticeno = noticeno;
		this.nttitle = nttitle;
		this.ntdate = ntdate;
		this.ntcontent = ntcontent;
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
	public Date getNtdate() {
		return ntdate;
	}
	public void setNtdate(Date ntdate) {
		this.ntdate = ntdate;
	}
	public String getNtcontent() {
		return ntcontent;
	}
	public void setNtcontent(String ntcontent) {
		this.ntcontent = ntcontent;
	}
}

