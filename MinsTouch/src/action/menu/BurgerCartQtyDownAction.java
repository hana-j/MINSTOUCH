package action.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerCartQtyDownService;
import vo.ActionForward;

public class BurgerCartQtyDownAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String m_id=request.getParameter("m_id");
		BurgerCartQtyDownService burgerCartQtyDownSvc=new BurgerCartQtyDownService();
		burgerCartQtyDownSvc.downCartQty(m_id,request);
		ActionForward forward=new ActionForward("burgerCartList.kiosk",false);
		return forward;
	}

}
