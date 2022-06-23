package db;

public class FAQ {
    private String faqno;
    private String question;
    private String answer;
	public FAQ() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
