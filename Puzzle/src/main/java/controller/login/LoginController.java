package controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {

	@Autowired
	private LoginService service;

	public void setService(LoginService service) { 
		this.service = service;
	}
	
	@RequestMapping(value="LoginView.puzzle", method=RequestMethod.GET)
	public void loginpage(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String getEmail = request.getParameter("email");
		
		HttpSession session = request.getSession();
		session.setAttribute("email", getEmail);
		
		
		String certify = service.loginselect(getEmail);
		
		if(certify.equals("Y")){

			response.sendRedirect("main/main.puzzle");

			String authoriry = service.getAuthority(getEmail);
			request.getSession().setAttribute("authority", authoriry);

		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
