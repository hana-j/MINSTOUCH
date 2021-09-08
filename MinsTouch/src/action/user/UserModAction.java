package action.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.user.UserModService;
import vo.ActionForward;
import vo.Address;
import vo.UserBean;

public class UserModAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		boolean isModSuccess = false;
		String u_id= (String)session.getAttribute("u_id");
		//변경된 내용 빈객체에 저장 
		UserBean user = new UserBean();
		user.setU_id(u_id);
		user.setU_email(request.getParameter("u_email"));
		user.setU_call(request.getParameter("u_call"));
		Address addr = new Address();
		addr.setU_id(u_id);
		addr.setZip(Integer.parseInt(request.getParameter("zip")));
		addr.setAddress1(request.getParameter("address1"));
		addr.setAddress2(request.getParameter("address2"));
		
		//서비스 (db) 연결
		UserModService userModSvc = new UserModService();
		isModSuccess = userModSvc.modInfo(user, addr);
		
		if(isModSuccess == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정보수정에 실패했습니다. 다시시도해주세요');");
			out.println("history.back();");
			out.println("</script>");	
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("userView.usr?id="+u_id);
		}
		return forward;
	}

}
