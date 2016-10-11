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
        // 메일 관련 정보
        String host = "smtp.gmail.com"; /*이메일 서버*/
        String user = "welcome.pis5@gmail.com"; /*이메일 계정*/
        String password = "123456789!@"; /*이메일 계정 비번*/
        String subject = null;
        String code = null;	
        String content = null;
        String url = null;
        
        // 메일 내용
        String recipient = Email;
       
           subject = "Puzzle가입"; /*이메일의 제목*/
           code = key; //키값을 키 파라메터에 입력
           url = "http://localhost:8089/Puzzle/PersonnelView/CertifyCheck.puzzle";
           content = "위 주소를 클릭하시면 회원가입이 완료됩니다."; /*전송할 메세지*/
       
       /* if (state == 2) {
           subject = "U-ding 비밀전호 재발급 안내"; 이메일의 제목
           code = "http://localhost:8088/FORKI/content/join/UserFindPW.do?key=" + key; 키값을 키 파라메터에 입력
           content = "위 주소를 클릭하시면 비밀번호를 재설정 하실 수 있습니다."; 전송할 메세지
       }
        */
        //properties 설정 
        Properties props = new Properties();
        props.put("mail.smtps.auth", "true");
        
        // 메일 세션
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session); /*전송할 내용을 담을 MimeMessage타입 변수 생성*/
 
        // 메일 관련
        msg.setSubject(subject); /*이메일 제목 세팅*/
        msg.setText(code + "\n" + url + "\n" + content); /*이메일 내용 세팅 :: 키값이 포함된 인증 주소와 메세지 새팅*/
        msg.setFrom(new InternetAddress(user)); /*보낸사람 이메일 주소 세팅*/
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); /*받는사람 주소를 추가*/
 
        // 발송 처리
        Transport transport = session.getTransport("smtps");
        transport.connect(host, user, password);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();     
    }
}
