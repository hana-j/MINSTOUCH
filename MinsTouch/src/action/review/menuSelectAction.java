package action.review;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerViewService;
import svc.review.ReviewService;
import vo.ActionForward;
import vo.Burger;
import vo.Review;

public class menuSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		ArrayList<Review> reviewList=null;
		String u_id=request.getParameter("u_id");
		String m_id=request.getParameter("m_id");
		System.out.println("u_id : " + u_id);
		System.out.println("m_id : " + m_id);
		if(u_id.trim().equals("")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out =response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			Burger burger=null;
			BurgerViewService burgerViewSvc=new BurgerViewService();
			
			burger=burgerViewSvc.getBurgerView(m_id);
			request.setAttribute("burger", burger);
			
			
			ReviewService reviewSvc=new ReviewService();
			reviewList=reviewSvc.showReview(m_id);
			request.setAttribute("reviewpage", "/review/reviewTemplate.jsp");
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("showReview", "/review/showReview.jsp");
			request.setAttribute("showmenu", "/user/burgerView.jsp");
			
			request.setAttribute("u_id", u_id);
			request.setAttribute("m_id", m_id);
		
			forward=new ActionForward("template.jsp",false);
		}
		return forward;
	}

}
