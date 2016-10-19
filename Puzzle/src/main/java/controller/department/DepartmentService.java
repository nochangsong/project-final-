package controller.department;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.DepartmentDAO;
import java.util.List;
import model.DepartMentCommand;
import model.PersonnelCommand;
import model.listCommand;



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

   public List<PersonnelCommand> memAll() {
	      List<PersonnelCommand> list = null;
	      try{
	         list = dao.memAll();
	      }catch(Exception e){
	    	  System.out.println(e.toString());
	      }
	         return list;
	   }
   
   public List<String> selectdept(){
	   List<String> list = null;
	   try{
		   list = dao.selectdept();
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
   
   public List<listCommand> selectAll(){
	   List<listCommand> list = null;
	   try{
		   list = dao.listAll();
/*		   System.out.println("service "+list.size());
		   for(listCommand lis:list){
				System.out.println("ser"+lis.getName());
		   }*/
	   }catch (Exception e) {
		  System.out.println(e.toString());
	   }
	   
	   return list;
   }
   
   public List<PersonnelCommand> workAll(){
	   List<PersonnelCommand> list = null;
	   try{
		   list = dao.workAll();
	   }catch (Exception e) {
		  System.out.println(e.toString());
	   }
	   
	   return list;
   }
   
   public List<PersonnelCommand> timeoffAll(){
	   List<PersonnelCommand> list = null;
	   try{
		   list = dao.timeoffAll();
	   }catch (Exception e) {
		  System.out.println(e.toString());
	   }
	   
	   return list;
   }
   
   public List<PersonnelCommand> resignAll(){
	   List<PersonnelCommand> list = null;
	   try{
		   list = dao.resignAll();
	   }catch (Exception e) {
		  System.out.println(e.toString());
	   }
	   
	   return list;
   }
   
   public List<listCommand> memList(listCommand command){
	   List<listCommand> list = null;
	   try{
		   list = dao.detpTypeList(command);

	   }catch(Exception e){
		   System.out.println(e.toString());
	   }
	   return list;
   }
   public List<listCommand> deptTypeint(listCommand command){
	   List<listCommand> list = null;
	   try{
		   list = dao.deptTypeint(command);
	   }catch(Exception e){
		   System.out.println(e.toString());
	   }
	   
	   return list;
	   
   }
   public int getTotalCount(){
		int count = 0;
		try {
			count = dao.getTotalCount();
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return count;
	}
	
   public List<listCommand> searchMem(String search) {
	   List<listCommand> list = null;
	   try {
		   list = dao.searchMem(search);
	   } catch(Exception e){
		   System.out.println(e.toString());
	   }
	   
	   return list;
   }
   
}


