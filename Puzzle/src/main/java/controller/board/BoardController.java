package controller.board;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.BoardCommand;
import controller.board.BoardService;
import controller.board.PagingUtil;
import controller.board.BoardValidator;

@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	private int pageSize = 10;
	private int pageCount = 10;
	
	//�۸��
	@Resource(name="boardService")
	BoardService boardService;	

	@RequestMapping("/board/boardList.puzzle")
	public String process(@RequestParam(value="pageNum",defaultValue="1")int currentPage,
								@RequestParam(value="keyField",defaultValue="")String keyField,
								@RequestParam(value="keyWord",defaultValue="")String keyWord, 
								@RequestParam(value="DEPT_NUM",defaultValue="")String DEPT_NUM,
								ModelMap mav ,HttpServletRequest res){
		
		
		/*HttpSession session = res.getSession();
		session.setAttribute("name", "���п�");*/
		
		/*HttpSession session = res.getSession();
		BoardCommand boardDto = (BoardCommand)session.getAttribute("����ڷα�������");*/
		//�������� ����������������ͼ� ���߿� �μ������������� 
		//�Խ��ǳ�������ȸ�� �� �μ������� WHERE �������� �߰��Ͽ� �μ��Խ��Ǹ� �����´�.
		//boardDto.get�μ�() -> SQL(DAO) �Ķ���Ϳ� �߰�
		
		String pagingHtml = "";
		
		if(log.isDebugEnabled()){
			log.debug("currentPage : "+currentPage);
			log.debug("keyField : "+keyField);
			log.debug("keyWord : "+keyWord);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);
		map.put("DEPT_NUM", DEPT_NUM);
		
		//�ѱ��� ���� �Ǵ� �˻��� ���� ����
		int count = boardService.getRowCount(map);
		System.out.println("ī��Ʈ Ȯ��~!");
		//����¡ ó��
		PagingUtil pagingutil = new PagingUtil(keyField, keyWord, 
								currentPage, count, pageSize, pageCount,"boardList.puzzle");
		
		pagingHtml = pagingutil.getPagingHtml().toString();
		map.put("start", pagingutil.getStartCount());
		map.put("end", pagingutil.getEndCount());
		
		List<BoardCommand> list = new ArrayList<>();
		
		if(count > 0){
		list = boardService.list(map);
		}else{
			list = Collections.emptyList();
		}
		System.out.println("list"+list);
		System.out.println("����¡ Ȯ��~!");
		//�� ��Ͽ� ǥ���� ����
		int number = count - (currentPage - 1) * pageSize;
		System.out.println("�� ��ȣ Ȯ��~!");

		for(BoardCommand test : list){
			
		}
		
		mav.addAttribute("test", "test");
		mav.addAttribute("count", count);
		mav.addAttribute("list", list);
		mav.addAttribute("DEPT_NUM", DEPT_NUM);
		mav.addAttribute("pagingHtml", pagingHtml);
		mav.addAttribute("number", number);
		mav.addAttribute("currentPage", currentPage);
		
		return "boardList";
	}
	//�۾���
	@ModelAttribute("command")
	public BoardCommand initCommand(){
		return new BoardCommand();
	}
	
	@RequestMapping(value="/board/write.puzzle")
	public String insert(@ModelAttribute("command")BoardCommand boardCommand,
			BindingResult result){
		
		/*new BoardValidator().validate(boardCommand, result);*/
		
		/*try{
			if(result.hasErrors()){
					System.out.println("üũ ���� �����˻�");
					return "boardWrite1";
			}
			System.out.println(boardCommand.toString());
			boardService.insert(boardCommand);
		}catch(Exception e){
			e.printStackTrace();
		}*/
		boardService.insert(boardCommand);
		return "redirectList";
	}
	
	@RequestMapping(value="/board/write1.puzzle")
	public String write(@ModelAttribute("command")BoardCommand boardCommand,
			BindingResult result){		
		return "boardWrite1";
	}
	
	//�ۺ���
	@RequestMapping("/board/view.puzzle")
    public ModelAndView process(@ModelAttribute("command")BoardCommand boardCommand){
        if(log.isDebugEnabled()){
            log.debug("boardCommand : " + boardCommand);
        }BoardCommand board = new BoardCommand();
        
        List<BoardCommand> comment = new ArrayList<>();
        
        comment = boardService.listComment(boardCommand);
        
        int count = boardService.getCommentCount(boardCommand);
        System.out.println("COMcount::"+count);
        
        int cnum = count + 1; 
        System.out.println("cnum::"+cnum);
        board = boardService.selectBoard(boardCommand);
        System.out.println("board : " + board);
        System.out.println("comment : " + comment);
        
        ModelAndView mav = new ModelAndView("boardView");
        mav.addObject("commentList", comment);
        mav.addObject("count", count);
        mav.addObject("board", board);
        mav.addObject("cnum", cnum);
        mav.addObject("B_CONTENT", board.getB_CONTENT().replace("\r\n", "<br>"));
        return mav;
    }
	
	//�ۼ���
