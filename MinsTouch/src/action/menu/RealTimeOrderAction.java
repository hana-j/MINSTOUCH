package action.menu;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.menu.BurgerCartOrderService;
import vo.ActionForward;
import vo.Order;

public class RealTimeOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		HttpSession session=request.getSession();
		session.removeAttribute("latestOrder");
		String u_id=(String)session.getAttribute("u_id");
		
		if(u_id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 해주세요.')");
			out.println("location.href='userLogin.usr'");
			out.println("</script>");
		}else {
			BurgerCartOrderService burgerCartOrderSvc=new BurgerCartOrderService();
			Order latestOrder=burgerCartOrderSvc.customerOrder(u_id);
			session.setAttribute("latestOrder", latestOrder);
			forward=new ActionForward("successOrder.jsp",true);
		}
		
		return forward;
	}

}
