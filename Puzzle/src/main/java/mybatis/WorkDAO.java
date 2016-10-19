package mybatis;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.WorkCommand;

public class WorkDAO extends SqlSessionDaoSupport{
	
	//�̸� �Է��ؼ� ���� ��� ��Ÿ����
	public List<WorkCommand> selectWorkList(String name){
	      return getSqlSession().selectList("work.dataSearch",name);
	   }
	
	//�ް�, �������� �����ͺ��̽��� ����ϱ�
	public int insertVacation(WorkCommand command){
		return getSqlSession().insert("work.insertWork",command);
	}
	
	//�Ϲ� ����ڰ� �ڽ��� ���� ��Ȳ�� ���� �κ�
	public List<WorkCommand> selectWorkListNormal(String Email){
	    return getSqlSession().selectList("work.dataList",Email);
	}
	
	//������� ��ٽð��� �����ͺ��̽��� ����Ѵ�.
	public int insertStartTime(WorkCommand command){
		return getSqlSession().insert("work.insertStartTime",command);
	}
	
	//������� ��ٽð��� �����ͺ��̽��� ����Ѵ�.
	public int updateEndTime(WorkCommand command){
		return getSqlSession().update("work.updateEndTime",command);
	}
	
	//��ٽð��Է��ϱ� ���� ��ٽð��� ������� Ȯ���Ѵ�.
	public String selectAttendTime(String Email){
		return getSqlSession().selectOne("work.selectStartTime",Email);
		
	}
	//�Ϲ� ����ڰ� �ڽ��� �ް��� �����ϱ� ���� �ް������ ���� �κ�
	public List<WorkCommand> selectVacation(String Email){
	    return getSqlSession().selectList("work.selectVacation",Email);
	}
	//����� �ް��� ������ �ϴ� �κ�
	public int deleteVacation(WorkCommand command){
		return getSqlSession().delete("work.deleteVacation");
	}
		
}
