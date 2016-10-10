package controller.work;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.WorkCommand;
import mybatis.WorkDAO;

@Component
public class WorkService {
	@Autowired
	   private WorkDAO dao;

	   public void setDao(WorkDAO dao) {
	      this.dao = dao;
	   }
	   public List<WorkCommand> getWorkList(String name){
	      List<WorkCommand> list = null;
	      System.out.println("¼­ºñ½º");
	      try{
	         list = dao.selectWorkList(name);
	      }catch(Exception e){
	         System.out.println(e.toString());
	      }
	      
	      return list;
	      
	   }

}