/*	@RequestMapping(value="/board/update.do",method=RequestMethod.GET)
    public ModelAndView update(@RequestParam("BNO")int BNO){
        BoardCommand boardCommand = boarddao.selectBoard(BNO);
        return new ModelAndView("command", boardCommand);
    }*/
    
    @RequestMapping(value="/board/update.puzzle")    
    public String update(@ModelAttribute("command")BoardCommand boardCommand,
    		BindingResult result){
        
    	/*new BoardValidator().validate(boardCommand, result);
        
    	try{
			if(result.hasErrors()){
					System.out.println("üũ ���� �����˻�");
					return "boardUpdate";
			}
			System.out.println(boardCommand.toString());
			boardService.update(boardCommand);
		}catch(Exception e){
			e.printStackTrace();
		}*/
    	boardService.update(boardCommand);
        return "redirectList";
    }
	@RequestMapping(value="/board/update1.puzzle")
	public ModelAndView update1(@ModelAttribute("command")BoardCommand boardCommand,
			BindingResult result){
		if(log.isDebugEnabled()){
            log.debug("boardCommand : " + boardCommand);
        }
		BoardCommand board = new BoardCommand();
        board = boardService.selectBoard(boardCommand);
        System.out.println("board : " + board);
        ModelAndView mav = new ModelAndView("boardUpdate1");
        mav.addObject("board", board);
        mav.addObject("CONTENT", board.getB_CONTENT());
        System.out.println("mav::"+mav.addObject("B_CONTENT", board.getB_CONTENT()));
        return mav;
	}
    
    //�ۻ���
    @RequestMapping(value="/board/delete.puzzle")
    public String delete(@ModelAttribute("command")BoardCommand boardCommand,
                   BindingResult result){
       
       new BoardValidator().validate(boardCommand, result);

       boardService.delete(boardCommand);
       
       return "redirectList";
    }
    @RequestMapping(value="/board/delete1.puzzle")
    public String delete1(@ModelAttribute("command")BoardCommand boardCommand,
                   BindingResult result){
       return "boardDelete";
    }
    //��ۻ���
    @RequestMapping(value="/board/deleteComment.puzzle")
    public ModelAndView deleteComment(@ModelAttribute("command")BoardCommand boardCommand,
                   BindingResult result){
    	boardService.deleteComment(boardCommand);
       return new ModelAndView("redirect:view.puzzle?BNO="+boardCommand.getBNO());
    }
    @RequestMapping(value="/board/deleteComment1.puzzle")
    public String deleteComment1(@ModelAttribute("command")BoardCommand boardCommand,
                   BindingResult result){
       return "CommentDelete";
    }
    //����Է�
    @RequestMapping(value="/board/writeComment.puzzle")
	public ModelAndView insertComment(@ModelAttribute("command")BoardCommand boardCommand,
			BindingResult result){
		 System.out.println("����μ�Ʈ::"+boardCommand);
		try{ 
			System.out.println("����Է�::"+boardCommand.toString());
			boardService.insertComment(boardCommand);
		}catch(Exception e){
			e.printStackTrace();
		}
				
		return new ModelAndView("redirect:view.puzzle?BNO="+boardCommand.getBNO());
	}
    
}
