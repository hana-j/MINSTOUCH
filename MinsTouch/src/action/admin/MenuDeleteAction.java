package action.admin;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerListService;
import svc.menu.DessertListService;
import svc.menu.DrinkListService;
import svc.admin.MenuDeleteService;
import svc.menu.SetListService;
import svc.menu.SideListService;
import vo.ActionForward;
import vo.Burger;

public class MenuDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String m_id=request.getParameter("m_id");
		ActionForward forward=null;
		boolean delSuccess=false;
		
		if(m_id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('없는 제품입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			MenuDeleteService menuDeleteSvc=new MenuDeleteService();
			delSuccess=menuDeleteSvc.menuRemove(m_id);
			if(delSuccess) {
				////
				String category=request.getParameter("category");
				ArrayList<Burger> menuList=null;
				if(category.equals("set")) {
					SetListService setListSvc=new SetListService();
					menuList=setListSvc.getSetList();
				}else if(category.equals("burger")) {
					BurgerListService burgerListSvc=new BurgerListService();
					menuList=burgerListSvc.getBurgerList();
				}else if(category.equals("side")) {
					SideListService sideListSvc=new SideListService();
					menuList=sideListSvc.getSideList();
				}else if(category.equals("drink")) {
					DrinkListService drinkListSvc=new DrinkListService();
					menuList=drinkListSvc.getDrinkList();
				}else if(category.equals("dessert")) {
					DessertListService dessertListSvc=new DessertListService();
					menuList=dessertListSvc.getDessertList();
				}
				////
				request.setAttribute("menuAdmList", menuList);
				request.setAttribute("admin_showmenu", "/admin/menuAdmList.jsp");
				request.setAttribute("showadmin", "/admin/admin_template.jsp");
				forward=new ActionForward("adminMain.jsp",false);
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('메뉴 삭제 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
		
		return forward;
	}

}
