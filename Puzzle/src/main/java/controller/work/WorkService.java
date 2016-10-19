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
	      try{
	         list = dao.selectWorkList(name);
	      }catch(Exception e){
	         System.out.println(e.toString());
	      }
	      
	      return list;
	      
	   }
	   
	   //�ް� ���
	   public int setVacation(WorkCommand command){
		   int bo =0;
		   try{
			   bo=dao.insertVacation(command);			   
		   } catch(Exception e){
			   System.out.println(e.toString());
		   }
		   return bo;
	   }
	   
	   //���� ��Ȳ�� �ڵ������� ��Ÿ���� ����Ʈ�� �۵��ϰ� �ϴ� �޼���
	   public List<WorkCommand> getWorkListNormal(String Email){
		      List<WorkCommand> list = null;
		      try{
		         list = dao.selectWorkListNormal(Email);
		      }catch(Exception e){
		         System.out.println(e.toString());
		      }
		      
		      return list;
		      
		   }
	   
	   //��ٽð��� ��Ͻ����ִ� �޼���
	   public void putStartTime(String date,String work_type,String email){
		  WorkCommand wc = new WorkCommand();
		  wc.setStartTime(date);
		  wc.setDept_Type(work_type);
		  wc.setEmail(email);
		  
		   try{
			  dao.insertStartTime(wc);
		   }catch(Exception e){
			   System.out.println(e.toString());
		   }
	   }
	   
	   //��ٽð��� ��Ͻ����ִ� �޼���
	   public void putEndTime(String date, String email){
		   WorkCommand wc = new WorkCommand();
		   wc.setEndTime(date);
		   wc.setEmail(email);
		   
		   try{
			   dao.updateEndTime(wc);
		   }catch(Exception e){
			   System.out.println(e.toString());
		   }
	   }

		//��ٽð��Է��ϱ� ���� ��ٽð��� ������� Ȯ���Ѵ�.
	   public String getAttendTime(String Email){
		   String list = null;
		   try{
			   list = dao.selectAttendTime(Email);
		   }catch(Exception e){
			   System.out.println(e.toString());
		   }
		return list;
	   }
	   
	   //��ϵ� �ް��� �����ϱ� ���� �˻��ϴ� �޼���
	   public List<WorkCommand> getVacationDelete(String Email){
		      List<WorkCommand> list = null;
		      try{
		         list = dao.selectVacation(Email);
		        
		      }catch(Exception e){
		         System.out.println(e.toString());
		      }
		      
		      return list;
		      
		   }
	   
	   //����� �ް��� ���� �����ϴ� �޼���
	   public int putVacationDelete(WorkCommand command){
		   int del = 0;
		   
		   try{
			   del = dao.deleteVacation(command);
		   }catch(Exception e){
			   System.out.println(e.toString());
		   }
		   return del;
	   }
}
