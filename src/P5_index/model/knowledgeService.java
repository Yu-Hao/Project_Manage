package P5_index.model;

import java.util.List;


public class knowledgeService {

	private knowledgeDAO_interface dao;

	public knowledgeService() {
		dao = new knowledgeDAO();
	}
	
	public String getAllKnowledgeJSON() {
		return dao.getAllKnowledgeJSON();
	}
	
	public List<knowledgeVO> getAll() {
		return dao.getAll();
	}
	
	
}
