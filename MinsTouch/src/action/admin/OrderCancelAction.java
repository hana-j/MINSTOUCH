package action.admin;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.admin.OrderCancelService;
import svc.admin.OrderListService;
import vo.ActionForward;
import vo.Order;

public class OrderCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		boolean cancelSuccess=false;
		int order_num=Integer.parseInt(request.getParameter("order_num"));
		
		OrderCancelService orderCancelSvc=new OrderCancelService();
		cancelSuccess=orderCancelSvc.cancelOrder(order_num);
		
		if(cancelSuccess) {
			forward=new ActionForward("dayOrderManage.adm",true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('주문취소실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
