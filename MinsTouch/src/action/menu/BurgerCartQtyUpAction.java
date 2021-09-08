package action.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerCartQtyUpService;
import vo.ActionForward;

public class BurgerCartQtyUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String m_id=request.getParameter("m_id");
		BurgerCartQtyUpService burgerCartQtyUpSvc=new BurgerCartQtyUpService();
		burgerCartQtyUpSvc.upCartQty(m_id,request);
		ActionForward forward=new ActionForward("burgerCartList.kiosk",false);
		
		return forward;
	}

}
