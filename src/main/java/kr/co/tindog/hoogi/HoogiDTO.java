package kr.co.tindog.hoogi;

public class HoogiDTO {

	private int review_no; 
	private int uproduct_no;   
	private String seller; 
	private String consumer;  
	private String context;  
	
	private String subject;
	private int price;
	private String nickname;
	private String uproduct_cd;
	private String info;
	private String status;
	private String regdate;
	private String area;
	private String location;
	private String mainphoto;
	private String photo;
	
	public HoogiDTO() {}
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getUproduct_no() {
		return uproduct_no;
	}
	public void setUproduct_no(int uproduct_no) {
		this.uproduct_no = uproduct_no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getConsumer() {
		return consumer;
	}
	public void setConsumer(String consumer) {
		this.consumer = consumer;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUproduct_cd() {
		return uproduct_cd;
	}
	public void setUproduct_cd(String uproduct_cd) {
		this.uproduct_cd = uproduct_cd;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMainphoto() {
		return mainphoto;
	}
	public void setMainphoto(String mainphoto) {
		this.mainphoto = mainphoto;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "HoogiDTO [review_no=" + review_no + ", uproduct_no=" + uproduct_no + ", price=" + price + ", seller="
				+ seller + ", consumer=" + consumer + ", context=" + context + ", subject=" + subject + ", nickname="
				+ nickname + ", uproduct_cd=" + uproduct_cd + ", info=" + info + ", status=" + status + ", regdate="
				+ regdate + ", area=" + area + ", location=" + location + ", mainphoto=" + mainphoto + ", photo="
				+ photo + "]";
	}
	
	
	
}
