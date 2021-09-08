package action.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerViewService;
import svc.review.ReviewService;
import vo.ActionForward;
import vo.Burger;
import vo.Review;

public class BurgerViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Burger burger=null;
		BurgerViewService burgerViewSvc=new BurgerViewService();
		String burger_id=request.getParameter("id");
		request.setAttribute("m_id", burger_id);
		burger=burgerViewSvc.getBurgerView(burger_id);
		request.setAttribute("burger", burger);
		ReviewService reviewSvc=new ReviewService();
		ArrayList<Review> reviewList=reviewSvc.showReview(burger_id);
		request.setAttribute("reviewpage", "/review/reviewTemplate.jsp");
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("showReview", "/review/showReview.jsp");
		
		request.setAttribute("showmenu", "/user/burgerView.jsp");
		ActionForward forward=new ActionForward("template.jsp",false);
		return forward;
	}

}
