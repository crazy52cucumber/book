package member;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class MailService {
  private final String host = "smtp.naver.com";
  private final String from = "";
  private final String password = "";

  public String sendEmail(String to) throws Exception {
    String authenCode = null;

    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.port", "465");
    props.put("mail.smtp.ssl.enable", "true");
    props.put("mail.smtp.ssl.trust", host);

    Session session = Session.getDefaultInstance(props, new Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(from, password);
      }
    });
    try{
      authenCode = makeAuthenticationCode();
      Message message = new MimeMessage(session);
      message.setFrom(new InternetAddress(from,"강남땃쥐"));
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
      message.setSubject("강남땃쥐 :: 임시 비밀번호 메일입니다");
      message.setText("비밀번호 변경 인증번호는 [ "+authenCode+" ] 입니다.");
      Transport.send(message);
      System.out.println("NaverMail sent successfully");
    }catch (MessagingException e){
      e.printStackTrace();
    }
    System.out.println("NaverMailSend : sendEmail() 종료");
    return authenCode;
  }
  private String makeAuthenticationCode() throws Exception {

    int pwdLength = 8;
    final char[] pwdTable = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
        'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
        'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
        'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
        'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*',
        '(', ')', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };

    // System.currentTimeMillis(): 중복 방지 처리
    Random random = new Random(System.currentTimeMillis());

    StringBuilder sb = new StringBuilder();
    for(int i=0; i<pwdLength; i++) {
      sb.append(pwdTable[random.nextInt(pwdTable.length)]);

    }

    return sb.toString();
  }
}