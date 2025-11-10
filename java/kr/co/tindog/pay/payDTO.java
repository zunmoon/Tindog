package kr.co.tindog.pay;





public class  payDTO{
	
	private String orderno;
    private String email;
    private int gumqty;
    private String price;
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGumqty() {
		return gumqty;
	}
	public void setGumqty(int gumqty) {
		this.gumqty = gumqty;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "PayDTO [orderno=" + orderno + ", email=" + email + ", gumqty=" + gumqty + ", price=" + price + "]";
	}
        
    
    
   
}