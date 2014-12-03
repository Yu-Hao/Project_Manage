package P10_Chart.model;

public class eachAreaTopOneService {
	private eachAreaTopOne_interface dao;
	
	public eachAreaTopOneService(){
		dao=new eachAreaTopOneDAO();
	}
	
	//老出每個地區點擊數
	public String getEachAreaTopOne(){
		return 	dao.getEachAreaTopOne();
	}
}
