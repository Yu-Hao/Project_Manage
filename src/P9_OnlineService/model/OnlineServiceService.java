package P9_OnlineService.model;



public class OnlineServiceService {
	
	private OnlineService_Interface dao;
	public OnlineServiceService(){
		dao =new OnlineServiceDAO();
	}
	
	//update null為ID或IP
	public String updateID(String memID){
		return dao.updateID(memID);
	}
	
	//select ID有無NULL
	public String selectID(){
		return dao.selectID();
	}
	
	//update ID或IP為null
	public String updateNull(String svcID) {
		return dao.updateNull(svcID);
		
	}

}
