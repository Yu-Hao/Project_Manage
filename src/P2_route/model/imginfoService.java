package P2_route.model;


public class imginfoService {

	private imginfoDAO_interface dao;

	public imginfoService() {
		dao = new imginfoDAO();
	}

	
	public String findDescByPK(String imagesID) {
		return dao.findDescByPK(imagesID);
	}
}
