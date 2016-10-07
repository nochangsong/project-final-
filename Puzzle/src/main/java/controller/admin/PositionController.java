package controller.admin;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.PositionCommand;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin")
public class PositionController {

	@Autowired
	private PositionService service;
	public void setService(PositionService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/position/positionList.puzzle", method=RequestMethod.GET)
	public String position() throws Exception{
		return "positionList";
	}
	
	@RequestMapping(value= "/position/positionList.puzzle", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getList(HttpServletResponse resp, String type, String position_num, String positionType) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		if(type!=null){
			PositionCommand position = new PositionCommand();
			if(type.equals("insert")){
				position.setPositionType(positionType);
				service.insertPosition(position);
			}else if(type.equals("update")){
				position.setPosition_num(Integer.parseInt(position_num));
				position.setPositionType(positionType);
				service.updatePosition(position);
			}else if(type.equals("delete")){
				service.deletePosition(Integer.parseInt(position_num));
			}
		}
		List<PositionCommand> list = service.getPositionList();
		for(int i=0; i<list.size(); i++){
			list.get(i).setPositionType(URLEncoder.encode(list.get(i).getPositionType(),"UTF-8"));
		}
		JSONObject json = new JSONObject();
		json.put("list", list);
		return json.toString();
	}

}
