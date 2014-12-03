package P5_index.model;

import java.io.InputStream;
import java.sql.*;

public class knowledgeVO {
	private String   knowledge_identity;
	private String   knowledge_type;
	private String	 knowledge_title;
	private String	 knowledge_content;
	private String   knowledge_imgName;
	private Blob     knowledge_img;
	private String   knowledge_ImgFormat;
	private Date     knowledge_build;
	private InputStream is;
	private long size;
	 
	
	public InputStream getIs() {
		return is;
	}
	public void setIs(InputStream is) {
		this.is = is;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getKnowledge_identity() {
		return knowledge_identity;
	}
	public void setKnowledge_identity(String knowledge_identity) {
		this.knowledge_identity = knowledge_identity;
	}
	public String getKnowledge_imgName() {
		return knowledge_imgName;
	}
	public void setKnowledge_imgName(String knowledge_imgName) {
		this.knowledge_imgName = knowledge_imgName;
	}
	public Date getKnowledge_build() {
		return knowledge_build;
	}
	public void setKnowledge_build(Date knowledge_build) {
		this.knowledge_build = knowledge_build;
	}
	public String getKnowledge_ImgFormat() {
		return knowledge_ImgFormat;
	}
	public void setKnowledge_ImgFormat(String knowledge_ImgFormat) {
		this.knowledge_ImgFormat = knowledge_ImgFormat;
	}
	public String getKnowledge_type() {
		return knowledge_type;
	}
	public void setKnowledge_type(String knowledge_type) {
		this.knowledge_type = knowledge_type;
	}
	public String getKnowledge_title() {
		return knowledge_title;
	}
	public void setKnowledge_title(String knowledge_title) {
		this.knowledge_title = knowledge_title;
	}
	public String getKnowledge_content() {
		return knowledge_content;
	}
	public void setKnowledge_content(String knowledge_content) {
		this.knowledge_content = knowledge_content;
	}
	public Blob getKnowledge_img() {
		return knowledge_img;
	}
	public void setKnowledge_img(Blob knowledge_img) {
		this.knowledge_img = knowledge_img;
	}
	 
	 
	 
	 
	 
}
