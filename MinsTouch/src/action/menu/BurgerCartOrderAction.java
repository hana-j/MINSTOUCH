package action.menu;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.menu.BurgerCartOrderService;
import svc.user.UserLoginService;
import svc.user.gradeService;
import vo.ActionForward;
import vo.Burger;
import vo.Cart;
import vo.Order;
import vo.UserBean;

public class BurgerCartOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String u_id=null;
		HttpSession session=request.getSession();
		ArrayList<Cart> cartList=(ArrayList<Cart>)session.getAttribute("cartList");
		session.removeAttribute("latestOrder");
		int totalMoney=Integer.parseInt(request.getParameter("totalMoney"));

		ActionForward forward=null;

		if(cartList==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('주문할 제품을 선택해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			BurgerCartOrderService burgerCartOrderSvc=new BurgerCartOrderService();
			ArrayList<Burger> burgerList=new ArrayList<Burger>();
			
			for(int i=0; i<cartList.size(); i++) {
				Burger burger=new Burger(
						cartList.get(i).getM_id(),
						cartList.get(i).getCategory(),
						cartList.get(i).getName(),
						cartList.get(i).getPrice(),
						cartList.get(i).getQty()
						);
				burgerList.add(i, burger);
			}
			
			u_id=(String)session.getAttribute("u_id");
			
			if(u_id==null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 해주세요.')");
				out.println("location.href='userLogin.usr'");
				out.println("</script>");
			}else {
				String u_grade=(String)session.getAttribute("u_grade");
				gradeService gradeSvc=new gradeService();
				double saleRate=gradeSvc.getSaleRate(u_grade);
				//System.out.println("saleRate : " + saleRate);
				int saleTotalMoney=(int)(totalMoney * (1.0-saleRate));
				//System.out.println("saleTotalMoney : " + saleTotalMoney);
				boolean isOrderSuccess=burgerCartOrderSvc.orderBurger(u_id,burgerList,saleTotalMoney);
				
				if(isOrderSuccess) {
					session.setAttribute("burgerList",burgerList);
					session.setAttribute("totalMoney", totalMoney);
					session.setAttribute("saleTotalMoney", saleTotalMoney);
					session.removeAttribute("cartList");
					
					
					Order latestOrder=burgerCartOrderSvc.customerOrder(u_id);
					session.setAttribute("latestOrder", latestOrder);
					forward=new ActionForward("successOrder.jsp",true);
				}else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('주문실패')");
					out.println("history.back()");
					out.println("</script>");
				}
			}
		}
		
		
		return forward;
	}

}
