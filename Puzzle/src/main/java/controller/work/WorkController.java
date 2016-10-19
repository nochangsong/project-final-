package controller.work;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.google.api.services.sheets.v4.model.Request;

import model.WorkCommand;

@Controller
@RequestMapping("/work")

public class WorkController {
	@Autowired
	private WorkService service;

	public void setService(WorkService service) {
		this.service = service;
	}

	@ModelAttribute("command") // 시간을 WorkCommand로 보내는 부분
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	public WorkCommand getCommand() {
		return new WorkCommand();
	}

	@RequestMapping(value = "/workList.puzzle", method = RequestMethod.GET) // workList창을
																			// 띄우는
																			// 부분
	public String work() {
		System.out.println("시작");
		return "workList";
	}

	@RequestMapping(value = "/workList.puzzle", method = RequestMethod.POST) // 이름으로
	public ModelAndView find_absent(String Name, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=UTF-8");
		List<WorkCommand> list = service.getWorkList(Name);
		ModelAndView mav = new ModelAndView("workList");
		mav.addObject("Name", list);
		return mav;
	}

	// 휴가 등록 페이지로 이동
	@RequestMapping(value = "/vacation.puzzle", method = RequestMethod.GET)
	public String vacation() {
		System.out.println("시작");
		return "vacation";
	}
	
	

	// 휴가 등록 페이지에서 휴가 등록하는 것
	@RequestMapping(value = "/vacation.puzzle", method = RequestMethod.POST)
	public String vacation_register(@ModelAttribute("command") WorkCommand command,HttpServletRequest request) throws Exception {
		String Email = (String) request.getSession().getAttribute("email");
		command.setEmail(Email);
		service.setVacation(command);
		System.out.println("끝");
		return "vacation";
	}

	@RequestMapping(value = "/workListNormal.puzzle", method = RequestMethod.GET)
	public ModelAndView workListNormal(HttpServletRequest request) {
		String Email = (String) request.getSession().getAttribute("email");
		List<WorkCommand> list = service.getWorkListNormal(Email);
		ModelAndView mav = new ModelAndView("workListNormal");
		mav.addObject("Email", list);

		return mav;
	}

	/*
	 * @ModelAttribute("start")
	 * 
	 * @DateTimeFormat(pattern="yyyy-MM-dd-HH-mm-ss") public WorkCommand
	 * start(HttpServletRequest request){ String Email =
	 * (String)request.getSession().getAttribute("email"); Date sysdate = null;
	 * 
	 * if(sysdate = null){ WorkCommand Work_type = "결석"; }else{ if(sysdate <=
	 * 09:00:00){ WorkCommand Work_type = "정상"; }else{ WorkCommand Work_type =
	 * "지각"; } }
	 * 
	 * return new WorkCommand(); }
	 */

	/* @ModelAttribute("start") */
	//출퇴근 시간 등록하는 부분
	@DateTimeFormat(pattern = "yy-mm-dd")
	@RequestMapping(value = "/workListNormal.puzzle", method = RequestMethod.POST)
	public ModelAndView start(HttpServletRequest request) throws ParseException {
		String work_type = null;
		GregorianCalendar calendar = new GregorianCalendar();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 aa hh시 mm분 ss초");
		String date = dateFormat.format(calendar.getTime());
		
		
		Date attendTime = (Date) dateFormat.parse(date);
		/*System.out.println(attendTime.getHours());*/
		if (attendTime.getHours() >= 9) {
			/* System.out.println("지각"); */
			work_type = "지각";
		} else {
			/* System.out.println("정상"); */
			work_type = "정상";
		}
				
		String Email = (String) request.getSession().getAttribute("email");
		System.out.println(date);
		System.out.println(work_type);
		System.out.println(Email);
		
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd-MM-yy 00:00:00");
		String onlycheckdate = dateFormat2.format(calendar.getTime());
		String alreadysaveday = service.getAttendTime(Email);
		System.out.println(onlycheckdate); // 얘는 나옴
		System.out.println(alreadysaveday);//얘 값을 못받아옴....
		
		if(!onlycheckdate.equals(alreadysaveday)){
			service.putStartTime(date,work_type,Email);
		}else{
			service.putEndTime(date,Email);//이거는 됨 아까 해봤음
			
			/*Date leaveTime = (Date) dateFormat.parse(date);
			if(leaveTime.getYear() == attendTime.getYear()){
				if(leaveTime.getMonth() == attendTime.getMonth()){
					if(leaveTime.getDay() == attendTime.getDay()){
						service.putEndTime(date,Email);
					}
				}
			}*/
			
		}
			
		
		List<WorkCommand> list = service.getWorkListNormal(Email);
		ModelAndView mav = new ModelAndView("workListNormal");
		mav.addObject("Email", list);
		 
		 

		return mav;

	}

	/*@RequestMapping(value = "/workListNormal.puzzle", method = RequestMethod.POST)
	public ModelAndView end(HttpServletRequest request) throws ParseException{
		GregorianCalendar calendar = new GregorianCalendar();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 aa hh시 mm분 ss초");
		String date = dateFormat.format(calendar.getTime());
		
		Date endTime = (Date) dateFormat.parse(date);
		
		String Email = (String) request.getSession().getAttribute("email");
		String date2 = service.getAttendTime(Email);
		Date attendTime = (Date) dateFormat.parse(date2);
		
		if(endTime.getYear()==attendTime.getYear()){
			if(endTime.getMonth()==attendTime.getMonth()){
				if(endTime.getDay()==attendTime.getDay()){
					service.putEndTime(date);
				}
			}
		}
		
		ModelAndView mav = new ModelAndView("workListNormal");
		mav.addObject("Email", list);

		return mav;

		
	}*/
	
	//휴가 등록한걸 삭제하는 곳
	@RequestMapping(value = "/vacationDelete.puzzle")
	public ModelAndView vacationDelete(@ModelAttribute("command") WorkCommand command, HttpServletRequest request) {
		
		service.putVacationDelete(command);
		
		String Email = (String) request.getSession().getAttribute("email");
		List<WorkCommand> list = service.getVacationDelete(Email);
		ModelAndView mav = new ModelAndView("vacationDelete");
		mav.addObject("Email", list);
		
		System.out.println(Email);
		System.out.println(list);
		
		return mav;
	}
	
	
	
	
}
