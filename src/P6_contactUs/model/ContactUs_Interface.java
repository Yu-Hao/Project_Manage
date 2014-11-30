package P6_contactUs.model;

import java.util.*; 
public interface ContactUs_Interface {
	public void insertContactUs(ContactUsVO contactUsVO);	
	public String contactUs_Count();
	public List<ContactUsVO> getAll();
	public ContactUsVO getOne(String i);
}
