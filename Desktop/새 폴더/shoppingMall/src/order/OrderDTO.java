package order;

import java.sql.Date;

//		ORIDX     NOT NULL NUMBER        
//		USERID             VARCHAR2(255) 
//		ORDERDATE          DATE          
//		PIDX               NUMBER 


public class OrderDTO {
	private int oridx;
	private String userid;
	private Date orderDate;
	private int pidx;
	
	private String productName;
	private String userName;
	private String address;
	private String phone;
	private int count;
	private int price;
	private int total;
	
	public OrderDTO() {
		
	}

	public int getOridx() {
		return oridx;
	}

	public void setOridx(int oridx) {
		this.oridx = oridx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getPidx() {
		return pidx;
	}

	public void setPidx(int pidx) {
		this.pidx = pidx;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
	
}
