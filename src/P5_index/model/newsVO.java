package P5_index.model;

import java.sql.Blob;

public class newsVO {
	 private String   			news_identity   ;	
	 private java.sql.Date   	news_date 		;		
	 private String 			news_title		;		
	 private String 			news_image		;		 
	 private String 			news_Content    ;
	 private Blob 				news_ImgSrc    	;
	 private String				news_ImgFormat 	;
	 
	
	public String getNews_ImgFormat() {
		return news_ImgFormat;
	}
	public void setNews_ImgFormat(String news_ImgFormat) {
		this.news_ImgFormat = news_ImgFormat;
	}
	public String getNews_identity() {
		return news_identity;
	}
	public void setNews_identity(String news_identity) {
		this.news_identity = news_identity;
	}
	public Blob getNews_ImgSrc() {
		return news_ImgSrc;
	}
	public void setNews_ImgSrc(Blob news_ImgSrc) {
		this.news_ImgSrc = news_ImgSrc;
	}
	public java.sql.Date getNews_date() {
		return news_date;
	}
	public void setNews_date(java.sql.Date news_date) {
		this.news_date = news_date;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_image() {
		return news_image;
	}
	public void setNews_image(String news_image) {
		this.news_image = news_image;
	}
	public String getNews_Content() {
		return news_Content;
	}
	public void setNews_Content(String news_Content) {
		this.news_Content = news_Content;
	}
}
