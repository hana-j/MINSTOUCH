package action.admin;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.admin.AdminLoginService;
import svc.user.UserViewService;
import vo.ActionForward;
import vo.UserBean;

public class AdminLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String a_id=request.getParameter("u_id");
		String a_pass=request.getParameter("u_password");
		String remember = request.getParameter("remember");
		
		UserViewService userViewService = new UserViewService();
		UserBean admin= userViewService.getUser(a_id);
		
		if(admin==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('존재하지 않는 계정입니다.');");
			out.println("location.href='adminLogin.adm'");
			out.println("</script>");
		}else {
			if(admin.getU_grade().equals("Admin")) {
				boolean loginok = false;
				
				admin.setU_password(a_pass);
				
				AdminLoginService adminLoginSvc = new AdminLoginService();
				loginok= adminLoginSvc.login(admin);
//				UserLoginService userLoginSvc = new UserLoginService();
//				loginok = userLoginSvc.login(a_id, a_pass);
				
				if(loginok==false) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out= response.getWriter();
					out.println("<script>");
					out.println("alert('아이디 또는 패스워드가 일치하지 않습니다.');");
					out.println("location.href='adminLogin.adm'");
					out.println("</script>");
				}else {
					Cookie cookie = new Cookie("u_id",a_id);
					if(remember !=null) {
						response.addCookie(cookie);
					}else {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
					HttpSession session=request.getSession();
					session.setAttribute("admin_grade", admin.getU_grade());
					session.setAttribute("a_id", a_id);
					session.setAttribute("a_name", admin.getU_name());
					
					forward = new ActionForward();
					forward.setPath("dayOrderManage.adm");
					forward.setRedirect(true);
				}
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out= response.getWriter();
				out.println("<script>");
				out.println("alert('관리자 권한이 없습니다.');");
				out.println("location.href='adminLogin.adm'");
				out.println("</script>");
			}
		}
		
		
		
		
		
		return forward;
	}

}
