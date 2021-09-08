package svc.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.Cart;

public class BurgerCartQtyDownService {

	public void downCartQty(String m_id, HttpServletRequest request) {
		HttpSession session=request.getSession();
		ArrayList<Cart> cartList=(ArrayList<Cart>)session.getAttribute("cartList");
		
		for(int i=0; i<cartList.size(); i++) {
			if(cartList.get(i).getM_id().equals(m_id) && cartList.get(i).getQty()>0) {
				cartList.get(i).setQty(cartList.get(i).getQty() - 1);
			}
		}
	}

}
