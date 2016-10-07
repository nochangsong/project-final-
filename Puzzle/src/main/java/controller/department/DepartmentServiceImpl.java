package controller.department;

import org.springframework.beans.factory.annotation.Autowired;

import mybatis.DepartmentDAO;
import java.util.List;
import model.DepartMentCommand;
import model.PositionCommand;



public class DepartmentServiceImpl implements DepartmentService{

   @Autowired
   private DepartmentDAO dao;

   public void setDao(DepartmentDAO dao) {
      this.dao = dao;
   }
   

   @Override
   public List<DepartMentCommand> listdept() {
      List<DepartMentCommand> list = null;
      
         list = dao.getListData("dept.listdept");
         return list;
   }
   
   public String deptnum(){
      String dept_Num = null;      
      dept_Num = dao.selectdeptNum("dept.deptnum");
      return dept_Num;
   }
   
   
   
   public int insertDeptType(DepartMentCommand com){
      int n = 0;
      try{
         n = dao.insertDeptType(com);
      }catch(Exception e){
         System.out.println(e.toString());
      }
      
      return n;
   }
   
   public int updateDeptType(DepartMentCommand com) {
      int n = 0;
      try {
         n = dao.updateDeptType(com);
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return n;
   }
   
   public void deleteDeptType(int dept_Num) {
      try {
         dao.deleteDeptType(dept_Num);
      } catch (Exception e) {
         System.out.println(e.toString());
      }
   }
}


