package qna;

import java.sql.Date;

//		QNAIDX  NOT NULL NUMBER         
//		SUBJECT NOT NULL VARCHAR2(255)  
//		CONTENT NOT NULL VARCHAR2(4000) 
//		USERID           VARCHAR2(255)  
//		QNADATE          DATE  

public class QnaDTO {
	private int QnAidx;
	private String subject;
	private String content;
	private String userid;
	private Date qnaDate;
	
	public QnaDTO() {
		
	}

	public int getQnAidx() {
		return QnAidx;
	}

	public void setQnAidx(int qnAidx) {
		QnAidx = qnAidx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	
	
	
}
