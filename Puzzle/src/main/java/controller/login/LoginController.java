package controller.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginService service;

	public void setService(LoginService service) {
		this.service = service;
	}
	
	@RequestMapping(value="LoginView.puzzle", method=RequestMethod.GET)
	public String loginpage(HttpServletRequest request)throws Exception {
		String getEmail = request.getParameter("email");
		
		System.out.println("������ �̸���:::"+getEmail);
		
		String certify = service.loginselect(getEmail);
		
		System.out.println("������������:::"+certify);
		
		if(certify.equals("Y")){
			return "main";
		}else{
			return "index.puzzle";
		}
	}
}
