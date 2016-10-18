package controller.docubox;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.DocuBoxCommand;
import mybatis.DocuBoxDAO;

@Component
public class DocuBoxService {
	
	@Autowired
	private DocuBoxDAO dao;

	public void setDao(DocuBoxDAO dao) {
		this.dao = dao;
	}
	
	public List<DocuBoxCommand> getlist(DocuBoxCommand docuCommand,int startpage,int endpage){
		List<DocuBoxCommand> list = null;
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("reciver", docuCommand);
		map.put("start",startpage);
		map.put("end",endpage);
		try{
			list = dao.selectList(map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}

	
	public int getTotalCount(int num){
		int count = 0;
		try {
			count = dao.getTotalCount(num);
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return count;
	}
	
}
