package controller.Personnel;


import java.util.Properties;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class SendEamil {

	public void sendCode(String Email, String key) throws MessagingException{
        // ���� ���� ����
        String host = "smtp.gmail.com"; /*�̸��� ����*/
        String user = "welcome.pis5@gmail.com"; /*�̸��� ����*/
        String password = "123456789!@"; /*�̸��� ���� ���*/
        String subject = null;
        String code = null;	
        String content = null;
        String url = null;
        
        // ���� ����
        String recipient = Email;
       
           subject = "Puzzle����"; /*�̸����� ����*/
           code = key; //Ű���� Ű �Ķ���Ϳ� �Է�
           url = "http://localhost:8089/Puzzle/PersonnelView/CertifyCheck.puzzle";
           content = "�� �ּҸ� Ŭ���Ͻø� ȸ�������� �Ϸ�˴ϴ�."; /*������ �޼���*/
       
       /* if (state == 2) {
           subject = "U-ding �����ȣ ��߱� �ȳ�"; �̸����� ����
           code = "http://localhost:8088/FORKI/content/join/UserFindPW.do?key=" + key; Ű���� Ű �Ķ���Ϳ� �Է�
           content = "�� �ּҸ� Ŭ���Ͻø� ��й�ȣ�� �缳�� �Ͻ� �� �ֽ��ϴ�."; ������ �޼���
       }
        */
        //properties ���� 
        Properties props = new Properties();
        props.put("mail.smtps.auth", "true");
        
        // ���� ����
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session); /*������ ������ ���� MimeMessageŸ�� ���� ����*/
 
        // ���� ����
        msg.setSubject(subject); /*�̸��� ���� ����*/
        msg.setText(code + "\n" + url + "\n" + content); /*�̸��� ���� ���� :: Ű���� ���Ե� ���� �ּҿ� �޼��� ����*/
        msg.setFrom(new InternetAddress(user)); /*������� �̸��� �ּ� ����*/
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); /*�޴»�� �ּҸ� �߰�*/
 
        // �߼� ó��
        Transport transport = session.getTransport("smtps");
        transport.connect(host, user, password);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();     
    }
}
