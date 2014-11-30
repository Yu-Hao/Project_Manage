package P6_contactUs.model;
import java.util.*;


public class ContactUsService {
	private ContactUs_Interface dao;
	public ContactUsService(){
		dao=new ContactUsDAO();
	}
	
	//資料庫insert
	public ContactUsVO insertContactUs(
			String contactUsName,String contactUsMail,java.sql.Timestamp contactUsDate,String contactUsSubject,String contactUsContent){		
		//再重新new VO給工人用
		ContactUsVO  contactUsVO=new ContactUsVO();	
		contactUsVO.setContactUsName(contactUsName);
		contactUsVO.setContactUsMail(contactUsMail);
		contactUsVO.setContactUsDate(contactUsDate);
		contactUsVO.setContactUsSubject(contactUsSubject);
		contactUsVO.setContactUsContent(contactUsContent);	
		dao.insertContactUs(contactUsVO);
		return contactUsVO;
	}
	
	
	//自動寄信功能呼叫
	
	public void autoEmail(
			String contactUsName,String contactUsMail,java.sql.Timestamp contactUsDate,String contactUsSubject,String contactUsContent,String fromuser){
		//new自動寄信的class
		ContactUsAutoEmail contactUsAutoEmail=new ContactUsAutoEmail(contactUsName, contactUsMail, contactUsDate, contactUsSubject, contactUsContent, fromuser);
		//自動寄信的方法開始送
		contactUsAutoEmail.start();
	}
	
	public String contactUs_Count(){
		return dao.contactUs_Count();
	}
	
	public List<ContactUsVO> getAll(){
		return dao.getAll();
	}
	

	public ContactUsVO getOne(String i){
		return dao.getOne(i);
	}
	
	
	public void replyMail(
			String contactUsName,String contactUsMail,java.sql.Timestamp contactUsDate,String contactUsSubject,String contactUsContent,String fromuser){
		
	}
}