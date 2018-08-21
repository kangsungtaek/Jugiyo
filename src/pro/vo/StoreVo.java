package pro.vo;

public class StoreVo {
	int no;
	String name;
	String addr;
	int type;
	int xcor;
	int ycor;
	String img;
	String contact;
	int star;
	String id;
	String password;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getXcor() {
		return xcor;
	}
	public void setXcor(int xcor) {
		this.xcor = xcor;
	}
	public int getYcor() {
		return ycor;
	}
	public void setYcor(int ycor) {
		this.ycor = ycor;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
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
	@Override
	public String toString() {
		return "StoreVo [no=" + no + ", name=" + name + ", addr=" + addr + ", type=" + type + ", xcor=" + xcor
				+ ", ycor=" + ycor + ", img=" + img + ", contact=" + contact + ", star=" + star + ", id=" + id
				+ ", password=" + password + "]";
	}
	
}
