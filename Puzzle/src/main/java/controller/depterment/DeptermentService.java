package controller.depterment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.DeptermentDAO;
import java.util.List;
import model.DepterMentCommand;


@Component
public class DeptermentService {

	@Autowired
	private DeptermentDAO dao;

	public void setDao(DeptermentDAO dao) {
		this.dao = dao;
	}
	


	public List<DepterMentCommand> DeptTypeList() {
		List<DepterMentCommand> list = null;
		try{
			list = dao.getAllDeptType();
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	public int deptnum(){
		int dept_num = 0;
		try{
			dept_num = dao.selectdeptNum();
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return dept_num;
	}
	
}
