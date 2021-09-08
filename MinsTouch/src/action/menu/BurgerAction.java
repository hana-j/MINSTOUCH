package action.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerListService;
import vo.ActionForward;
import vo.Burger;

public class BurgerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Burger> burgerList=null;
		
		BurgerListService burgerListSvc=new BurgerListService();
		burgerList=burgerListSvc.getBurgerList();
		request.setAttribute("burgerList", burgerList);
		request.setAttribute("showmenu", "/user/burgerList.jsp");
		forward=new ActionForward("template.jsp",false);
		
		return forward;
	}

}
