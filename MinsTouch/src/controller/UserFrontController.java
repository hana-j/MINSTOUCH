package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.user.UserFindAction;
import action.user.UserJoinAction;
import action.user.UserLoginAction;
import action.user.UserModAction;
import action.user.UserViewAction;
import action.user.ChangePwAction;
import action.user.FindPwMailAction;
import action.user.UserDeleteAction;
import vo.ActionForward;


/**
 * Servlet implementation class MemberFrontController
 */
@WebServlet("*.usr")
public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFrontController() {
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

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command= RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		System.out.println(command);
		
        //요청처리 부분 
		if(command.equals("/userLogin.usr")) {
			request.setAttribute("showpage", "user/loginForm.jsp");
			forward=new ActionForward("user.jsp",false);
		}
		else if(command.equals("/userLoginAction.usr")) {
			action = new UserLoginAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/userJoin.usr")) {
			request.setAttribute("showpage", "user/joinForm.jsp");
			forward = new ActionForward("user.jsp",false);
		}
		else if(command.equals("/userJoinAction.usr")) {
			action = new UserJoinAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/userLogout.usr")) {
			HttpSession session = request.getSession();
			session.invalidate();	//세션의 모든 속성을 삭제.
			response.setContentType("text/html;charset=utf-8");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("userMain.jsp");
		}
		else if(command.equals("/userView.usr")) {
			action = new UserViewAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/userModify.usr")) {
			action = new  UserModAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/userFindForm.usr")) {
			request.setAttribute("showpage", "user/userFind.jsp");
			forward = new ActionForward("user.jsp",false);
		}
		else if(command.equals("/userFindAction.usr")) {
			action = new UserFindAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/userPwFind.usr")) {
			request.setAttribute("showpage", "user/pwFind.jsp");
			forward = new ActionForward("user.jsp",false);
		}
		else if(command.equals("/findPwMail.usr")) {
			action = new FindPwMailAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/changePw.usr")) {
			action = new ChangePwAction();
			try {
				forward =action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/userDelete.usr")) {
			action = new UserDeleteAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		////////////////////////////////////////////////////////////////
		
		else if(command.equals("/chain.usr")) {
			request.setAttribute("showpage", "user/chain.jsp");
			forward = new ActionForward("user.jsp",false);	//건들지 마시오!
		}else if(command.equals("/teamsOfService.usr")) {
			request.setAttribute("showpage", "user/teamsOfService.jsp");
			forward = new ActionForward("user.jsp",false);	//건들지 마시오!
		}else if(command.equals("/privacy.usr")) {
			request.setAttribute("showpage", "user/privacy.jsp");
			forward = new ActionForward("user.jsp",false);	//건들지 마시오!
		}else if(command.equals("/emailCollect.usr")) {
			request.setAttribute("showpage", "user/emailCollect.jsp");
			forward = new ActionForward("user.jsp",false);	//건들지 마시오!
		}
		
//////////////////////////////////////////////////////////////////
		
		
		

else if(command.equals("/chain.usr")) {
request.setAttribute("showpage", "user/chain.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}

else if(command.equals("/gameng.usr")) {
request.setAttribute("showpage", "user/gameng.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}

else if(command.equals("/sangdam.usr")) {
request.setAttribute("showpage", "user/sangdam.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}

else if(command.equals("/success.usr")) {
request.setAttribute("showpage", "user/success.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}

else if(command.equals("/headcenter.usr")) {
request.setAttribute("showpage", "user/headcenter.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}

else if(command.equals("/faq.usr")) {
request.setAttribute("showpage", "user/faq.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}		
		

else if(command.equals("/jaju.usr")) {
request.setAttribute("showpage", "user/jaju.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}		
		
else if(command.equals("/personal.usr")) {
request.setAttribute("showpage", "user/persontoperson.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}						
		
else if(command.equals("/successperson.usr")) {
request.setAttribute("showpage", "user/successperson.jsp");
forward = new ActionForward("user.jsp",false);	//건들지 마시오!
}				
		
		
		
		
		
		
		
		
		
	
		//3.포워딩 
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispathcer = request.getRequestDispatcher(forward.getPath());
				dispathcer.forward(request, response);
			}
		}
	}

}
