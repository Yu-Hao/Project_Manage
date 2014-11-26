package P2_route.model;

import java.sql.Blob;

public class imginfoVO {
	private String imagesID;
	private String imagesName;
	private String imgDescript;
	private Blob imgSrc;
	private String images_format;
	
	public String getImagesID() {
		return imagesID;
	}
	public void setImagesID(String imagesID) {
		this.imagesID = imagesID;
	}
	public String getImagesName() {
		return imagesName;
	}
	public void setImagesName(String imagesName) {
		this.imagesName = imagesName;
	}
	public String getImgDescript() {
		return imgDescript;
	}
	public void setImgDescript(String imgDescript) {
		this.imgDescript = imgDescript;
	}
	public Blob getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(Blob imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getImages_format() {
		return images_format;
	}
	public void setImages_format(String images_format) {
		this.images_format = images_format;
	}
}
