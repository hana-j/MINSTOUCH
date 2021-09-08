package action.user;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.user.UserLoginService;
import svc.user.gradeService;
import vo.ActionForward;
import vo.UserBean;


public class UserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		UserBean user = null;
		
		String c_id = request.getParameter("u_id");
		String c_password = request.getParameter("u_password");
		String remember = request.getParameter("remember");
		boolean loginResult=false;
		
		UserLoginService userLoginSvc = new UserLoginService();
		loginResult = userLoginSvc.login(c_id, c_password);
		
		if(loginResult==false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 일치하지 않습니다.');");
			out.println("location.href='./userLogin.usr';");
			out.println("</script>");
		}else {
//			user=new UserBean();
			user = userLoginSvc.getOrder(c_id);
			if(user==null) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('존재하지 않는 계정입니다.');");
				out.println("location.href='./userLogin.usr';");
				out.println("</script>");
			}else {
				Cookie cookie = new Cookie("u_id",c_id);
				if(remember !=null) {
					response.addCookie(cookie);
				}else {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				user=gradeService.updateGrade(user);
				session.setAttribute("u_id", c_id);
				session.setAttribute("u_password", c_password);
				session.setAttribute("u_grade", user.getU_grade());
				session.setAttribute("u_name", user.getU_name());
				forward = new ActionForward("userMain.jsp",true);
			}
		}
		
		return forward;
	}

}
