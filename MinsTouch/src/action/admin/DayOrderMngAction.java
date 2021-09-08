package action.admin;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.admin.DayOrderListService;

import vo.ActionForward;
import vo.Order;

public class DayOrderMngAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		Date today = new Date();
		SimpleDateFormat trans = new SimpleDateFormat("yyyy-MM-dd");
		String s_date = trans.format(today);
		
		ArrayList<Order> dayOrderList = null;
		
		
		String admin_grade = null;
		admin_grade=(String)session.getAttribute("admin_grade");
		
		if(admin_grade==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자로 로그인 해주세요');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			DayOrderListService dayOrderSvc = new DayOrderListService();
			dayOrderList = dayOrderSvc.getOrderList(s_date);
			
			request.setAttribute("dayOrderList", dayOrderList);
			session.setMaxInactiveInterval(60*720);
			request.setAttribute("showadmin", "/admin/dayOrderList.jsp");
			forward = new ActionForward("adminMain.jsp", false);
		}
		return forward;
	}

}
