package notice;

import java.util.Date;

public class Notice {
	private int noticeno;
    private String nttitle;
	private Date ntdate;
    private String ntcontent;
    
    
    public Notice(String nttitle, String ntcontent) {
		super();
		this.nttitle = nttitle;
		this.ntcontent = ntcontent;
	}

	public Notice(String nttitle) {
		super();
		this.nttitle = nttitle;
	}

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
    
	public Notice(int noticeno, String nttitle, Date ntdate, String ntcontent) {
		super();
		this.noticeno = noticeno;
		this.nttitle = nttitle;
		this.ntdate = ntdate;
		this.ntcontent = ntcontent;
	}
	public Notice(int noticeno, String nttitle, String ntcontent) {
		super();
		this.noticeno = noticeno;
		this.nttitle = nttitle;
		this.ntcontent = ntcontent;
	}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
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

