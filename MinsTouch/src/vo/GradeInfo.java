package vo;

public class GradeInfo {

	private String Family;
	private String Vip;
	private String Admin;
	
	public String getAdmin() {
		return Admin;
	}
	public void setAdmin(String admin) {
		Admin = admin;
	}
	public String getFamily() {
		return Family;
	}
	public void setFamily(String family) {
		Family = family;
	}
	public String getVip() {
		return Vip;
	}
	public void setVip(String vip) {
		Vip = vip;
	}
	
	public int saleRate(int total, String grade) {
		int money=0;
		if(grade.equals(Family)) {
			money=total*(int)0.95;
		}else if(grade.equals(Vip)) {
			money=total*(int)0.9;
		}else if(grade.equals(Admin)){
			money=total;
		}
		return money;
	}
	}
