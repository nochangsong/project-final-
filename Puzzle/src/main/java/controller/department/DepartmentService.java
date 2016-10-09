package controller.department;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.DepartmentDAO;
import java.util.List;
import model.DepartMentCommand;



@Component
public class DepartmentService{

   @Autowired
   private DepartmentDAO dao;

   public void setDao(DepartmentDAO dao) {
      this.dao = dao;
   }
   

   public List<DepartMentCommand> listdept() {
      List<DepartMentCommand> list = null;
      try{
         list = dao.listdept();
      }catch(Exception e){
    	  System.out.println(e.toString());
      }
         return list;
   }

   
   public void insertDeptType(DepartMentCommand command){
      try{
         dao.insertDeptType(command);
      }catch(Exception e){
         System.out.println(e.toString());
      }

   }
   
   public void updateDeptType(DepartMentCommand command) {

      try {
    	  dao.updateDeptType(command);
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      
   }
   
   public void deleteDeptType(int dept_Num) {
      try {
         dao.deleteDeptType(dept_Num);
      } catch (Exception e) {
         System.out.println(e.toString());
      }
   }
}


