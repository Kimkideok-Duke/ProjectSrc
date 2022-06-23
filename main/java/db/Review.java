package db;

import java.util.Date;

public class Review {
    private String reviewno;
    private String rvtitle;
	private String rvwriter;
    private String rvcontent;
	private Date rvdate;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(String reviewno, String rvtitle, String rvwriter, String rvcontent) {
		super();
		this.reviewno = reviewno;
		this.rvtitle = rvtitle;
		this.rvwriter = rvwriter;
		this.rvcontent = rvcontent;
	}
	public String getReviewno() {
		return reviewno;
	}
	public void setReviewno(String reviewno) {
		this.reviewno = reviewno;
	}
	public String getRvtitle() {
		return rvtitle;
	}
	public void setRvtitle(String rvtitle) {
		this.rvtitle = rvtitle;
	}
	public String getRvwriter() {
		return rvwriter;
	}
	public void setRvwriter(String rvwriter) {
		this.rvwriter = rvwriter;
	}
	public String getRvcontent() {
		return rvcontent;
	}
	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}

    
}
