package model;

import java.sql.Date;

public class WorkCommand {
	 private int work_Num;
	 private Date startTime;
	 private Date endTime;
	 private String work_type;
	 private String email;
	 private String dept_Type;
	 private String positionType;
	 private String name;
	public int getWork_Num() {
		return work_Num;
	}
	public void setWork_Num(int work_Num) {
		this.work_Num = work_Num;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDept_Type() {
		return dept_Type;
	}
	public void setDept_Type(String dept_Type) {
		this.dept_Type = dept_Type;
	}
	public String getPositionType() {
		return positionType;
	}
	public void setPositionType(String positionType) {
		this.positionType = positionType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}    
	 
	

}
