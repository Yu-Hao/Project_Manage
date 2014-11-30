package P6_contactUs.model;

import java.io.Serializable;

public class ContactUsVO implements Serializable {
	private String contactUsId;      //連絡我:姓名
	private String contactUsName;      //連絡我:姓名
	private String contactUsMail;	   //連絡我:mail	
	private String contactUsSubject;   //連絡我:主題
	private String contactUsContent;  //連絡我:內容
	private java.sql.Timestamp contactUsDate;   //連絡我:時間
	private String contactUsDateS;   //連絡我:時間
	private String contactUsReply;   
	
	
	public String getContactUsReply() {
		return contactUsReply;
	}
	public void setContactUsReply(String contactUsReply) {
		this.contactUsReply = contactUsReply;
	}
	public String getContactUsDateS() {
		return contactUsDateS;
	}
	public void setContactUsDateS(String contactUsDateS) {
		this.contactUsDateS = contactUsDateS;
	}
	public String getContactUsId() {
		return contactUsId;
	}
	public void setContactUsId(String contactUsId) {
		this.contactUsId = contactUsId;
	}
	//連絡我:姓名
	public String getContactUsName() {
		return contactUsName;
	}
	//連絡我:姓名
	public void setContactUsName(String contactUsName) {
		this.contactUsName = contactUsName;
	}
	//連絡我:mail	
	public String getContactUsMail() {
		return contactUsMail;
	}
	//連絡我:mail	
	public void setContactUsMail(String contactUsMail) {
		this.contactUsMail = contactUsMail;
	}
	//連絡我:主題
	public String getContactUsSubject() {
		return contactUsSubject;
	}
	//連絡我:主題
	public void setContactUsSubject(String contactUsSubject) {
		this.contactUsSubject = contactUsSubject;
	}
	//連絡我:內容
	public String getContactUsContent() {
		return contactUsContent;
	}
	//連絡我:內容
	public void setContactUsContent(String contactUsContent) {
		this.contactUsContent = contactUsContent;
	}
	//連絡我:時間
	public java.sql.Timestamp getContactUsDate() {
		return contactUsDate;
	}
	//連絡我:時間
	public void setContactUsDate(java.sql.Timestamp contactUsDate) {
		this.contactUsDate = contactUsDate;
	}
}
