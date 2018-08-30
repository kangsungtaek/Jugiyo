package pro.vo;

import java.util.Date;
import java.util.List;

public class LogVo {
	String id; //objectId
	String userId;
	String storeNo; // 음식점 no
	String storeName;
	int storeType; // 음식점의 타입
	List<MenuVo> orderList;
	Date orderdate;
	String delivery;
	String requested;
	String reviewd;
	
	ReviewVo review;
	int totalPrice;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

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

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public List<MenuVo> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<MenuVo> orderList) {
		this.orderList = orderList;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getRequested() {
		return requested;
	}

	public void setRequested(String requested) {
		this.requested = requested;
	}

	public String getReviewd() {
		return reviewd;
	}

	public void setReviewd(String reviewd) {
		this.reviewd = reviewd;
	}
	
	public ReviewVo getReview() {
		return review;
	}

	public void setReview(ReviewVo review) {
		this.review = review;
	}

	@Override
	public String toString() {
		return "LogVo [id=" + id + ", userId=" + userId + ", storeNo=" + storeNo + ", storeName=" + storeName
				+ ", storeType=" + storeType + ", orderList=" + orderList + ", orderdate=" + orderdate + ", delivery="
				+ delivery + ", requested=" + requested + ", reviewd=" + reviewd + ", review=" + review
				+ ", totalPrice=" + totalPrice + "]";
	}

}