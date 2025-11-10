package kr.co.tindog.member;

import org.springframework.web.multipart.MultipartFile;

public class DogDTO {

	
	private int dogno;    
	private int dogorder;
	private String email;
	private String dname;
	private String sex;  
	private int dogcd;    
	private int age;   
	private String neutral;
	private String size;       
	private MultipartFile mainphotofile; 
	private int weight;    
	private String dog_detail;
	private String gamereg;
	private String purpose;
	private String mainphoto;
	private String pic1;
	private String pic2;
	private String pic3;
	private String dbti;
	
	
	
	
	
	
	
	
	
	
	public String getDbti() {
		return dbti;
	}
	public void setDbti(String dbti) {
		this.dbti = dbti;
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	public int getDogno() {
		return dogno;
	}
	public void setDogno(int dogno) {
		this.dogno = dogno;
	}
	public int getDogorder() {
		return dogorder;
	}
	public void setDogorder(int dogorder) {
		this.dogorder = dogorder;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getDogcd() {
		return dogcd;
	}
	public void setDogcd(int dogcd) {
		this.dogcd = dogcd;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getNeutral() {
		return neutral;
	}
	public void setNeutral(String neutral) {
		this.neutral = neutral;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public MultipartFile getMainphotofile() {
		return mainphotofile;
	}
	public void setMainphotofile(MultipartFile mainphotofile) {
		this.mainphotofile = mainphotofile;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	public String getDog_detail() {
		return dog_detail;
	}
	public void setDog_detail(String dog_detail) {
		this.dog_detail = dog_detail;
	}
	public String getGamereg() {
		return gamereg;
	}
	public void setGamereg(String gamereg) {
		this.gamereg = gamereg;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getMainphoto() {
		return mainphoto;
	}
	public void setMainphoto(String mainphoto) {
		this.mainphoto = mainphoto;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "DogDTO [dogno=" + dogno + ", dogorder=" + dogorder + ", email=" + email + ", dname=" + dname + ", sex="
				+ sex + ", dogcd=" + dogcd + ", age=" + age + ", neutral=" + neutral + ", size=" + size
				+ ", mainphotofile=" + mainphotofile + ", weight=" + weight + ", dog_detail=" + dog_detail
				+ ", gamereg=" + gamereg + ", purpose=" + purpose + ", mainphoto=" + mainphoto + ", pic1=" + pic1
				+ ", pic2=" + pic2 + ", pic3=" + pic3 + ", dbti=" + dbti + "]";
	}
	
	

	
}
