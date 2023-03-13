package manager;

import java.sql.Date;

//MGID       NOT NULL VARCHAR2(255)  
//MGIDX               NUMBER         
//MGPW       NOT NULL VARCHAR2(255)  
//MGNAME     NOT NULL VARCHAR2(255)  
//MGPHONE    NOT NULL VARCHAR2(100)  
//MGJOINDATE          DATE           
//MGEMAIL    NOT NULL VARCHAR2(1000) 
//MGADDRESS  NOT NULL VARCHAR2(1000) 

public class ManagerDTO {
	
	private int mgidx;
	private String mgid;
	private String mgpw;
	private String maname;
	private String mgphone;
	private Date   mgjoindate;
	private String mgEmail;
	private String mgaddress;
	
	
	public ManagerDTO() {
	
	}


	public int getMgidx() {
		return mgidx;
	}


	public void setMgidx(int mgidx) {
		this.mgidx = mgidx;
	}


	public String getMgid() {
		return mgid;
	}


	public void setMgid(String mgid) {
		this.mgid = mgid;
	}


	public String getMgpw() {
		return mgpw;
	}


	public void setMgpw(String mgpw) {
		this.mgpw = mgpw;
	}


	public String getManame() {
		return maname;
	}


	public void setManame(String maname) {
		this.maname = maname;
	}


	public String getMgphone() {
		return mgphone;
	}


	public void setMgphone(String mgphone) {
		this.mgphone = mgphone;
	}


	public Date getMgjoindate() {
		return mgjoindate;
	}


	public void setMgjoindate(Date mgjoindate) {
		this.mgjoindate = mgjoindate;
	}


	public String getMgEmail() {
		return mgEmail;
	}


	public void setMgEmail(String mgEmail) {
		this.mgEmail = mgEmail;
	}


	public String getMgaddress() {
		return mgaddress;
	}


	public void setMgaddress(String mgaddress) {
		this.mgaddress = mgaddress;
	}


	
}
