package pro.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class LogVo {	
	String id;
	int storeNo;
	String storeName; //음식점 no
	int storetype; //음식점의 타입
	List<MenuVo> orderList;
	Date orderDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getStoretype() {
		return storetype;
	}
	public void setStoretype(int storetype) {
		this.storetype = storetype;
	}
	public List<MenuVo> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<MenuVo> orderList) {
		this.orderList = orderList;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "LogVo [id=" + id + ", storeNo=" + storeNo + ", storeName=" + storeName + ", storetype=" + storetype
				+ ", orderList=" + orderList + ", orderDate=" + orderDate + "]";
	}
	
}
