package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerViewService;
import vo.ActionForward;
import vo.Burger;

public class MenuModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		Burger mod_menu=null;
		String m_id=request.getParameter("m_id");
//		String category=request.getParameter("category");
		
		BurgerViewService burgerViewSvc=new BurgerViewService();
		mod_menu=burgerViewSvc.getBurgerView(m_id);
		
		request.setAttribute("mod_menu", mod_menu);
		request.setAttribute("admin_showmenu", "/admin/modMenuForm.jsp");
		request.setAttribute("showadmin", "/admin/admin_template.jsp");
		
		forward=new ActionForward("adminMain.jsp",false);
		return forward;
	}

}
