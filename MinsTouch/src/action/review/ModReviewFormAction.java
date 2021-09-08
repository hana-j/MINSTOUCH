package action.review;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.menu.BurgerViewService;
import svc.review.ReviewModService;
import svc.review.ReviewService;
import vo.ActionForward;
import vo.Burger;
import vo.Review;

public class ModReviewFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		Review review=null;
		HttpSession session = request.getSession();
		String s_id = (String)session.getAttribute("u_id");
		String u_id=request.getParameter("u_id");
		String m_id=request.getParameter("m_id");
		int renum=Integer.parseInt(request.getParameter("renum"));
		System.out.println(u_id);
		System.out.println(s_id);
		ReviewModService reviewModSvc = new ReviewModService();
		review=reviewModSvc.getReview(renum);
		
		if(s_id == null ||  !s_id.equals(u_id) ) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out =response.getWriter();
			out.println("<script>");
			out.println("alert('본인이 게시한 글만 수정이 가능합니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
//			if(review==null) {
//				response.setContentType("text/html; charset=utf-8");
//				PrintWriter out =response.getWriter();
//				out.println("<script>");
//				out.println("alert('존재하지 않는 글입니다.')");
//				out.println("history.back();");
//				out.println("</script>");
		
				Burger burger=null;
				BurgerViewService burgerViewSvc=new BurgerViewService();
				burger=burgerViewSvc.getBurgerView(m_id);
				request.setAttribute("burger", burger);
				ReviewService reviewSvc=new ReviewService();
				
				request.setAttribute("u_id", u_id);
				request.setAttribute("m_id", m_id);
				ArrayList<Review> reviewList=reviewSvc.showReview(m_id);
				request.setAttribute("reviewList", reviewList);
				request.setAttribute("showReview", "/review/showReview.jsp");
				request.setAttribute("showmenu", "/user/burgerView.jsp");
				request.setAttribute("reviewpage", "/review/reviewModForm.jsp");
				request.setAttribute("review", review);
				forward=new ActionForward("template.jsp",false);
			}
		
		return forward;
	}

}
