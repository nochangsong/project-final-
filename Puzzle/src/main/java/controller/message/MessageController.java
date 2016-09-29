package controller.message;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@RequestMapping("/messageList.do")
	public String messageList(){
		return "messageList";
	}
	
	
}
