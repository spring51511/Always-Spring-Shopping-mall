package product;

import java.io.File;

//		PIDX            NOT NULL NUMBER         
//		NAME            NOT NULL VARCHAR2(255)  
//		KIND            NOT NULL VARCHAR2(50)   
//		PRICE           NOT NULL NUMBER         
//		IMGPATH         NOT NULL VARCHAR2(255)  
//		PRODUCT_CONTENT          VARCHAR2(4000) 


public class ProductDTO {
	private int pidx;
	private String name;
	private String kind;
	private int price;
	private String imgPath;
	private String product_content;
	private File uploadFile;
	
	public ProductDTO() {
		
	}

	public int getPidx() {
		return pidx;
	}

	public void setPidx(int pidx) {
		this.pidx = pidx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	
	
}
