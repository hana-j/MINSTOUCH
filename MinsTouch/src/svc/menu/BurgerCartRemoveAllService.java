package svc.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.Cart;

public class BurgerCartRemoveAllService {

	public void cartRemoveAll(HttpServletRequest request) {
		HttpSession session=request.getSession();
		ArrayList<Cart> cartList=(ArrayList<Cart>)session.getAttribute("cartList");
		
//		for(int i=0; i<cartList.size(); i++) {
//			cartList.remove(cartList.get(i));
//		}
		session.removeAttribute("cartList");
	}

}
