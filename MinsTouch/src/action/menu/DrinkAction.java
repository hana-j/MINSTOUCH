package action.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.DrinkListService;
import vo.ActionForward;
import vo.Burger;

public class DrinkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Burger> drinkList=null;
		
		DrinkListService drinkListSvc=new DrinkListService();
		drinkList=drinkListSvc.getDrinkList();
		request.setAttribute("burgerList", drinkList);
		request.setAttribute("showmenu", "/user/burgerList.jsp");
		forward=new ActionForward("template.jsp",false);
		
		return forward;
	}

}
