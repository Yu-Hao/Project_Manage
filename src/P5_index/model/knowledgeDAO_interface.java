package P5_index.model;

import java.io.InputStream;
import java.util.List;

public interface knowledgeDAO_interface {
	
	public String getAllKnowledgeJSON();
	public List<knowledgeVO> getAll();
	public void insertKnowledge(String knowledge_title,String knowledge_content,String knowledge_imgName, InputStream is, long size,String knowledge_ImgFormat,java.sql.Date today);
	public knowledgeVO getOne(String knowledge_identity);
	public void updateKnowledge(String knowledge_title,String knowledge_content,String knowledge_imgName,InputStream is,long size,String knowledge_ImgFormat,java.sql.Date today,String knowledge_identity);    
	
}
