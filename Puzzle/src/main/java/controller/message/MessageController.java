package controller.message;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("messageList.puzzle")
	public ModelAndView submit() throws Exception {
		ModelAndView mav = new ModelAndView("messageList");
		List<MessageCommand> list = service.getAllMessages("joo@naver.com");
		mav.addObject("msg", list);
		return mav;
	}
	
//	@RequestMapping(value= "/message/messageList.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
//	@ResponseBody
//	public String alarmList(HttpServletResponse resp) throws Exception{
//		resp.setContentType("text/html;charset=utf-8");
//		List<MessageCommand> list = service.alarmList();
//		int msgNum = service.getNewMessageNumber();
//		JSONObject json = new JSONObject();
//		json.put("data", list);
//		json.put("msgNum", msgNum);
//		for(int idx=0; idx<list.size();idx++){
//			service.updateAlarm(list.get(idx));
//		}
////		System.out.println(json.toString());
//		return json.toString();
//	}
}
