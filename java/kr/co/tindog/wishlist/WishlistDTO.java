package kr.co.tindog.wishlist;

public class WishlistDTO {
	private String wishlist_no;
	private String email;
	private int uproduct_no;
	private String wishdate;
	
	
	public String getWishlist_no() {
		return wishlist_no;
	}
	public void setWishlist_no(String wishlist_no) {
		this.wishlist_no = wishlist_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUproduct_no() {
		return uproduct_no;
	}
	public void setUproduct_no(int uproduct_no) {
		this.uproduct_no = uproduct_no;
	}
	public String getWishdate() {
		return wishdate;
	}
	public void setWishdate(String wishdate) {
		this.wishdate = wishdate;
	}
	@Override
	public String toString() {
		return "WishlistDTO [wishlist_no=" + wishlist_no + ", email=" + email + ", uproduct_no=" + uproduct_no
				+ ", wishdate=" + wishdate + "]";
	}
	
	
	

}
