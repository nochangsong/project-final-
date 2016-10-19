package model;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class CompanyCommand {

	private int no;
	private String com_name;
	private String com_logo_subject;
	private MultipartFile com_logo;
	private byte[] com_logo_bytes;
	private String com_ceo;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_logo_subject() {
		return com_logo_subject;
	}
	public void setCom_logo_subject(String com_logo_subject) {
		this.com_logo_subject = com_logo_subject;
	}
	public MultipartFile getCom_logo() {
		return com_logo;
	}
	public void setCom_logo(MultipartFile com_logo) {
		this.com_logo = com_logo;
	}
	public byte[] getCom_logo_bytes() {
		return com_logo_bytes;
	}
	public void setCom_logo_bytes(byte[] com_logo_bytes) {
		this.com_logo_bytes = com_logo_bytes;
	}
	public String getCom_ceo() {
		return com_ceo;
	}
	public void setCom_ceo(String com_ceo) {
		this.com_ceo = com_ceo;
	}
}
