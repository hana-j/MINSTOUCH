package action.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.menu.BurgerCartRemoveAllService;
import vo.ActionForward;

public class BurgerCartRemoveAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		BurgerCartRemoveAllService burgerCartRemoveAllSvc=new BurgerCartRemoveAllService();
		burgerCartRemoveAllSvc.cartRemoveAll(request);
		
//		HttpSession session =request.getSession();
//		session.setAttribute("totalMoney", 0);
//		session.setAttribute("showcart", "/user/burgerCartList.jsp");
//		forward=new ActionForward("user/template.jsp",false);
		
		forward=new ActionForward("set.kiosk",false);
		return forward;
		
	
	}

}
