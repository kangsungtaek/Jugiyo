package pro.vo;

import java.util.Arrays;
import java.util.Date;

public class LogVo {	
	String id;
	String store; //음식점 no
	int type; //음식점의 타입
	String[] menu;
	Date date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String[] getMenu() {
		return menu;
	}
	public void setMenu(String[] menu) {
		this.menu = menu;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "LogVo [id=" + id + ", store=" + store + ", type=" + type + ", menu=" + Arrays.toString(menu) + ", date=" + date + "]";
	}
	
}
