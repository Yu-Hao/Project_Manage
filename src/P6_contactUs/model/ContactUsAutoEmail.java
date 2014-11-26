package P6_contactUs.model;

import java.sql.Timestamp;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Address;
public class ContactUsAutoEmail extends Thread {
	String contactUsName;
	String contactUsMail;
	Timestamp contactUsDate;
	String contactUsSubject;
	String contactUsContent;
	String fromuser;

	public ContactUsAutoEmail(String contactUsName, String contactUsMail,
			Timestamp contactUsDate, String contactUsSubject,
			String contactUsContent,String fromuser){
			this.contactUsName=contactUsName;
			this.contactUsMail=contactUsMail;
			this.contactUsDate=contactUsDate;
			this.contactUsSubject=contactUsSubject;
			this.contactUsContent=contactUsContent;
			this.fromuser=fromuser;
		
	}
	
	

	public void run() {
		//寄信參數準備
		int port = 587;  
        String host = "smtp.gmail.com";
        //管理員mail
        final String username = "cecj0601@gmail.com";
        final String password = "cecj06123"; 

		
        try{
        	//將Gmail的參數設定用好
	        Properties props = new Properties();  
	        props.put("mail.smtp.host", host);  
	        props.put("mail.smtp.auth", "true");  
	        props.put("mail.smtp.starttls.enable", "true");  
	        props.put("mail.smtp.port", port);  
	        props.put("mail.smtp.starttls.enable", "true");

	        
	        
	        
	        Session session = Session.getInstance(props,new Authenticator(){  
	              protected PasswordAuthentication getPasswordAuthentication() {  
	                  return new PasswordAuthentication(username, password);  
	              }} );  
	      
	        
	     

	        
	        Message msg = new MimeMessage(session);
	        msg.setFrom(new InternetAddress( fromuser ));
	        msg.setRecipient(Message.RecipientType.TO, new InternetAddress( contactUsMail ));
	        msg.setSubject( "下一站!幸福!(客服系統)：" +contactUsSubject);
	       // String text=contactUsName+"您好:\n\n 我們已經收到您的來信，請耐心等候回覆。  \n\n 謝謝。";
	        //寫給使用者的內容
	       // msg.setContent(text, "text/html; charset=utf-8");
	        msg.setText(contactUsName+"您好:\n\n 我們已經收到您的來信，請耐心等候回覆。  \n\n 謝謝。");  
	        
	        Transport transport = session.getTransport("smtp");
	        transport.connect(host,username,password);
	        
	        //取要寄給user的mail
	        String to = InternetAddress.toString(msg.getRecipients(Message.RecipientType.TO)); 
	        //取送信者的mail
//	        System.out.println("Reply-to: " + InternetAddress.toString(msg.getReplyTo()));
	        //取送信者的mail
//	        System.out.println("Reply-to: " + InternetAddress.toString(msg.getFrom()));
	       
	        
	        //開始寄信
	        transport.sendMessage( msg ,msg.getRecipients(Message.RecipientType.TO) );
	       
	        transport.close();
	        } catch (MessagingException e) {  
	            throw new RuntimeException(e);  
	        }  
				
	}
	
	
		
	
}
