package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.Authentication;
import Util.PwContent;

/**
 * Servlet implementation class MailSendController
 */
@WebServlet("*.send")
public class MailSendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailSendController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String receiver= request.getParameter("u_email");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			Properties prop =System.getProperties();
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", "587");
			Authenticator auth = new Authentication();
			PwContent content = new PwContent();
			Session s= Session.getDefaultInstance(prop, auth);
			Multipart multi = new MimeMultipart();
			MimeBodyPart mbp = new MimeBodyPart();
			mbp.setContent(content,"text/html;charset=utf-8" );
			mbp.setHeader("content-type", "text/html;charset=utf-8");
	
			Address receiver_addr = new InternetAddress(receiver);
			Message msg =new MimeMessage(s);
			msg.addRecipient(Message.RecipientType.TO, receiver_addr);
			msg.setContent(multi);
			Transport.send(msg);
			
			out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
		}catch(Exception e) {
			e.printStackTrace();
			out.println("서버에 문제가 발생하였습니다. 다시 시도해주세요.");
		}
	}

}
