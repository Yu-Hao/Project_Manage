package P4_MessageBoard.model;

import java.util.List;

public class MemService {
	
	private MemDAO_interface dao;
	public MemService(){
		dao = new MemDAO();
	}
	
	public List<MemVO> getAll(String query_string){
		return dao.getAll(query_string);
	}
	
	public String getAllJSON(String query_string) {
		return dao.getAllJSON(query_string);
	}
}
