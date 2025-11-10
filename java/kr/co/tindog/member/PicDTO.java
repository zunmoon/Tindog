package kr.co.tindog.member;

import org.springframework.web.multipart.MultipartFile;

public class PicDTO {

	private String email;
	private String pic1;
	private String pic2;
	private String pic3;
	private MultipartFile pic1file;
	private MultipartFile pic2file;
	private MultipartFile pic3file;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public MultipartFile getPic1file() {
		return pic1file;
	}
	public void setPic1file(MultipartFile pic1file) {
		this.pic1file = pic1file;
	}
	public MultipartFile getPic2file() {
		return pic2file;
	}
	public void setPic2file(MultipartFile pic2file) {
		this.pic2file = pic2file;
	}
	public MultipartFile getPic3file() {
		return pic3file;
	}
	public void setPic3file(MultipartFile pic3file) {
		this.pic3file = pic3file;
	}
	
	@Override
	public String toString() {
		return "PicDTO [email=" + email + ", pic1=" + pic1 + ", pic2=" + pic2 + ", pic3=" + pic3 + ", pic1file="
				+ pic1file + ", pic2file=" + pic2file + ", pic3file=" + pic3file + "]";
	}

		
}
