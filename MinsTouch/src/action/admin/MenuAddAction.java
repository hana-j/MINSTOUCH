package action.admin;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.menu.BurgerViewService;
import svc.admin.MenuAddService;
import vo.ActionForward;
import vo.Burger;

public class MenuAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		Burger checkMenu=null;
		boolean isAddSuccess=false;
		MenuAddService menuAddSvc=new MenuAddService();
		BurgerViewService burgerViewSvc=new BurgerViewService();
		
		String realFolder="";
		String saveFolder="/burger_images";
		String encType="UTF-8";
		int maxSize=5*1024*1024;
		
		ServletContext context=request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		
		String image=multi.getOriginalFileName("image");
		String m_id=multi.getParameter("m_id");
		String category=multi.getParameter("category");
		
		checkMenu=burgerViewSvc.getBurgerView(m_id);
		
		
		if(checkMenu==null) {	//신메뉴
			Burger newMenu=new Burger(m_id,
					category,
					multi.getParameter("m_name"),
					Integer.parseInt((multi.getParameter("m_price").trim().equals(""))?"0":multi.getParameter("m_price")),
					multi.getParameter("m_detail"),
					multi.getParameter("m_status"),
					image);
			
			isAddSuccess=menuAddSvc.addMenu(newMenu);
			
			if(isAddSuccess) {
				if(category.equals("set")) forward=new ActionForward("set.adm",true);
				else if(category.equals("burger")) forward=new ActionForward("burger.adm",true);
				else if(category.equals("side")) forward=new ActionForward("side.adm",true);
				else if(category.equals("drink")) forward=new ActionForward("drink.adm",true);
				else if(category.equals("dessert")) forward=new ActionForward("dessert.adm",true);
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('메뉴 등록 실패')");
				out.println("history.back()");
				out.println("</script>");
			}		
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('등록하려는 메뉴ID가 이미 존재합니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
