package action.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.user.UserFindService;
import vo.ActionForward;
import vo.UserBean;

public class UserFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		UserBean user= new UserBean();
		String email = request.getParameter("u_email");
	
		UserFindService  userFindService = new UserFindService();
		user=userFindService.findId(email);
		
		
		if(user==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('존재하지 않는 계정입니다.');");
			out.println("history.back()");
			out.println("</script>");	
		}else if(email.equals(user.getU_email())) {
			String u_id = user.getU_id();
			request.setAttribute("pre_id", u_id);
			request.setAttribute("showpage", "user/findComplete.jsp");
			forward = new ActionForward("user.jsp",false);
		}
		return forward;
	}

}
