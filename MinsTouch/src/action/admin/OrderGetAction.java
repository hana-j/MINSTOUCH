package action.admin;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.admin.OrderGetService;

import vo.ActionForward;


public class OrderGetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		boolean getSuccess=false;
		int order_num=Integer.parseInt(request.getParameter("order_num"));
		
		OrderGetService orderGetSvc=new OrderGetService();
		getSuccess=orderGetSvc.getOrder(order_num);
		
		if(getSuccess) {
			forward=new ActionForward("dayOrderManage.adm",true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('주문승인실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
