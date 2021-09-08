package action.admin;

import java.io.PrintWriter;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.admin.MenuModService;

import vo.ActionForward;
import vo.Burger;

public class MenuModifyAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		boolean isModSuccess=false;
		MenuModService menuModSvc=new MenuModService();
		
		String realFolder="";
		String saveFolder="/burger_images";
		String encType="UTF-8";
		int maxSize=5*1024*1024;
		
		ServletContext context=request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		
		//
//			System.out.println("multi.getFilesystemName(\"image\")" + multi.getFilesystemName("image"));
//			System.out.println("multi.getOriginalFileName(\"image\")" + multi.getOriginalFileName("image"));
//			System.out.println("multi.getParameter(\"image\")" + multi.getParameter("image"));
		//
//		String image=multi.getFilesystemName("image");
//		String image=multi.getParameter("image");
		String image=multi.getOriginalFileName("image");
		String m_id=multi.getParameter("m_id");
		String category=multi.getParameter("category");
		
		Burger menu=new Burger(m_id,
				category,
				multi.getParameter("m_name"),
				Integer.parseInt(multi.getParameter("m_price")),
				multi.getParameter("m_detail"),
				multi.getParameter("m_status"),
				image);
		
		isModSuccess=menuModSvc.updateMenu(menu);
		
		if(isModSuccess) {
//			ArrayList<Burger> menuList=null;
			if(category.equals("set")) {
				forward=new ActionForward("set.adm",true);
//				SetListService setListSvc=new SetListService();
//				menuList=setListSvc.getSetList();
			}else if(category.equals("burger")) {
				forward=new ActionForward("burger.adm",true);
//				BurgerListService burgerListSvc=new BurgerListService();
//				menuList=burgerListSvc.getBurgerList();
			}else if(category.equals("side")) {
				forward=new ActionForward("side.adm",true);
//				SideListService sideListSvc=new SideListService();
//				menuList=sideListSvc.getSideList();
			}else if(category.equals("drink")) {
				forward=new ActionForward("drink.adm",true);
//				DrinkListService drinkListSvc=new DrinkListService();
//				menuList=drinkListSvc.getDrinkList();
			}else if(category.equals("dessert")) {
				forward=new ActionForward("dessert.adm",true);
//				DessertListService dessertListSvc=new DessertListService();
//				menuList=dessertListSvc.getDessertList();
			}
			
//			request.setAttribute("menuAdmList", menuList);
//			request.setAttribute("admin_showmenu", "/menuAdmList.jsp");
//			request.setAttribute("showadmin", "/admin_template.jsp");
//			forward=new ActionForward("admin.jsp",false);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('메뉴 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
