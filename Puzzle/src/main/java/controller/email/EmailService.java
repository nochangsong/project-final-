package controller.email;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.EmailCommand;
import mybatis.EmailDAO;


@Component
public class EmailService { 
	
	@Autowired
	private EmailDAO dao; 
	
	public void setDAO(EmailDAO dao){
		this.dao = dao;
	}
	
	public int insertCard(EmailCommand EmCommand){
		int Card= 0;
		
		System.out.println("¼­ºñ½º");
		try{
			Card = dao.insertEm(EmCommand);
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return Card;
	}
	public void sendEmail(String email, String N){
	
	}
}
