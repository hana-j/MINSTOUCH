package action.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.admin.MonthSalesMngService;
import vo.ActionForward;

public class MonthSalesMngAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String yy = request.getParameter("y");
		String mm = request.getParameter("m");
		String month=yy+"-0"+mm;
		System.out.println(month);
		int monthMoney = -1;
		
		MonthSalesMngService monthSalesMngSvc = new MonthSalesMngService();
		monthMoney = monthSalesMngSvc.getMonthInfo(month);
		
		if(monthMoney == -1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정보를 불러오는데 실패했습니다. 다시 시도해주세요.');");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			session.setAttribute("monthMoney", monthMoney);
			session.setAttribute("month", month);
			forward.setPath("admin/monthSalesDetail.jsp");
		}
		return forward;
	}

}
