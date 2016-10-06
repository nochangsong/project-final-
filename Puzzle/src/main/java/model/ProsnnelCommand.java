package model;

import java.sql.Date;

public class ProsnnelCommand {

	private String Name;
	private int Age;
	private String Email;
	private int phoneNum;
	private String Position_Name;
	private Date HireDate;
	private Date RetireDate;
	private String Work_Type;
	private String Dept_Type;
	
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(int phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getPosition_Name() {
		return Position_Name;
	}
	public void setPosition_Name(String position_Name) {
		Position_Name = position_Name;
	}
	public Date getHireDate() {
		return HireDate;
	}
	public void setHireDate(Date hireDate) {
		HireDate = hireDate;
	}
	public Date getRetireDate() {
		return RetireDate;
	}
	public void setRetireDate(Date retireDate) {
		RetireDate = retireDate;
	}
	public String getWork_Type() {
		return Work_Type;
	}
	public void setWork_Type(String work_Type) {
		Work_Type = work_Type;
	}
	public String getDept_Type() {
		return Dept_Type;
	}
	public void setDept_Type(String dept_Type) {
		Dept_Type = dept_Type;
	}
	
}
