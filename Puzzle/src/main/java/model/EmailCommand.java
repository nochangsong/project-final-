package model;

public class EmailCommand {
	

	private String Email;
	private String Name;
	private int Age;
	private String HireDate;
	private String RetireDate;
	private String RetireType; 
	private int Dept_Num;
	private int Work_Num;
	private int Position_Num;
	private int PhoneNum;
	private String authority;
	private String subject;
	private String content;
	private String reciver;
	
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
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
	public String getHireDate() {
		return HireDate;
	}
	public void setHireDate(String hireDate) {
		HireDate = hireDate;
	}
	public String getRetireDate() {
		return RetireDate;
	}
	public void setRetireDate(String retireDate) {
		RetireDate = retireDate;
	}
	public String getRetireType() {
		return RetireType;
	}
	public void setRetireType(String retireType) {
		RetireType = retireType;
	}
	public int getDept_Num() {
		return Dept_Num;
	}
	public void setDept_Num(int dept_Num) {
		Dept_Num = dept_Num;
	}
	public int getWork_Num() {
		return Work_Num;
	}
	public void setWork_Num(int work_Num) {
		Work_Num = work_Num;
	}
	public int getPosition_Num() {
		return Position_Num;
	}
	public void setPosition_Num(int position_Num) {
		Position_Num = position_Num;
	}
	public int getPhoneNum() {
		return PhoneNum;
	}
	public void setPhoneNum(int phoneNum) {
		PhoneNum = phoneNum;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReciver() {
		return reciver;
	}
	public void setReciver(String reciver) {
		this.reciver = reciver;
	}
	
	
}
