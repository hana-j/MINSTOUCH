package action.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.menu.BurgerCartListService;
import svc.menu.BurgerListService;
import svc.menu.DessertListService;
import svc.menu.DrinkListService;
import svc.menu.SetListService;
import svc.menu.SideListService;
import vo.ActionForward;
import vo.Burger;
import vo.Cart;

public class BurgerCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BurgerCartListService burgerCartListSvc=new BurgerCartListService();
		ArrayList<Cart> cartList=burgerCartListSvc.getCartList(request);
		
		//총 금액 계산
		int totalMoney=0;
		int money=0;
		System.out.println("카트리스트 : " + cartList);
		if(cartList!=null) {
			for(int i=0; i<cartList.size(); i++) {
				money=cartList.get(i).getPrice()*cartList.get(i).getQty();
				totalMoney+=money;
			}
		
		
		
//		ArrayList<Burger> burgerList=null;
//		BurgerListService burgerListSvc=new BurgerListService();
//		burgerList=burgerListSvc.getBurgerList();
//		
//		request.setAttribute("burgerList", burgerList);
//		request.setAttribute("showmenu", "/burgerList.jsp");
		//
		
		
			int lastCartIndex=cartList.size()-1;
			
			if(lastCartIndex>-1) {
				ArrayList<Burger> menuList=null;
				if(cartList.get(lastCartIndex).getCategory().equals("burger")) {
					BurgerListService burgerListSvc=new BurgerListService();
					menuList=burgerListSvc.getBurgerList();
				}else if(cartList.get(lastCartIndex).getCategory().equals("side")) {
					SideListService sideListSvc=new SideListService();
					menuList=sideListSvc.getSideList();
				}else if(cartList.get(lastCartIndex).getCategory().equals("drink")) {
					DrinkListService drinkListSvc=new DrinkListService();
					menuList=drinkListSvc.getDrinkList();
				}else if(cartList.get(lastCartIndex).getCategory().equals("dessert")) {
					DessertListService dessertListSvc=new DessertListService();
					menuList=dessertListSvc.getDessertList();
				}else if(cartList.get(lastCartIndex).getCategory().equals("set")) {
					SetListService setListSvc=new SetListService();
					menuList=setListSvc.getSetList();
				}
				
				request.setAttribute("burgerList", menuList);
				request.setAttribute("showmenu", "/user/burgerList.jsp");
			}else {
				SetListService setListSvc=new SetListService();
				ArrayList<Burger> menuList=setListSvc.getSetList();
				request.setAttribute("burgerList", menuList);
				request.setAttribute("showmenu", "/user/burgerList.jsp");
			}
		}
		
		
		
		//
		HttpSession session =request.getSession();
		session.setAttribute("totalMoney", totalMoney);
		session.setAttribute("cartList", cartList);
		session.setAttribute("showcart", "/user/burgerCartList.jsp");
		ActionForward forward=new ActionForward("template.jsp",false);
		return forward;
	}

}
