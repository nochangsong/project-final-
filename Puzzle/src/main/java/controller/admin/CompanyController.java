package controller.admin;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.CompanyCommand;
import mybatis.CompanyDAO;

@Controller
@RequestMapping("/admin")
public class CompanyController {

	@Autowired
	private CompanyDAO service;
	public void setService(CompanyDAO service) {
		this.service = service;
	}
	
	@ModelAttribute("companyCommand")
	public CompanyCommand getCommand(){
		return new CompanyCommand();
	}
	
	@RequestMapping(value="/company/company.puzzle", method=RequestMethod.GET)
	public ModelAndView company() throws Exception{
		ModelAndView mav = new ModelAndView("company");
		String com_ceo = "nochso89@gmail.com";
		CompanyCommand company = service.getCompanyInfo(com_ceo);
		mav.addObject("company", company);
		return mav;
	}
	
	@RequestMapping(value="/company/getLogo.puzzle", method=RequestMethod.GET)
	public void company(HttpServletResponse resp) throws Exception{
		String com_ceo = "nochso89@gmail.com";
		CompanyCommand company = service.getCompanyInfo(com_ceo);
        byte[] logo= null;
        logo = (byte[])company.getCom_logo_bytes();
        resp.setContentType("image/gif");
        resp.setContentLength(logo.length);
        OutputStream os = resp.getOutputStream();
        os.write(logo);
        os.flush();    
	}
	
	
	@RequestMapping(value="/company/company.puzzle", method=RequestMethod.POST)
	public ModelAndView setLogo(CompanyCommand companyCommand, String check) throws Exception{
		ModelAndView mav = new ModelAndView("company");
		if(check.equals("change")){
			companyCommand.setCom_logo_subject(companyCommand.getCom_logo().getOriginalFilename());
			companyCommand.setCom_logo_bytes(companyCommand.getCom_logo().getBytes());
			service.setLogo(companyCommand);
		}
		mav.addObject("company", companyCommand);
		return mav;
	}
	
	
}
