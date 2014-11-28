package P1_iud.model;

import java.sql.Date;
import java.util.List;


public class viewnameService {

	private viewnameDAO_interface dao;

	public viewnameService() {
		dao = new viewnameDAO();
	}
	
	public String insert(String viewID,String viewname,String viewArea,
					String viewAddr,String viewlng,String viewlat) {
		
		viewnameVO vnVO = new viewnameVO();
		
		vnVO.setViewID(viewID);
		vnVO.setViewname(viewname);
		vnVO.setViewArea(viewArea);
		vnVO.setViewAddr(viewAddr);
		vnVO.setViewlng(viewlng);
		vnVO.setViewlat(viewlat);
		
		return dao.insert(vnVO);
	}
	
	public List<viewnameVO> getAll() {
		return dao.getAll();
	}
	
	public viewnameVO getOne(String id) {
		return dao.updateOne(id);
	}
}