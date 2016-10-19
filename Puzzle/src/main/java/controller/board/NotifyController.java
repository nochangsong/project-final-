package controller.board;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.BoardCommand;

@Controller
public class NotifyController {
	private Logger log = Logger.getLogger(this.getClass());
	private int pageSize = 10;
	private int pageCount = 10;
	
	//글목록
	@Resource(name="boardService")
	BoardService boardService;	

	@RequestMapping("/notify/notifyList.puzzle")
	public String process(@RequestParam(value="pageNum",defaultValue="1")int currentPage,
								@RequestParam(value="keyField",defaultValue="")String keyField,
								@RequestParam(value="keyWord",defaultValue="")String keyWord,
								ModelMap mav ,HttpServletRequest res){

		String pagingHtml = "";
		
		if(log.isDebugEnabled()){
			log.debug("currentPage : "+currentPage);
			log.debug("keyField : "+keyField);
			log.debug("keyWord : "+keyWord);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);
		
		//총글의 갯수 또는 검색된 글의 갯수
		int count = boardService.getNotifyCount(map);
		System.out.println("카운트 확인~!");
		//페이징 처리
		PagingUtil pagingutil = new PagingUtil(keyField, keyWord, 
								currentPage, count, pageSize, pageCount,"boardList.puzzle");
		
		pagingHtml = pagingutil.getPagingHtml().toString();
		map.put("start", pagingutil.getStartCount());
		map.put("end", pagingutil.getEndCount());
		
		List<BoardCommand> list = new ArrayList<>();
		
		if(count > 0){
		list = boardService.listNotify(map);
		}else{
			list = Collections.emptyList();
		}
		System.out.println("list"+list);
		System.out.println("페이징 확인~!");
		//글 목록에 표시할 연번
		int number = count - (currentPage - 1) * pageSize;
		System.out.println("열 번호 확인~!");

		for(BoardCommand test : list){
			
		}
		
		mav.addAttribute("test", "test");
		mav.addAttribute("count", count);
		mav.addAttribute("list", list);
		mav.addAttribute("pagingHtml", pagingHtml);
		mav.addAttribute("number", number);
		mav.addAttribute("currentPage", currentPage);
		
		return "notifyList";
	}
	//글쓰기
	@ModelAttribute("command")
	public BoardCommand initCommand(){
		return new BoardCommand();
	}
	
	@RequestMapping(value="/notify/notifywrite.puzzle")
	public String insert(@ModelAttribute("command")BoardCommand boardCommand,
			BindingResult result){
		System.out.println("공지사항 글쓰기로 넘어는 왔니?");
		boardService.insertNotify(boardCommand);
		return "redirectNotifyList";
	}
	
	@RequestMapping(value="/notify/notifywrite1.puzzle")
	public String write(@ModelAttribute("command")BoardCommand boardCommand,
			BindingResult result){		
		return "notifyWrite1";
	}
	
	//글보기
	@RequestMapping("/notify/notifyview.puzzle")
    public ModelAndView process(@ModelAttribute("command")BoardCommand boardCommand){
        if(log.isDebugEnabled()){
            log.debug("boardCommand : " + boardCommand);
        }
        BoardCommand board = new BoardCommand();
        
        board = boardService.selectNotify(boardCommand);
        System.out.println("board : " + board);
        
        ModelAndView mav = new ModelAndView("notifyView");
        mav.addObject("board", board);
        mav.addObject("N_CONTENT", board.getN_CONTENT().replace("\r\n", "<br>"));
        return mav;
    }
	
	//글수정
    @RequestMapping(value="/notify/notifyupdate.puzzle")    
    public String update(@ModelAttribute("command")BoardCommand boardCommand,
    		BindingResult result){
        System.out.println("업데이트로 넘어 오니?");
    	boardService.updateNotify(boardCommand);
        return "redirectNotifyList";
    }
	@RequestMapping(value="/notify/notifyupdate1.puzzle")
	public ModelAndView update1(@ModelAttribute("command")BoardCommand boardCommand,
			BindingResult result){
		if(log.isDebugEnabled()){
            log.debug("boardCommand : " + boardCommand);
        }
		BoardCommand board = new BoardCommand();
        board = boardService.selectNotify(boardCommand);
        System.out.println("board : " + board);
        ModelAndView mav = new ModelAndView("notifyUpdate1");
        mav.addObject("board", board);
        mav.addObject("CONTENT", board.getN_CONTENT());
        System.out.println("mav::"+mav.addObject("N_CONTENT", board.getN_CONTENT()));
        return mav;
	}
    
    //글삭제
    @RequestMapping(value="/notify/notifydelete.puzzle")
    public String delete(@ModelAttribute("command")BoardCommand boardCommand,
                   BindingResult result){
       
       new BoardValidator().validate(boardCommand, result);

       boardService.deleteNotify(boardCommand);
       
       return "redirectNotifyList";
    }
    @RequestMapping(value="/notify/notifydelete1.puzzle")
    public String delete1(@ModelAttribute("command")BoardCommand boardCommand,
                   BindingResult result){
       return "notifyDelete";
    }
}
