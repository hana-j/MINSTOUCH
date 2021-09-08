package action.admin;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.SHA256;
import action.Action;
import svc.admin.AdminJoinService;
import vo.ActionForward;
import vo.Address;
import vo.UserBean;

public class AdminJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		UserBean admin = new UserBean();
		Address addr = new Address();
		boolean joinResult = false;
		
		String password = request.getParameter("u_password");
		String hash_password = SHA256.endcodSha256(password);
		
		Date nowdate = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String u_date=transFormat.format(nowdate);
		
		admin.setU_grade(request.getParameter("u_grade"));
		admin.setU_id(request.getParameter("u_id"));
		admin.setU_password(hash_password);
		admin.setU_name(request.getParameter("u_name"));
		admin.setU_call(request.getParameter("u_call"));
		admin.setU_email(request.getParameter("u_email"));
		admin.setU_date(u_date);
		
		addr.setZip(Integer.parseInt(request.getParameter("zip")));
		addr.setAddress1(request.getParameter("address1"));
		addr.setAddress2(request.getParameter("address2"));
		
		
		AdminJoinService adminJoinSvc = new AdminJoinService();
		joinResult = adminJoinSvc.join(admin, addr);
		
		if(joinResult) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자등록 실패');");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./adminLogin.adm");
		}
		return forward;
	}

}
