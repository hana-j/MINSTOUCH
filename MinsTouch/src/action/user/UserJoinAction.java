package action.user;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.SHA256;
import action.Action;
import svc.user.UserJoinService;
import vo.ActionForward;
import vo.Address;
import vo.UserBean;

public class UserJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		UserBean user = new UserBean();
		Address addr = new Address();
		boolean joinResult = false;
		
		String password = request.getParameter("u_password");
		String hash_password = SHA256.endcodSha256(password);
		
		Date nowdate = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String u_date=transFormat.format(nowdate);
		
		user.setU_grade(request.getParameter("u_grade"));
		user.setU_id(request.getParameter("u_id"));
		user.setU_password(hash_password);
		user.setU_name(request.getParameter("u_name"));
		user.setU_call(request.getParameter("u_call"));
		user.setU_email(request.getParameter("u_email"));
		user.setU_date(u_date);
		
		addr.setZip(Integer.parseInt(request.getParameter("zip")));
		addr.setAddress1(request.getParameter("address1"));
		addr.setAddress2(request.getParameter("address2"));
		
		
		UserJoinService userJoinService = new UserJoinService();
		joinResult = userJoinService.join(user, addr);
		
		if(joinResult==false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입실패');");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.usr");
		}
		return forward;
	}

}
