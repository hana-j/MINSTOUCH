package action.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.admin.SalesMngService;
import vo.ActionForward;

public class SalesMngAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int dayMoney=-1;
		HttpSession session = request.getSession();
		String yy = request.getParameter("y");
		String mm = request.getParameter("m");
		String dd = request.getParameter("i");
		String or_date = yy+"-0"+mm+"-"+dd;
		System.out.println(or_date);
		ActionForward forward = null;
		
		

		
		SalesMngService salesMngService = new SalesMngService();
		dayMoney= salesMngService.getDayInfo(or_date);
		
		if(dayMoney == -1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정보를 불러오는데 실패했습니다. 다시 시도해주세요.');");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			session.setAttribute("dayMoney", dayMoney);
			session.setAttribute("or_date", or_date);
			forward.setPath("admin/salesDetail.jsp");
		}
		return forward;
	}
}
