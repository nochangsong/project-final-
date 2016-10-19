package controller.docubox;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.DocuBoxCommand;

@Controller
@RequestMapping("/docubox")
public class DocuBoxController {

	@Autowired
	private DocuBoxService service;

	private int perPage = 10;

	public void setService(DocuBoxService service) {
		this.service = service;
	}

	@ModelAttribute("DocuCommand")
	public DocuBoxCommand getCommand() {
		return new DocuBoxCommand();
	}

	@RequestMapping(value ="/DocuBoxAll.puzzle", method = RequestMethod.GET)
	public ModelAndView getListAll(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, DocuBoxCommand DocuCommand) throws Exception {
		int Num=0;
		
		int totalCount = service.getTotalCount(Num);
		int pageCount = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		int start = perPage * (pageNum - 1) + 1;
		int end = start + (perPage - 1) > totalCount ? totalCount : start + (perPage - 1);

		int startPage = (pageNum - 1) / 5 * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		ModelAndView mv = new ModelAndView("DocuBoxAll");
		List<DocuBoxCommand> list = service.getlistAll(DocuCommand,start,end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("pageNum", pageNum);	
		mv.addObject("list", list);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		return mv;
	}
	
	@RequestMapping(value="/DocuBoxAll.puzzle",method=RequestMethod.POST)
	public String delDoculist()throws Exception{
		
		return "Redirect:DocuBoxAll";
	}
	
	
	@RequestMapping(value ="/DocuBoxFN.puzzle", method = RequestMethod.GET)
	public ModelAndView getListFN(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, DocuBoxCommand DocuCommand) throws Exception {
		int Num=0;
		
		int totalCount = service.getTotalCount(Num);
		int pageCount = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		int start = perPage * (pageNum - 1) + 1;
		int end = start + (perPage - 1) > totalCount ? totalCount : start + (perPage - 1);

		int startPage = (pageNum - 1) / 5 * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		ModelAndView mv = new ModelAndView("DocuBoxFN");
		List<DocuBoxCommand> list = service.getlistFN(DocuCommand,start,end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("pageNum", pageNum);	
		mv.addObject("list", list);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		return mv;
	}
	
	@RequestMapping(value ="/DocuBoxPG.puzzle", method = RequestMethod.GET)
	public ModelAndView getListPG(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, DocuBoxCommand DocuCommand) throws Exception {
		int Num=0;
		
		int totalCount = service.getTotalCount(Num);
		int pageCount = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		int start = perPage * (pageNum - 1) + 1;
		int end = start + (perPage - 1) > totalCount ? totalCount : start + (perPage - 1);

		int startPage = (pageNum - 1) / 5 * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		ModelAndView mv = new ModelAndView("DocuBoxPG");
		List<DocuBoxCommand> list = service.getlistPG(DocuCommand,start,end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("pageNum", pageNum);	
		mv.addObject("list", list);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		return mv;
	}
	
	@RequestMapping(value ="/DocuBoxRB.puzzle", method = RequestMethod.GET)
	public ModelAndView getListRB(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, DocuBoxCommand DocuCommand) throws Exception {
		int Num=0;
		
		int totalCount = service.getTotalCount(Num);
		int pageCount = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		int start = perPage * (pageNum - 1) + 1;
		int end = start + (perPage - 1) > totalCount ? totalCount : start + (perPage - 1);

		int startPage = (pageNum - 1) / 5 * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		ModelAndView mv = new ModelAndView("DocuBoxRB");
		List<DocuBoxCommand> list = service.getlistRB(DocuCommand,start,end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("pageNum", pageNum);	
		mv.addObject("list", list);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		return mv;
	}
}
