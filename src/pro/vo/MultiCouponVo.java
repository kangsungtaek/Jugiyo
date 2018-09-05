package pro.vo;

import java.util.List;

public class MultiCouponVo {
	
	String id; //objectId
	String userId;
	List<CouponVo> coupons;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public List<CouponVo> getCoupons() {
		return coupons;
	}
	public void setCoupons(List<CouponVo> coupons) {
		this.coupons = coupons;
	}
	
	@Override
	public String toString() {
		return "MultiCouponVo [id=" + id + ", userId=" + userId + ", coupons=" + coupons + "]";
	}

}
