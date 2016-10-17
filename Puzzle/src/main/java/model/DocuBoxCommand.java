package model;

public class DocuBoxCommand {
	
	private int Doc_Num;
	private String FileName;
	private String Reg_Date;
	private String Path;
	private String FileType;
	private String writer;
	private String Confirm;
	private String Email;
	
	public int getDoc_Num() {
		return Doc_Num;
	}
	public void setDoc_Num(int doc_Num) {
		Doc_Num = doc_Num;
	}
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
	public String getFileType() {
		return FileType;
	}
	public void setFileType(String fileType) {
		FileType = fileType;
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
