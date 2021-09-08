package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.admin.BurgerAdmAction;
import action.admin.DayOrderMngAction;
import action.admin.DessertAdmAction;
import action.admin.DrinkAdmAction;
import action.admin.MenuAddAction;
import action.admin.MenuAddFormAction;
import action.admin.MenuDeleteAction;
import action.admin.MenuModifyAction;
import action.admin.MenuModifyAction2;
import action.admin.MonthSalesMngAction;
import action.admin.OrderCancelAction;
import action.admin.OrderDetailAction;
import action.admin.OrderGetAction;
import action.admin.OrderManageAction;
import action.admin.SetAdmAction;
import action.admin.SideAdmAction;
import action.admin.AdminJoinAction;
import action.admin.AdminLoginAction;
import action.admin.SalesMngAction;
import vo.ActionForward;

/**
 * Servlet implementation class AdminFrontController
 */
@WebServlet("*.adm")
public class AdminFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFrontController() {
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
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String RequestURI =request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward  forward = null;
		Action action = null;
		System.out.println(command);
		
		
		if(command.equals("/adminLogin.adm")) {
			request.setAttribute("showadmin", "admin/adminLogin.jsp");
			forward=new ActionForward();
			forward.setPath("adminMain.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/adminLoginAction.adm")) {
			action = new AdminLoginAction();
			try {
				forward= action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/adminJoin.adm")) {
			request.setAttribute("showadmin", "admin/adminJoin.jsp");
			forward = new ActionForward();
			forward.setPath("adminMain.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/adminJoinAction.adm")) {
			action = new AdminJoinAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/adminLogout.adm")) {
			HttpSession session = request.getSession();
			session.removeAttribute("admin_grade");
			session.removeAttribute("a_id");
			session.removeAttribute("a_name");
			response.setContentType("text/html;charset=utf-8");
			forward  = new ActionForward();
			forward.setPath("adminMain.jsp");
			forward.setRedirect(true);
		}
		
		
		
		
		
		
		else if(command.equals("/salesCal.adm")) {
			String admin_grade=null;
			HttpSession session=request.getSession();
			admin_grade=(String)session.getAttribute("admin_grade");
			
			if(admin_grade==null) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out= response.getWriter();
				out.println("<script>");
				out.println("alert('관리자로 로그인 해주세요.');");
				out.println("location.href='adminMain.jsp'");
				out.println("</script>");
			}else {
				request.setAttribute("showadmin", "/admin/salesView.jsp");
				forward=new ActionForward("adminMain.jsp", false);
			}
		}
		//매출집계 
		else if(command.equals("/salesDetail.adm")) {
			action = new SalesMngAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//월매출
		else if(command.equals("/monthSales.adm")) {
			action = new MonthSalesMngAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		////////////////////////////////////////////////////////
		
		if(command.equals("/orderManage.adm")) {
			action=new OrderManageAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/dayOrderManage.adm")) {
			action = new DayOrderMngAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/orderDetail.adm")) {
			action=new OrderDetailAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/orderGet.adm")) {
			action=new OrderGetAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/orderCancel.adm")) {
			action=new OrderCancelAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//////////////////////////////////////////////////////////
		
		else if(command.equals("/menuManage.adm")) {
			String admin_grade=null;
			HttpSession session=request.getSession();
			admin_grade=(String)session.getAttribute("admin_grade");
			if(admin_grade==null) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out= response.getWriter();
				out.println("<script>");
				out.println("alert('관리자로 로그인 해주세요.');");
				out.println("location.href='adminMain.jsp'");
				out.println("</script>");
			}else {
				request.setAttribute("showadmin", "/admin/admin_template.jsp");
				forward=new ActionForward();
				forward.setPath("adminMain.jsp");
				forward.setRedirect(false);
			}
			
			
		}else if(command.equals("/set.adm")) {
			action=new SetAdmAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/burger.adm")) {
			action=new BurgerAdmAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/side.adm")) {
			action=new SideAdmAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/drink.adm")) {
			action=new DrinkAdmAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/dessert.adm")) {
			action=new DessertAdmAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/menuDelete.adm")) {
			action=new MenuDeleteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/menuModify.adm")) {
			action=new MenuModifyAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/menuModify2.adm")) {
			action=new MenuModifyAction2();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/menuAddForm.adm")) {
			action=new MenuAddFormAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/menuAdd.adm")) {
			action=new MenuAddAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		else if(command.equals("/service.adm")) {
			request.setAttribute("showadmin", "admin/service.jsp");
			forward=new ActionForward("adminMain.jsp",false);
		}else if(command.equals("/teamsOfService.adm")) {
			request.setAttribute("showadmin", "user/teamsOfService.jsp");
			forward = new ActionForward("adminMain.jsp",false);   //건들지 마시오!
		}else if(command.equals("/privacy.adm")) {
			request.setAttribute("showadmin", "user/privacy.jsp");
			forward = new ActionForward("adminMain.jsp",false);   //건들지 마시오!
		}else if(command.equals("/emailCollect.adm")) {
			request.setAttribute("showadmin", "user/emailCollect.jsp");
			forward = new ActionForward("adminMain.jsp",false);   //건들지 마시오!
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		if(forward!=null)
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispathcer = request.getRequestDispatcher(forward.getPath());
				dispathcer.forward(request, response);
			}
		
	}
	
}
