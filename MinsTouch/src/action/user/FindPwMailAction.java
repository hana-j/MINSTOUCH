package action.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.user.FindPwMailService;
import vo.ActionForward;
import vo.UserBean;

public class FindPwMailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		String id= request.getParameter("u_id");
		String email=request.getParameter("u_email");
		//HttpSession session = null;
		
		UserBean user = new UserBean();
		user.setU_id(id);
		user.setU_email(email);
		
		FindPwMailService findPwMailSvc = new FindPwMailService();
		user= findPwMailSvc.psFind(id, email);
		
		if(user==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 이메일정보가 일치하지 않습니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else{
			request.setAttribute("showpage", "user/newPw.jsp");
			forward = new ActionForward("user.jsp",false);
			
		}
		return forward;
	}

}
