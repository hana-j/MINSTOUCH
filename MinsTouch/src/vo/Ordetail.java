package vo;

public class Ordetail {
	private int detail_index;
	private String m_id;
	private int order_num;
	private int quantity;
	private String m_name;
	private int m_price;
	
	
	public Ordetail() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Ordetail(int detail_index, String m_id, int order_num, int quantity) {
		super();
		this.detail_index = detail_index;
		this.m_id = m_id;
		this.order_num = order_num;
		this.quantity = quantity;
	}

	


	public Ordetail(int detail_index, String m_id, int order_num, int quantity, String m_name, int m_price) {
		super();
		this.detail_index = detail_index;
		this.m_id = m_id;
		this.order_num = order_num;
		this.quantity = quantity;
		this.m_name = m_name;
		this.m_price = m_price;
	}



	public int getDetail_index() {
		return detail_index;
	}



	public void setDetail_index(int detail_index) {
		this.detail_index = detail_index;
	}



	public String getM_id() {
		return m_id;
	}



	public void setM_id(String m_id) {
		this.m_id = m_id;
	}



	public int getOrder_num() {
		return order_num;
	}



	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public String getM_name() {
		return m_name;
	}



	public void setM_name(String m_name) {
		this.m_name = m_name;
	}



	public int getM_price() {
		return m_price;
	}



	public void setM_price(int m_price) {
		this.m_price = m_price;
	}
	
	
	
}
