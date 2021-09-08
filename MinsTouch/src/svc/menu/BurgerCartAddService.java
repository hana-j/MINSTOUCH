package svc.menu;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.BurgerDAO;
import vo.Burger;
import vo.Cart;

public class BurgerCartAddService {

	public Burger getCartBurger(String id) {	//세트업을 어떻게 적용할 지
		Connection con=null;
		BurgerDAO burgerDAO=BurgerDAO.getInstance();
		Burger burger=null;
		
		try {
			con=getConnection();
			burgerDAO.setConnection(con);
			burger=burgerDAO.selectBurger(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return burger;
	}

	public void addCart(HttpServletRequest request, Burger cartBurger) {
		HttpSession session=request.getSession();
		ArrayList<Cart> cartList=(ArrayList<Cart>)session.getAttribute("cartList");
		
		if(cartList==null) {
			cartList=new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);
		}
		
		boolean isNewCart=true;
		for(int i=0; i<cartList.size(); i++) {
			if(cartBurger.getM_id().equals(cartList.get(i).getM_id())) {
				isNewCart=false;
				cartList.get(i).setQty(cartList.get(i).getQty()+1);
				break;
			}
		}
		
		if(isNewCart) {
			Cart cart=new Cart();
			cart.setM_id(cartBurger.getM_id());
			cart.setCategory(cartBurger.getCategory());
			
			cart.setImage(cartBurger.getImage());
			cart.setName(cartBurger.getM_name());
			cart.setPrice(cartBurger.getM_price());
			cart.setQty(1);
			
			cartList.add(cart);
		}
	}

}
