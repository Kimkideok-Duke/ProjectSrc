package faq;

import java.util.Date;

public class FAQ {
    private String faqno;
    private String question;
	private Date faqdate;
	private String faqdateS;
    private String answer;
	public FAQ() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQ(String faqno, String question, String faqdateS, String answer) {
		super();
		this.faqno = faqno;
		this.question = question;
		this.faqdateS = faqdateS;
		this.answer = answer;
	}
	public FAQ(String faqno, String question, String answer) {
		super();
		this.faqno = faqno;
		this.question = question;
		this.answer = answer;
	}
	public String getFaqno() {
		return faqno;
	}
	public void setFaqno(String faqno) {
		this.faqno = faqno;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Date getFaqdate() {
		return faqdate;
	}
	public void setFaqdate(Date faqdate) {
		this.faqdate = faqdate;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getFaqdateS() {
		return faqdateS;
	}
	public void setFaqdateS(String faqdateS) {
		this.faqdateS = faqdateS;
	}
	
}
