package pro.vo;

public class CouponVo {

	double id;
	String name; //쿠폰명
	int sale; //할인정도
	String unit; //원인지 %인지
	
	public double getId() {
		return id;
	}

	public void setId(double id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public String toString() {
		return "CouponVo [id=" + id + ", name=" + name + ", sale=" + sale + ", unit=" + unit + "]";
	}
	
}
