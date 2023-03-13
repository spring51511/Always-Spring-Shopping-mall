package cart;

public class Cart {
	private int pidx;
	private String name;
	private int price;
	private int count;
	private int total;

	public Cart() {

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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotal() {
		total = count * price;
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	


}
