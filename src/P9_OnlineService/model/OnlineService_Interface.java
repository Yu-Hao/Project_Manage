package P9_OnlineService.model;

public interface OnlineService_Interface {
	public String updateID(String  memID);//新增線上Service 使他變ID或IP
	public String updateNull(String  svcID);//取消線上Service 使他變null
	public String selectID();
	
}
