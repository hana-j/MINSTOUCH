package action.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.admin.OrdetailListService;
import svc.user.UserViewService;
import vo.ActionForward;
import vo.Address;
import vo.Ordetail;
import vo.UserBean;

public class OrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Ordetail> ordetailList=null;
		
		int order_num=Integer.parseInt(request.getParameter("order_num"));
		
		String u_id=request.getParameter("u_id");
		UserViewService userViewSvc=new UserViewService();
		UserBean user=userViewSvc.getUser(u_id);
		Address addr=userViewSvc.getAddress(u_id);
		
		OrdetailListService ordetailListSvc=new OrdetailListService();
		ordetailList=ordetailListSvc.getOrdetailList(order_num);
		
		request.setAttribute("user", user);
		request.setAttribute("addr", addr);
		request.setAttribute("ordetailList", ordetailList);
		request.setAttribute("showadmin", "/admin/ordetailList.jsp");
		forward=new ActionForward("adminMain.jsp",false);
		
		return forward;
	}

}
