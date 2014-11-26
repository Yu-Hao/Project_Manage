package P1_iud.model;

import java.sql.Date;
public class MemberVO {
	private String				member_loginID ;
	private String				member_password ;
	private String				member_email ;
	private int					member_class ;
	private String				member_name ;
	private String				member_stop ;
	private String				member_gender; 
	private Date				member_birthday; 
	private String				member_address ;
	private java.sql.Timestamp	member_buildtime; 
	private java.sql.Timestamp	member_updateTime; 
	private String				member_type ;
	private String				typeName ;
	private int					member_count;
	
	public int getMember_count() {
		return member_count;
	}
	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}
	public java.sql.Timestamp getMember_updateTime() {
		return member_updateTime;
	}
	public void setMember_updateTime(java.sql.Timestamp member_updateTime) {
		this.member_updateTime = member_updateTime;
	}
	public String getMember_loginID() {
		return member_loginID;
	}
	public void setMember_loginID(String member_loginID) {
		this.member_loginID = member_loginID;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getMember_class() {
		return member_class;
	}
	public void setMember_class(int member_class) {
		this.member_class = member_class;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_stop() {
		return member_stop;
	}
	public void setMember_stop(String member_stop) {
		this.member_stop = member_stop;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public Date getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public java.sql.Timestamp getMember_buildtime() {
		return member_buildtime;
	}
	public void setMember_buildtime(java.sql.Timestamp member_buildtime) {
		this.member_buildtime = member_buildtime;
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
}