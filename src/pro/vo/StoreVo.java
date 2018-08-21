package pro.vo;

//store table
public class StoreVo {
	int no;
	String id;
	String password;
	String name;
	String addr;
	int type;
	String typeName; //type table과 join해서 사용할 것
	int xcor; //x좌표
	int ycor; //y좌표
	String img;
	String contact;
	int star;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
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
	
	@Override
	public String toString() {
		return "StoreVo [no=" + no + ", id=" + id + ", password=" + password + ", name=" + name + ", addr=" + addr
				+ ", type=" + type + ", typeName=" + typeName + ", xcor=" + xcor + ", ycor=" + ycor + ", img=" + img
				+ ", contact=" + contact + ", star=" + star + "]";
	}
	
}
