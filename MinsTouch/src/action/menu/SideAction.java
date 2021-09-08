package action.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.SideListService;
import vo.ActionForward;
import vo.Burger;

public class SideAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Burger> sideList=null;
		
		SideListService sideListSvc=new SideListService();
		sideList=sideListSvc.getSideList();
		request.setAttribute("burgerList", sideList);
		request.setAttribute("showmenu", "/user/burgerList.jsp");
		forward=new ActionForward("template.jsp",false);
		
		return forward;
	}

}
