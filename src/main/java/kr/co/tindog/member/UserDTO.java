package kr.co.tindog.member;

import org.springframework.web.multipart.MultipartFile;

public class UserDTO {
	
	
	private String email;
	private String name;
	private String nickname;
	private String password;
	private String birth;	
	private String sex; 		
	private String phone;
	private String post; 
	private String addr; 
	private String detailaddr;		
	private String signdate;		
	private String memgrade;
	private String userphoto;
	private Object id;
	private int gumqty;	
	
	
	public int getGumqty() {
		return gumqty;
	}
	public void setGumqty(int gumqty) {
		this.gumqty = gumqty;
	}
	public Object getId() {
		return id;
	}
	public void setId(Object id) {
		this.id = id;
	}
	public String getUserphoto() {
		return userphoto;
	}
	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}
	public MultipartFile getUserphotofile() {
		return userphotofile;
	}
	public void setUserphotofile(MultipartFile userphotofile) {
		this.userphotofile = userphotofile;
	}

	private MultipartFile userphotofile; 
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailaddr() {
		return detailaddr;
	}
	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	public String getMemgrade() {
		return memgrade;
	}
	public void setMemgrade(String memgrade) {
		this.memgrade = memgrade;
	}
	@Override
	public String toString() {
		return "UserDTO [email=" + email + ", name=" + name + ", nickname=" + nickname + ", password=" + password
				+ ", birth=" + birth + ", sex=" + sex + ", phone=" + phone + ", post=" + post + ", addr=" + addr
				+ ", detailaddr=" + detailaddr + ", signdate=" + signdate + ", memgrade=" + memgrade + ", userphoto="
				+ userphoto + ", userphotofile=" + userphotofile + "]";
	}
	
	
	
	
}
