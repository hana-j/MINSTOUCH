package action.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.user.UserDelService;
import vo.ActionForward;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String u_id =(String)session.getAttribute("u_id");
		//System.out.println(u_id);
		boolean delok = false;
		UserDelService userDelSvc = new UserDelService();
		delok=userDelSvc.delete(u_id);
		if(delok == true) {
			forward = new ActionForward();
			forward.setRedirect(true);
			session.invalidate();
			forward.setPath("./userMain.jsp");
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('탈퇴에 실패했습니다.');");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
