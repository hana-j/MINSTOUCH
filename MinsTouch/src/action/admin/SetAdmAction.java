package action.admin;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.menu.SetListService;
import vo.ActionForward;
import vo.Burger;

public class SetAdmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Burger> setList=null;
		
		HttpSession session=request.getSession();
		String admin_grade=(String)session.getAttribute("admin_grade");
		if(admin_grade==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자로 로그인 해주세요.');");
			out.println("history.back()");
			out.println("</script>");
		}else {
			SetListService setListSvc=new SetListService();
			setList=setListSvc.getSetList();
			request.setAttribute("menuAdmList", setList);
			request.setAttribute("admin_showmenu", "/admin/menuAdmList.jsp");
			request.setAttribute("showadmin", "/admin/admin_template.jsp");
			forward=new ActionForward("adminMain.jsp",false);
		}
		
		return forward;
	}

}
