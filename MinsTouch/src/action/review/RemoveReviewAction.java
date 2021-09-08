package action.review;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.menu.BurgerViewService;
import svc.review.ReviewRemoveService;
import svc.review.ReviewService;
import vo.ActionForward;
import vo.Burger;
import vo.Review;

public class RemoveReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= null;
		HttpSession session = request.getSession();
		String s_id = (String)session.getAttribute("u_id");
		String u_id=request.getParameter("u_id");
		String m_id=request.getParameter("m_id");
		boolean removeSuccess =false;
		
		int renum = Integer.parseInt(request.getParameter("renum"));
		ReviewRemoveService reviewRemoveSvc = new ReviewRemoveService();
		removeSuccess = reviewRemoveSvc.removeReview(u_id,renum);
		
		if(s_id == null ||  !s_id.equals(u_id)  ) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out =response.getWriter();
			out.println("<script>");
			out.println("alert('본인의 게시글만 삭제 가능합니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(removeSuccess){
				Burger burger=null;
				BurgerViewService burgerViewSvc=new BurgerViewService();
				
				burger=burgerViewSvc.getBurgerView(m_id);
				request.setAttribute("burger", burger);
				
				
				ReviewService reviewSvc=new ReviewService();
				ArrayList<Review> reviewList=reviewSvc.showReview(m_id);
				request.setAttribute("reviewpage", "/review/reviewTemplate.jsp");
				request.setAttribute("reviewList", reviewList);
				request.setAttribute("showReview", "/review/showReview.jsp");
				request.setAttribute("showmenu", "/user/burgerView.jsp");
				
				request.setAttribute("u_id", u_id);
				request.setAttribute("m_id", m_id);
			
				forward=new ActionForward("template.jsp",false);
				
			}else {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out =response.getWriter();
				out.println("<script>");
				out.println("alert('리뷰 삭제에 실패했습니다.')");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		return forward;
	}

}
