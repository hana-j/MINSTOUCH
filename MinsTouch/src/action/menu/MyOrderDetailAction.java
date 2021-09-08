package action.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.Action;
import svc.admin.OrdetailListService;

import vo.ActionForward;
import vo.Ordetail;


public class MyOrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Ordetail> myOrdetailList=null;
		
		int totalMoney=Integer.parseInt(request.getParameter("totalMoney"));
		int order_num=Integer.parseInt(request.getParameter("order_num"));
		
		OrdetailListService ordetailListSvc=new OrdetailListService();
		myOrdetailList=ordetailListSvc.getOrdetailList(order_num);
		
		int beforeSaleMoney=0;	//할인율이 적용되기 전 금액
		for(Ordetail ordetail:myOrdetailList) {
			beforeSaleMoney+=(ordetail.getM_price()*ordetail.getQuantity());
		}
		request.setAttribute("beforeSaleMoney", beforeSaleMoney);
		
		request.setAttribute("myOrdetailList", myOrdetailList);
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("showpage", "/user/myOrderDetail.jsp");
		forward=new ActionForward("user.jsp",false);
		return forward;
	}

}
