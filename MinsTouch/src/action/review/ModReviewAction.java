package action.review;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.menu.BurgerViewService;
import svc.review.ReviewModService;
import svc.review.ReviewService;
import vo.ActionForward;
import vo.Burger;
import vo.Review;

public class ModReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<Review> reviewList=null;
		String u_id=request.getParameter("u_id");
		String m_id=request.getParameter("m_id");
		
		boolean modSuccess=false;
		int renum=Integer.parseInt(request.getParameter("renum"));
		int rating=Integer.parseInt(request.getParameter("rating"));
		String text=request.getParameter("text");
		
		if(rating==0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('평점을 선택해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			ReviewModService reviewModSvc=new ReviewModService();
			modSuccess=reviewModSvc.modReview(u_id,m_id,renum,rating,text);
			
			if(modSuccess) {
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
				
//				ReviewService reviewSvc=new ReviewService();
//				reviewList=reviewSvc.showReview(m_id);
//				request.setAttribute("show", "/reviewTemplate.jsp");
//				request.setAttribute("reviewList", reviewList);
//				request.setAttribute("showReview", "/showReview.jsp");
//				
//				forward = new ActionForward();
//				forward.setPath("/template1.jsp");
//				forward.setRedirect(false);
			}else {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out =response.getWriter();
				out.println("<script>");
				out.println("alert('리뷰 수정에 실패했습니다.')");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		
		
		
		
		return forward;
	}

}
