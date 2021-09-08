package action.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerCartAddService;
import vo.ActionForward;
import vo.Burger;

public class BurgerCartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		Burger cartBurger=null;
		
		BurgerCartAddService burgerCartAddSvc=new BurgerCartAddService();
		String id=request.getParameter("id");
//		String setup=request.getParameter("setup");
//		cartBurger=burgerCartAddSvc.getCartBurger(name,setup);
		cartBurger=burgerCartAddSvc.getCartBurger(id);
		burgerCartAddSvc.addCart(request,cartBurger);
		
//		request.setAttribute("showcart", "/burgerCartList.kiosk");
//		forward=new ActionForward("template.jsp",false);
		
		
		forward=new ActionForward("burgerCartList.kiosk",true);
		return forward;
	}

}
