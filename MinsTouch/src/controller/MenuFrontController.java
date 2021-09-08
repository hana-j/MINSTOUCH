package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.Action;
import action.menu.BurgerAction;
import action.menu.BurgerCartAddAction;
import action.menu.BurgerCartListAction;
import action.menu.BurgerCartOrderAction;
import action.menu.BurgerCartQtyDownAction;
import action.menu.BurgerCartQtyUpAction;
import action.menu.BurgerCartRemoveAction;
import action.menu.BurgerCartRemoveAllAction;
import action.menu.BurgerViewAction;
import action.menu.DessertAction;
import action.menu.DrinkAction;
import action.menu.MenuAction;
import action.menu.MyOrderAction;
import action.menu.MyOrderDetailAction;
import action.menu.RealTimeOrderAction;
import action.menu.SetAction;
import action.menu.SideAction;
import vo.ActionForward;







/**
 * Servlet implementation class MenuFrontController
 */
@WebServlet("*.kiosk")
public class MenuFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	
	
	
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//1.요청파악
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=requestURI.substring(contextPath.length());
		System.out.println(command);
		
		Action action=null;
		ActionForward forward=null;
		
		
		//2.각 요청별로 비즈니스 로직 호출
		if(command.equals("/menu.kiosk")) {
			action=new MenuAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burger.kiosk")) {
			action=new BurgerAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burgerView.kiosk")) {
			action=new BurgerViewAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burgerCartAdd.kiosk")) {
			action=new BurgerCartAddAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burgerCartList.kiosk")) {
			action=new BurgerCartListAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burgerCartRemove.kiosk")) {
			action=new BurgerCartRemoveAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burgerCartRemoveAll.kiosk")) {
			action=new BurgerCartRemoveAllAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burgerCartQtyUp.kiosk")) {
			action=new BurgerCartQtyUpAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burgerCartQtyDown.kiosk")) {
			action=new BurgerCartQtyDownAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burgerCartOrder.kiosk")) {
			action=new BurgerCartOrderAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/realtimeOrder.kiosk")) {
			action=new RealTimeOrderAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/myOrder.kiosk")) {
			action=new MyOrderAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/myOrderDetail.kiosk")) {
			action=new MyOrderDetailAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		else if(command.equals("/side.kiosk")) {
			action=new SideAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/drink.kiosk")) {
			action=new DrinkAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/dessert.kiosk")) {
			action=new DessertAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/set.kiosk")) {
			action=new SetAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		//3.포워딩
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		//////////////////////////////////////////////////////////
//		if(command.equals("/burgerCartList.kiosk")) {
//			action=new BurgerAction();
//			try {
//				forward=action.execute(request, response);
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		if(forward != null) {
//			if(forward.isRedirect()) {
//				response.sendRedirect(forward.getPath());
//			}else {
//				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
//				dispatcher.forward(request, response);
//			}
//		}
		
		
		
		
		
		
	}
}
