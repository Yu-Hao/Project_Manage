package P1_iud.model;

import java.io.InputStream;
import java.sql.Blob;

public class imginfoVO {
	private String imagesID;
	private String imagesName;
	
	private Blob imgSrc;
	private String images_format;
	
	private String pic1;
	private String pic2;
	private String pic3;
	private String imgDescript1;
	private String imgDescript2;
	private String imgDescript3;
	
	private InputStream is1;
	private InputStream is2;
	private InputStream is3;
	private long size1;
	private long size2;
	private long size3;
	
	public InputStream getIs1() {
		return is1;
	}
	public void setIs1(InputStream is1) {
		this.is1 = is1;
	}
	public InputStream getIs2() {
		return is2;
	}
	public void setIs2(InputStream is2) {
		this.is2 = is2;
	}
	public InputStream getIs3() {
		return is3;
	}
	public void setIs3(InputStream is3) {
		this.is3 = is3;
	}
	public long getSize1() {
		return size1;
	}
	public void setSize1(long size1) {
		this.size1 = size1;
	}
	public long getSize2() {
		return size2;
	}
	public void setSize2(long size2) {
		this.size2 = size2;
	}
	public long getSize3() {
		return size3;
	}
	public void setSize3(long size3) {
		this.size3 = size3;
	}
	public String getImgDescript1() {
		return imgDescript1;
	}
	public void setImgDescript1(String imgDescript1) {
		this.imgDescript1 = imgDescript1;
	}
	public String getImgDescript2() {
		return imgDescript2;
	}
	public void setImgDescript2(String imgDescript2) {
		this.imgDescript2 = imgDescript2;
	}
	public String getImgDescript3() {
		return imgDescript3;
	}
	public void setImgDescript3(String imgDescript3) {
		this.imgDescript3 = imgDescript3;
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
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
