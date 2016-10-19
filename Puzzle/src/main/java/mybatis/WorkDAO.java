package mybatis;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.WorkCommand;

public class WorkDAO extends SqlSessionDaoSupport{
	
	//이름 입력해서 근태 목록 나타내기
	public List<WorkCommand> selectWorkList(String name){
	      return getSqlSession().selectList("work.dataSearch",name);
	   }
	
	//휴가, 병가등을 데이터베이스에 등록하기
	public int insertVacation(WorkCommand command){
		return getSqlSession().insert("work.insertWork",command);
	}
	
	//일반 사용자가 자신의 근태 현황을 보는 부분
	public List<WorkCommand> selectWorkListNormal(String Email){
	    return getSqlSession().selectList("work.dataList",Email);
	}
	
	//사용자의 출근시간을 데이터베이스에 등록한다.
	public int insertStartTime(WorkCommand command){
		return getSqlSession().insert("work.insertStartTime",command);
	}
	
	//사용자의 퇴근시간을 데이터베이스에 등록한다.
	public int updateEndTime(WorkCommand command){
		return getSqlSession().update("work.updateEndTime",command);
	}
	
	//출근시간입력하기 위해 출근시간이 비었는지 확인한다.
	public String selectAttendTime(String Email){
		return getSqlSession().selectOne("work.selectStartTime",Email);
		
	}
	//일반 사용자가 자신의 휴가를 삭제하기 위해 휴가목록을 보는 부분
	public List<WorkCommand> selectVacation(String Email){
	    return getSqlSession().selectList("work.selectVacation",Email);
	}
	//등록한 휴가중 삭제를 하는 부분
	public int deleteVacation(WorkCommand command){
		return getSqlSession().delete("work.deleteVacation");
	}
		
}
