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

	@ModelAttribute("command") // �ð��� WorkCommand�� ������ �κ�
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	public WorkCommand getCommand() {
		return new WorkCommand();
	}

	@RequestMapping(value = "/workList.puzzle", method = RequestMethod.GET) // workListâ��
																			// ����
																			// �κ�
	public String work() {
		System.out.println("����");
		return "workList";
	}

	@RequestMapping(value = "/workList.puzzle", method = RequestMethod.POST) // �̸�����
	public ModelAndView find_absent(String Name, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=UTF-8");
		List<WorkCommand> list = service.getWorkList(Name);
		ModelAndView mav = new ModelAndView("workList");
		mav.addObject("Name", list);
		return mav;
	}

	// �ް� ��� �������� �̵�
	@RequestMapping(value = "/vacation.puzzle", method = RequestMethod.GET)
	public String vacation() {
		System.out.println("����");
		return "vacation";
	}
	
	

	// �ް� ��� ���������� �ް� ����ϴ� ��
	@RequestMapping(value = "/vacation.puzzle", method = RequestMethod.POST)
	public String vacation_register(@ModelAttribute("command") WorkCommand command,HttpServletRequest request) throws Exception {
		String Email = (String) request.getSession().getAttribute("email");
		command.setEmail(Email);
		service.setVacation(command);
		System.out.println("��");
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
	 * if(sysdate = null){ WorkCommand Work_type = "�Ἦ"; }else{ if(sysdate <=
	 * 09:00:00){ WorkCommand Work_type = "����"; }else{ WorkCommand Work_type =
	 * "����"; } }
	 * 
	 * return new WorkCommand(); }
	 */

	/* @ModelAttribute("start") */
	//����� �ð� ����ϴ� �κ�
	@DateTimeFormat(pattern = "yy-mm-dd")
	@RequestMapping(value = "/workListNormal.puzzle", method = RequestMethod.POST)
	public ModelAndView start(HttpServletRequest request) throws ParseException {
		String work_type = null;
		GregorianCalendar calendar = new GregorianCalendar();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy�� MM�� dd�� aa hh�� mm�� ss��");
		String date = dateFormat.format(calendar.getTime());
		
		
		Date attendTime = (Date) dateFormat.parse(date);
		/*System.out.println(attendTime.getHours());*/
		if (attendTime.getHours() >= 9) {
			/* System.out.println("����"); */
			work_type = "����";
		} else {
			/* System.out.println("����"); */
			work_type = "����";
		}
				
		String Email = (String) request.getSession().getAttribute("email");
		System.out.println(date);
		System.out.println(work_type);
		System.out.println(Email);
		
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd-MM-yy 00:00:00");
		String onlycheckdate = dateFormat2.format(calendar.getTime());
		String alreadysaveday = service.getAttendTime(Email);
		System.out.println(onlycheckdate); // ��� ����
		System.out.println(alreadysaveday);//�� ���� ���޾ƿ�....
		
		if(!onlycheckdate.equals(alreadysaveday)){
			service.putStartTime(date,work_type,Email);
		}else{
			service.putEndTime(date,Email);//�̰Ŵ� �� �Ʊ� �غ���
			
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
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy�� MM�� dd�� aa hh�� mm�� ss��");
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
	
	//�ް� ����Ѱ� �����ϴ� ��
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
