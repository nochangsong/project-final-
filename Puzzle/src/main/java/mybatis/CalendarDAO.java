package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.CalendarCommand;


public class CalendarDAO extends SqlSessionDaoSupport{

	public List<CalendarCommand> getSchedules(String email){
		return getSqlSession().selectList("calendar.selectSchedules", email);
	}
	
	public void insertSchedule(CalendarCommand calendarCommand){
		getSqlSession().insert("calendar.insertSchedule", calendarCommand);
	}
	
	public void modifySchedule(CalendarCommand calendarCommand){
		getSqlSession().update("calendar.modifySchedule", calendarCommand);
	}
	
	public void deleteSchedule(int no){
		getSqlSession().delete("calendar.deleteSchedule", no);
	}
}
