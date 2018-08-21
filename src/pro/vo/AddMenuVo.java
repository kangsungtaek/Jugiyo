package pro.vo;

public class AddMenuVo {
	int no;
	String name;
	int price;
	String store;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	@Override
	public String toString() {
		return "OwnerMenuVo [no=" + no + ", name=" + name + ", price=" + price + ", store=" + store + "]";
	}
}
