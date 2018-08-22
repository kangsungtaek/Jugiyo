package pro.vo;

// member 테이블의 모든 항목을 다 쓰면됩니다.
// + setter, getter, toString 오버라이드해주세요.

public class MemberVo {
	String id;
	String password;
	String contact;
	String nickname;
	String addr;
	int point;
	String email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", password=" + password + ", contact=" + contact + ", nickname=" + nickname
				+ ", addr=" + addr + ", point=" + point + ", email=" + email + "]";
	}  

}
