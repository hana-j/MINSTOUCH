package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.review.ModReviewAction;
import action.review.ModReviewFormAction;
import action.review.RemoveReviewAction;
import action.review.ReviewPostAction;
import action.review.menuSelectAction;
import vo.ActionForward;



/**
 * Servlet implementation class ReviewFrontController
 */
@WebServlet("*.re")
public class ReviewFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewFrontController() {
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

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);

		ActionForward forward = null;
		Action action = null;
		
		
		if(command.equals("/menuSelect.re")) {
			action=new menuSelectAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/reviewPost.re")) {
			action=new ReviewPostAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/removeReview.re")) {
			action=new RemoveReviewAction();
			try {
				forward=action.execute(request, response);
						
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/modReviewForm.re")) {
			action=new ModReviewFormAction();
			try {
				forward=action.execute(request, response);
						
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/modReview.re")) {
			action=new ModReviewAction();
			try {
				forward=action.execute(request, response);
						
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
		
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		
		
		
		
		
	}

}
