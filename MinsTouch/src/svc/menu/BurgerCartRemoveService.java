package svc.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.Cart;

public class BurgerCartRemoveService {

	public void cartRemove(HttpServletRequest request, String m_id) {
		HttpSession session=request.getSession();
		ArrayList<Cart> cartList=(ArrayList<Cart>)session.getAttribute("cartList");
		
		for(int j=0; j<cartList.size(); j++) {
			if(cartList.get(j).getM_id().equals(m_id)) {
				cartList.remove(cartList.get(j));
			}
		}
		
		
		
		
		
		
	}

}
