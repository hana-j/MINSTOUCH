package action.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.SetListService;
import vo.ActionForward;
import vo.Burger;

public class SetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Burger> setList=null;
		
		SetListService setListSvc=new SetListService();
		setList=setListSvc.getSetList();
		request.setAttribute("burgerList", setList);
		request.setAttribute("showmenu", "/user/burgerList.jsp");
		forward=new ActionForward("template.jsp",false);
		
		return forward;
	}

}
