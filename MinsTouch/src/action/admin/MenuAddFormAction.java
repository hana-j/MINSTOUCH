package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;

public class MenuAddFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		request.setAttribute("admin_showmenu", "/admin/menuAddForm.jsp");
		request.setAttribute("showadmin", "/admin/admin_template.jsp");
		forward=new ActionForward("adminMain.jsp",false);
		
		return forward;
	}

}
