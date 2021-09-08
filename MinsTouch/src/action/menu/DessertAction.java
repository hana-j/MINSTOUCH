package action.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.DessertListService;
import vo.ActionForward;
import vo.Burger;

public class DessertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Burger> dessertList=null;
		
		DessertListService dessertListSvc=new DessertListService();
		dessertList=dessertListSvc.getDessertList();
		request.setAttribute("burgerList", dessertList);
		request.setAttribute("showmenu", "/user/burgerList.jsp");
		forward=new ActionForward("template.jsp",false);
		
		return forward;
	}

}
