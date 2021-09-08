package vo;

import java.util.Date;

public class Order {
	private int order_num;
	private String u_id;
	private Date or_date;
	private String status;
	private int totalMoney;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int order_num, String u_id, Date or_date, String status, int totalMoney) {
		super();
		this.order_num = order_num;
		this.u_id = u_id;
		this.or_date = or_date;
		this.status = status;
		this.totalMoney = totalMoney;
	}

	
	
	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public Date getOr_date() {
		return or_date;
	}

	public void setOr_date(Date or_date) {
		this.or_date = or_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	

}
