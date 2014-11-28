package P1_iud.model;

public class viewnameVO {
	private String viewID;
	private String viewname;
	private String viewAddr;
	private String viewlat;
	private String viewlng;
	private Integer view_HitRate;
	private String viewArea;
	
	public Integer getView_HitRate() {
		return view_HitRate;
	}
	public void setView_HitRate(Integer view_HitRate) {
		this.view_HitRate = view_HitRate;
	}
	public String getViewID() {
		return viewID;
	}
	public void setViewID(String viewID) {
		this.viewID = viewID;
	}
	public String getViewname() {
		return viewname;
	}
	public void setViewname(String viewname) {
		this.viewname = viewname;
	}
	public String getViewAddr() {
		return viewAddr;
	}
	public void setViewAddr(String viewAddr) {
		this.viewAddr = viewAddr;
	}
	public String getViewlat() {
		return viewlat;
	}
	public void setViewlat(String viewlat) {
		this.viewlat = viewlat;
	}
	public String getViewlng() {
		return viewlng;
	}
	public void setViewlng(String viewlng) {
		this.viewlng = viewlng;
	}
	public String getViewArea() {
		return viewArea;
	}
	public void setViewArea(String viewArea) {
		this.viewArea = viewArea;
	}	
}
