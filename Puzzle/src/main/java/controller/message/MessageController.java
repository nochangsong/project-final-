package controller.message;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.MessageCommand;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/message")
public class MessageController {

	private String userEmail = "joo@naver.com";
	
	private MessageService service;
	@Autowired
	public void setService(MessageService service) {
		this.service = service;
	}
	private int perPage = 10;
	
	@RequestMapping(value="messageList.puzzle", method=RequestMethod.GET)
	public ModelAndView getList(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("messageList");
		
//		String userEmail = (String)request.getSession().getAttribute("email");
		
		int totalMsgCount = service.getTotalMessageCount(userEmail); //51
		int pageCount = totalMsgCount/perPage+(totalMsgCount%perPage==0?0:1); //6
//		int start = totalMsgCount-perPage*(pageNum-1); 
//		int end = (start-perPage)+1 > 0 ? (start-perPage)+1 : 1; 
		
		int start = perPage*(pageNum-1)+1; 
		int end = start+(perPage-1) > totalMsgCount ? totalMsgCount : start+(perPage-1);
		
		
		int startPage = (pageNum-1) / 5 * 5 + 1; //1
		int endPage = startPage + 5 - 1; //5
		if(endPage>pageCount){
			endPage=pageCount;
		}
		
//		System.out.println(startPage);
//		System.out.println(endPage);
		
		List<MessageCommand> list = service.getAllMessages(userEmail, start, end);
		
		mav.addObject("pageCount", pageCount); //6
		mav.addObject("pageNum", pageNum);
		mav.addObject("msg", list);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage",endPage);
		return mav;
	}
	
	@RequestMapping(value="messageList.puzzle", method=RequestMethod.POST)
	public String submit(@RequestParam("checkList")int[] no) throws Exception {
		service.deleteMessages(no); 
		return "redirect:messageList.puzzle";
	}
	
	@RequestMapping(value="messageForm.puzzle", method=RequestMethod.GET)
	public ModelAndView messageForm(MessageCommand messageCommand, String sender) throws Exception {
		ModelAndView mav = new ModelAndView("messageForm");
		mav.addObject("messageCommand", messageCommand);
		mav.addObject("sender", sender);
		return mav;
	}
	
	@RequestMapping(value="messageForm.puzzle", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ModelAndView send(MessageCommand messageCommand, HttpServletResponse resp, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("sendSuccess");
		resp.setContentType("text/html;charset=utf-8");
		
//		String userEmail = (String)request.getSession().getAttribute("email");
		messageCommand.setSender(userEmail);
		service.send(messageCommand);
		
		JSONObject json = new JSONObject();
		json.put("message", messageCommand);
//		System.out.println(json.toString());
		mav.addObject("message", json.toString());
		return mav;
//		return "redirect:messageList.puzzle";
	}
	
	@RequestMapping(value= "showMessage.puzzle", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String showMessage(HttpServletResponse resp, HttpServletRequest request) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		MessageCommand message = service.getMessage(no);
		if(message.getChecked().equals("new")){
			service.updateRead(message);
		}
		JSONObject json = new JSONObject();
		String sender = URLEncoder.encode(message.getName(),"UTF-8") + "(" + message.getSender() + ", " +  URLEncoder.encode(message.getDept_type(),"UTF-8") + ")";
		json.put("sender", sender);
		json.put("content", URLEncoder.encode(message.getContent(),"UTF-8"));
		return json.toString();
	}
	
	@RequestMapping(value= "messageAlarm.puzzle", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String alarmList(HttpServletRequest request, HttpServletResponse resp, String data) throws Exception{
		
//		String userEmail = (String)request.getSession().getAttribute("email");
		
		String out="";
		resp.setContentType("text/html;charset=utf-8");
		JSONParser parser = new JSONParser();
		org.json.simple.JSONObject json = (org.json.simple.JSONObject) parser.parse(data);
		int msgNum = service.getNewMessageNumber(userEmail);
		json.put("msgNum", msgNum);
		org.json.simple.JSONObject message = (org.json.simple.JSONObject) json.get("message");
		if(message.get("receiver").equals(userEmail)){
			out = json.toString();
		}
		return out;
	}
	
	@RequestMapping(value="getMessageCount.puzzle", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getMessageCount(HttpServletRequest request) throws Exception {
//		String userEmail = (String)request.getSession().getAttribute("email");
		int count = 0;
		if(userEmail!=null){
			count = service.getNewMessageNumber(userEmail);
		}
		JSONObject json = new JSONObject();
		json.put("msgNum", count);
		return json.toString();
	}
	
	@RequestMapping(value="searchEmail.puzzle", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String searchEmail(String search) throws Exception {
		List<MessageCommand> list = service.searchEmail(search);
		for(int i=0; i<list.size(); i++){
			list.get(i).setName(URLEncoder.encode(list.get(i).getName(),"UTF-8"));
			list.get(i).setDept_type(URLEncoder.encode(list.get(i).getDept_type(),"UTF-8"));
		}
		JSONObject json = new JSONObject();
		json.put("list", list);
		return json.toString();
	}

}
