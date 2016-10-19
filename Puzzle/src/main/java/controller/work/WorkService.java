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
	   
	   //휴가 등록
	   public int setVacation(WorkCommand command){
		   int bo =0;
		   try{
			   bo=dao.insertVacation(command);			   
		   } catch(Exception e){
			   System.out.println(e.toString());
		   }
		   return bo;
	   }
	   
	   //근태 현황이 자동적으로 나타나는 리스트가 작동하게 하는 메서드
	   public List<WorkCommand> getWorkListNormal(String Email){
		      List<WorkCommand> list = null;
		      try{
		         list = dao.selectWorkListNormal(Email);
		      }catch(Exception e){
		         System.out.println(e.toString());
		      }
		      
		      return list;
		      
		   }
	   
	   //출근시간을 등록시켜주는 메서드
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
	   
	   //퇴근시간을 등록시켜주는 메서드
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

		//출근시간입력하기 위해 출근시간이 비었는지 확인한다.
	   public String getAttendTime(String Email){
		   String list = null;
		   try{
			   list = dao.selectAttendTime(Email);
		   }catch(Exception e){
			   System.out.println(e.toString());
		   }
		return list;
	   }
	   
	   //등록된 휴가를 삭제하기 위해 검색하는 메서드
	   public List<WorkCommand> getVacationDelete(String Email){
		      List<WorkCommand> list = null;
		      try{
		         list = dao.selectVacation(Email);
		        
		      }catch(Exception e){
		         System.out.println(e.toString());
		      }
		      
		      return list;
		      
		   }
	   
	   //등록한 휴가를 이제 삭제하는 메서드
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
