package action.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.user.UserViewService;
import vo.ActionForward;
import vo.Address;
import vo.UserBean;

public class UserViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String viewId=(String)session.getAttribute("u_id");
		
		
		if(viewId==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.');");
			out.println("location.href='./userLogin.usr';");
			out.println("</script>");
		}else {
			UserViewService userViewService = new UserViewService();
			UserBean user= userViewService.getUser(viewId);
			Address addr = userViewService.getAddress(viewId);
			request.setAttribute("user", user);
			request.setAttribute("addr", addr);
			request.setAttribute("showpage", "user/userInfo.jsp");
			forward = new ActionForward("user.jsp", false);
			
		}
		
		
		return forward;
	}

}
