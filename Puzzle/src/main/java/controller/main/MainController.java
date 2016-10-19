package controller.main;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import controller.board.PagingUtil;
import model.BoardCommand;
import model.DepartMentCommand;

@Controller
@RequestMapping("/main")
public class MainController {

//	@Autowired
//	private DepartMentCommand com;
//	public void setCom(DepartMentCommand com) {
//		this.com = com;
//	}
//	

	@ModelAttribute("com")
	public DepartMentCommand formBacking(){
	     return new DepartMentCommand();
	}
	   
	public MainController() {
			// TODO Auto-generated constructor stub
		}

/*	@RequestMapping("main.puzzle")
	public String main(){
		return "main";
	}*/
	
	private Logger log = Logger.getLogger(this.getClass());
	private int pageSize = 10;
	private int pageCount = 10;
	
	//�۸��
	@Resource(name="MainService")
	MainService MainService;	

	@RequestMapping("/main.puzzle")
	public String process(@RequestParam(value="pageNum",defaultValue="1")int currentPage, 
								@RequestParam(value="DEPT_NUM",defaultValue="")String DEPT_NUM,
								ModelMap mav ,HttpServletRequest res){

		HttpSession session = res.getSession();
		String email = (String)session.getAttribute("email");
		System.out.println("���� �̸���::"+email);
		//�������� ����������������ͼ� ���߿� �μ������������� 
		//�Խ��ǳ�������ȸ�� �� �μ������� WHERE �������� �߰��Ͽ� �μ��Խ��Ǹ� �����´�.
		//boardDto.get�μ�() -> SQL(DAO) �Ķ���Ϳ� �߰�
		BoardCommand item = MainService.session(email);
		//��������
		session.setAttribute("email", item.getEMAIL());
		session.setAttribute("dept_num", item.getDEPT_NUM());
		session.setAttribute("name", item.getNAME());
		session.setAttribute("position_num", item.getPOSITION_NUM());
		System.out.println("�����̸���"+item.getEMAIL());
		System.out.println("���Ǻμ���ȣ"+item.getDEPT_NUM());
		System.out.println("�����̸�"+item.getNAME());
		System.out.println("�������޹�ȣ"+item.getPOSITION_NUM());
		
		String pagingHtml = "";
		
		if(log.isDebugEnabled()){
			log.debug("currentPage : "+currentPage);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("DEPT_NUM", DEPT_NUM);
		
		//�ѱ��� ���� �Ǵ� �˻��� ���� ����
		int count = MainService.getRowCount(map);
		int count2 = MainService.getRowCount2(map);
		int count3 = MainService.getRowCount3(map);
		int notifycount = MainService.getNotifyCount(map);
		System.out.println("ī��Ʈ Ȯ��~!");
		//����¡ ó��
		PagingUtil pagingutil = new PagingUtil(currentPage, count, pageSize, pageCount,"main.puzzle");
		
		pagingHtml = pagingutil.getPagingHtml().toString();
		map.put("start", pagingutil.getStartCount());
		map.put("end", pagingutil.getEndCount());
		
		List<BoardCommand> list = new ArrayList<>();
		List<BoardCommand> list2 = new ArrayList<>();
		List<BoardCommand> list3 = new ArrayList<>();
		List<BoardCommand> notifylist = new ArrayList<>();
		
		if(count > 0){
		list = MainService.list(map);
		}else{
			list = Collections.emptyList();
		}
		if(count2 > 0){
		list2 = MainService.list2(map);
		}else{
			list2 = Collections.emptyList();
		}
		if(count3 > 0){
		list3 = MainService.list3(map);
		}else{
			list3 = Collections.emptyList();
		}
		if(notifycount > 0){
		notifylist = MainService.listNotify(map);
		}else{
			notifylist = Collections.emptyList();
		}
		
		System.out.println("list"+list);
		System.out.println("����¡ Ȯ��~!");
		//�� ��Ͽ� ǥ���� ����
		int number = count - (currentPage - 1) * pageSize;
		System.out.println("�� ��ȣ Ȯ��~!");

		for(BoardCommand test : list){}
		
		mav.addAttribute("test", "test");
		mav.addAttribute("count", count);
		mav.addAttribute("count2", count2);
		mav.addAttribute("count3", count3);
		mav.addAttribute("notifycount", notifycount);
		mav.addAttribute("list", list);
		mav.addAttribute("list2", list2);
		mav.addAttribute("list3", list3);
		mav.addAttribute("notifylist", notifylist);
		mav.addAttribute("DEPT_NUM", DEPT_NUM);
		mav.addAttribute("pagingHtml", pagingHtml);
		mav.addAttribute("number", number);
		mav.addAttribute("currentPage", currentPage);
		
		return "main";
	}
	

	@RequestMapping("/admin.puzzle")
	public String adminlogin(){
		
		return "admin";
	}
	
	@RequestMapping("/user.puzzle")
	public String userlogin(){
		return "user";
	}
}
