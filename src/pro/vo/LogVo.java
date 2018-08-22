package pro.vo;

import java.util.Arrays;
import java.util.Date;

public class LogVo {	
	String id;
	String store; //음식점 no
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
		return "LogVo [id=" + id + ", store=" + store + ", menu=" + Arrays.toString(menu) + ", date=" + date + "]";
	}
	
}
