package controller.message;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	private MessageService service;
	@Autowired
	public void setService(MessageService service) {
		this.service = service;
	}
	private int perPage = 10;
	
	@RequestMapping(value="messageList.puzzle", method=RequestMethod.GET)
	public ModelAndView getList(@RequestParam(value="pageNum", defaultValue = "1")int pageNum) throws Exception {
		ModelAndView mav = new ModelAndView("messageList");
		
		int totalMsgCount = service.getTotalMessageCount("joo@naver.com");
		int pageCount = totalMsgCount/perPage+1;
		int start = totalMsgCount-perPage*(pageNum-1); 
		int end = (start-perPage)+1 > 0 ? (start-perPage)+1 : 1; 
		int previous = (pageNum-5)/5*5+1;
		int next = (pageNum/5+1)*5+1;
		
//		int start = perPage*(pageNum-1)+1;
//		int end = start+(perPage-1);
		
		List<MessageCommand> list = service.getAllMessages("joo@naver.com", start, end);
		
		mav.addObject("pageCount", pageCount);
		mav.addObject("pageNum", pageNum);
		mav.addObject("previous", previous);
		mav.addObject("next", next);
		mav.addObject("msg", list);
		return mav;
	}
	
	@RequestMapping(value="messageList.puzzle", method=RequestMethod.POST)
	public String submit(@RequestParam("checkList")int[] no) throws Exception {
		service.deleteMessages(no); 
		return "redirect:messageList.puzzle";
	}
	
	@RequestMapping(value= "messageAlarm.puzzle", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String alarmList(HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		List<MessageCommand> list = service.getAlarmList("joo@naver.com");
		int msgNum = service.getNewMessageNumber("joo@naver.com");
		JSONObject json = new JSONObject();
		json.put("data", list);
		json.put("msgNum", msgNum);
		for(int idx=0; idx<list.size();idx++){
			service.updateAlarm(list.get(idx));
		}
//		System.out.println(json.toString());
		return json.toString();
	}
	
	@RequestMapping(value="messageForm.puzzle", method=RequestMethod.GET)
	public ModelAndView messageForm(MessageCommand messageCommand, String sender) throws Exception {
		ModelAndView mav = new ModelAndView("messageForm");
		mav.addObject("messageCommand", messageCommand);
		mav.addObject("sender", sender);
		return mav;
	}
	
	@RequestMapping(value="messageForm.puzzle", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String send(MessageCommand messageCommand, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		messageCommand.setSender("koo@naver.com");
		service.send(messageCommand);
//		return "sendSuccess";
		return "redirect:messageList.puzzle";
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
		json.put("sender", message.getSender());
		json.put("content", message.getContent());
		return json.toString();
	}
}
