package action.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.SHA256;
import action.Action;
import svc.user.ChangePwService;
import vo.ActionForward;
import vo.UserBean;

public class ChangePwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		boolean changeok = false;
		
		String id=request.getParameter("u_id");
		String pass=request.getParameter("u_password");
		String hash_pass = SHA256.endcodSha256(pass);
		UserBean user = new UserBean();
		user.setU_id(id);
		user.setU_password(hash_pass);
		
		ChangePwService changePwSvc = new ChangePwService();
		changeok = changePwSvc.chPw(user);
		
		if(changeok == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요';");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("userMain.jsp");
			forward.setRedirect(true);
		}
		return forward;
	}

}
