package model;

public class DocuBoxCommand {
	
	private String FileName;
	private String Reg_Date;
	private String Path;
	private String writer;
	private String Confirm;
	private String Email;
	

	public String getFileName() {
		return FileName;
	}
	public void setFileName(String fileName) {
		FileName = fileName;
	}
	public String getReg_Date() {
		return Reg_Date;
	}
	public void setReg_Date(String reg_Date) {
		Reg_Date = reg_Date;
	}
	public String getPath() {
		return Path;
	}
	public void setPath(String path) {
		Path = path;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getConfirm() {
		return Confirm;
	}
	public void setConfirm(String confirm) {
		Confirm = confirm;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}

}
