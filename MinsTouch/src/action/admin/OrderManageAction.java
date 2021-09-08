package action.admin;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.admin.OrderListService;
import vo.ActionForward;
import vo.Order;

public class OrderManageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Order> orderList=null;
		String admin_grade=null;
		HttpSession session=request.getSession();
		admin_grade=(String)session.getAttribute("admin_grade");
		
		if(admin_grade==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자로 로그인 해주세요.');");
			out.println("history.back()");
			out.println("</script>");
		}else {
			OrderListService orderListSvc=new OrderListService();
			orderList=orderListSvc.getOrderList();
//			orderListSvc.customerOrder(request,orderList);
			request.setAttribute("orderList", orderList);
			request.setAttribute("showadmin", "/admin/orderList.jsp");
			forward=new ActionForward("adminMain.jsp",false);
		}
		
		
		return forward;
	}

}
