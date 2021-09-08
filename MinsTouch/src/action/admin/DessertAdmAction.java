package action.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.DessertListService;
import vo.ActionForward;
import vo.Burger;

public class DessertAdmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Burger> dessertList=null;
		DessertListService dessertListSvc=new DessertListService();
		dessertList=dessertListSvc.getDessertList();
		
		request.setAttribute("menuAdmList", dessertList);
		request.setAttribute("admin_showmenu", "/admin/menuAdmList.jsp");
		request.setAttribute("showadmin", "/admin/admin_template.jsp");
		forward=new ActionForward("adminMain.jsp",false);
		
		return forward;
	}

}
