package P3_TravelDiary.model;

import java.util.*;

public class TravelDiaryService {
	//new工人
	private TravelDiary_Interface dao;
	public TravelDiaryService(){
		dao =new TravelDiaryDAO();
	}
	//新增文章功能
	//Service這邊先取到從servlet透過jsp取到的值轉到這
	public TravelDiaryVO addBlog(String TravelDiary_Name,java.sql.Timestamp publish_date,
			String TravelDiary_Content,String member_loginID){
		
		//new 一個vo去抓剛剛傳來的title、日期、內容、ID四個資料
		TravelDiaryVO  travelDiaryVO=new TravelDiaryVO();
		//文章title
		travelDiaryVO.setTravelDiary_Name(TravelDiary_Name);
		//文章日期
		travelDiaryVO.setPublish_date(publish_date);
		//文章內容
		travelDiaryVO.setTravelDiary_Content(TravelDiary_Content);
		//會員ID
		travelDiaryVO.setMember_loginID(member_loginID);
		//完全部資料後塞到travelDiary之後
		//叫工人去做insert的事情
		dao.insert(travelDiaryVO);
		return travelDiaryVO;
	}
	
	//從jsp呼叫service getall方法 
	public List<TravelDiaryVO> getAll(String memberid){
		//叫工人去做getall 先去DAO 從資料庫抓全部資料出來
		return dao.getAll(memberid);
	}
	//找出修改的那一筆
	public TravelDiaryVO getOneTravelDiary(Integer TravelDiary_ID){

		return dao.findByPrimaryKey(TravelDiary_ID);
	}
	//update
	public void updateTravelDiary(String TravelDiary_Name,java.sql.Timestamp publish_date,
			String TravelDiary_Content,String member_loginID,Integer TravelDiary_ID) {
		
		TravelDiaryVO travelDiaryVO=new TravelDiaryVO();
		travelDiaryVO.setTravelDiary_Name(TravelDiary_Name);
		travelDiaryVO.setPublish_date(publish_date);
		travelDiaryVO.setTravelDiary_Content(TravelDiary_Content);
		travelDiaryVO.setMember_loginID(member_loginID);
		travelDiaryVO.setTravelDiary_ID(TravelDiary_ID);
		dao.update(travelDiaryVO);
		//return dao.findByPrimaryKey(TravelDiary_ID);
	}
	//刪除
	public void deleteTravelDiary(Integer TravelDiary_ID){
		dao.delete(TravelDiary_ID);
		
	}
	
	//讀圖片1
	public List<TravelDiaryVO> getPic2(String memberinfo){
		return dao.getPic2(memberinfo);
	}
	
	//取全部好友ID
	public String getFriends(String member_loginID){
		return dao.getFriends(member_loginID);
		
	}
	
	//取某一位好友全部文章
	public String getFriendsBlog(String myFriendID){
		return dao.getFriendsBlog(myFriendID);
	}
	
	public String getAllCount(){
		return dao.getAllCount();
	}
	
	public List<TravelDiaryVO> getAll(){
		return dao.getAll();
	}
	
	public List<TravelDiaryVO> getBlog_count(){
		return dao.getBlog_count();
	}
}
