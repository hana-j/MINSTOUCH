package vo;

import java.net.URLEncoder;
import java.util.Date;

public class Cart {
	private String name;
	private int qty;
	private String image;
	private int price;
	
	private String m_id;
	private String category;
	private Date m_date;
	
	
	
	
	
	
	private String encodingKind;	//뭐지?
	
	public String getEncodingKind() {
		try {
			encodingKind=URLEncoder.encode(name,"UTF-8");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return encodingKind;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	
	
	
}
