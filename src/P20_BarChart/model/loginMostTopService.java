package P20_BarChart.model;

public class loginMostTopService {
	
	private loginMostTopDAO_interface dao;
	public loginMostTopService(){
		dao = new loginMostTopDAO();
		
		}	
	
	public String getAllJSON() {
		return dao.getAllJSON();
}
}
