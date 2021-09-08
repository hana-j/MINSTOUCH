package action.menu;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;


public class MenuAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String u_id=null;
		
		HttpSession session = request.getSession();
		u_id=(String)session.getAttribute("u_id");
		session.removeAttribute("cartList");
		
		if(u_id==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요.');");
			out.println("location.href='./userLogin.usr';");
			out.println("</script>");
		}else {
			forward=new ActionForward();
			forward.setPath("template.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
