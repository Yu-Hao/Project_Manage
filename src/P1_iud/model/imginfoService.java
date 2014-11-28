package P1_iud.model;

import java.io.InputStream;
import java.sql.Blob;


public class imginfoService {

	private imginfoDAO_interface dao;

	public imginfoService() {
		dao = new imginfoDAO();
	}
	
//	public String insertImg(String imagesID,String imagesName,String imgDescript, InputStream is, long size,String images_format) {
//		
//		imginfoVO imgVO = new imginfoVO();
//		imgVO.setImagesID(imagesID);
//		imgVO.setImagesName(imagesName);
//		imgVO.setImgDescript(imgDescript);
//		imgVO.setImages_format(images_format);
//		
//		return dao.insertImg(imgVO , is , size);
//	}
}
