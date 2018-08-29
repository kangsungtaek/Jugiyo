package pro.vo;

import java.util.Arrays;
import java.util.Date;

public class LogVo {	
	String userId;
	String storeNo; //음식점 no
	String storeName;
	int storeType; //음식점의 타입
	String[] orderList;
	Date orderdate;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(String storeNo) {
		this.storeNo = storeNo;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getStoreType() {
		return storeType;
	}
	public void setStoreType(int storeType) {
		this.storeType = storeType;
	}
	public String[] getOrderList() {
		return orderList;
	}
	public void setOrderList(String[] orderList) {
		this.orderList = orderList;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	
	@Override
	public String toString() {
		return "LogVo [userId=" + userId + ", storeNo=" + storeNo + ", storeName=" + storeName + ", storeType="
				+ storeType + ", orderList=" + Arrays.toString(orderList) + ", orderdate=" + orderdate + "]";
	}

}
