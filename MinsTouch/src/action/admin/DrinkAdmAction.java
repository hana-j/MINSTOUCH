package action.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.DrinkListService;
import vo.ActionForward;
import vo.Burger;

public class DrinkAdmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Burger> drinkList=null;
		DrinkListService drinkListSvc=new DrinkListService();
		drinkList=drinkListSvc.getDrinkList();
		request.setAttribute("menuAdmList", drinkList);
		request.setAttribute("admin_showmenu", "/admin/menuAdmList.jsp");
		request.setAttribute("showadmin", "/admin/admin_template.jsp");
		forward=new ActionForward("adminMain.jsp",false);
		
		return forward;
	}

}
