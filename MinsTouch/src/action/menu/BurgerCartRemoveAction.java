package action.menu;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerCartRemoveService;
import vo.ActionForward;

public class BurgerCartRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String m_id=request.getParameter("m_id");
		ActionForward forward=null;
		
		if(m_id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 제품을 선택해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			BurgerCartRemoveService burgerCartRemoveSvc=new BurgerCartRemoveService();
			burgerCartRemoveSvc.cartRemove(request,m_id);
			forward=new ActionForward("burgerCartList.kiosk",false);
		}
		
		return forward;
	}

}
