package controller.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@RequestMapping("/calendarList.puzzle")
	public String list() throws Exception {
		return "calendarList";
	}
}
