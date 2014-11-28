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
	//viewName table
	private String				viewId;
	private String 				viewName;
	private String 				viewPlaceSel;
	private String 				viewAddr;
	private String 				viewLng;
	private String 				viewLat;
	
	//images table
	private String 				imagesId;
	private String 				imagesName;
	private String 				imgDescript;
	private String 				imgSrc;
	private String 				images_format;

	
	
	public String getViewLat() {
		return viewLat;
	}
	public void setViewLat(String viewLat) {
		this.viewLat = viewLat;
	}
	public String getViewId() {
		return viewId;
	}
	public void setViewId(String viewId) {
		this.viewId = viewId;
	}
	public String getViewName() {
		return viewName;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public String getViewPlaceSel() {
		return viewPlaceSel;
	}
	public void setViewPlaceSel(String viewPlaceSel) {
		this.viewPlaceSel = viewPlaceSel;
	}
	public String getViewAddr() {
		return viewAddr;
	}
	public void setViewAddr(String viewAddr) {
		this.viewAddr = viewAddr;
	}
	public String getViewLng() {
		return viewLng;
	}
	public void setViewLng(String viewLng) {
		this.viewLng = viewLng;
	}
	public String getImagesId() {
		return imagesId;
	}
	public void setImagesId(String imagesId) {
		this.imagesId = imagesId;
	}
	public String getImagesName() {
		return imagesName;
	}
	public void setImagesName(String imagesName) {
		this.imagesName = imagesName;
	}
	public String getImgDescript() {
		return imgDescript;
	}
	public void setImgDescript(String imgDescript) {
		this.imgDescript = imgDescript;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getImages_format() {
		return images_format;
	}
	public void setImages_format(String images_format) {
		this.images_format = images_format;
	}
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