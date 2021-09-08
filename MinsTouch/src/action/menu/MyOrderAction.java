package action.menu;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.menu.MyOrderService;
import vo.ActionForward;
import vo.Order;

public class MyOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Order> myOrderList=null;
		String u_id=null;
		HttpSession session=request.getSession();
		u_id=(String)session.getAttribute("u_id");
		
		System.out.println("u_id : " + u_id);
		if(u_id==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용가능한 서비스입니다.');");
			out.println("location.href='userMain.jsp'");
			out.println("</script>");
		}else {
			MyOrderService myOrderSvc=new MyOrderService();
			myOrderList=myOrderSvc.getMyOrder(u_id);
			request.setAttribute("myOrderList", myOrderList);
			request.setAttribute("showpage", "/user/myOrderView.jsp");
			forward=new ActionForward("user.jsp",false);
		}
			
		return forward;
	}

}
