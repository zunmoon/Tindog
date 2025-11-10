package kr.co.tindog.worldcup;

public class DogDTO {

	private String email;
	private int age;
	private int purpose;
	private int size;
	private String sex;
	private String neutral;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getPurpose() {
		return purpose;
	}
	public void setPurpose(int purpose) {
		this.purpose = purpose;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNeutral() {
		return neutral;
	}
	public void setNeutral(String neutral) {
		this.neutral = neutral;
	}
	
	@Override
	public String toString() {
		return "DogDTO [email=" + email + ", age=" + age + ", purpose=" + purpose + ", size=" + size + ", sex=" + sex
				+ ", neutral=" + neutral + "]";
	}
	
}
