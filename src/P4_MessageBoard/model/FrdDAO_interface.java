package P4_MessageBoard.model;

import java.util.List;

public interface FrdDAO_interface {
    public void insert(FrdVO frdVO);//送出朋友邀請
    public void update(FrdVO frdVO);//接受邀請(可能有錯!!)
    public void update(int friendNum);//接受邀請
    public List<FrdVO> getPart(String friend_loginID);   //列出那些人邀請你
    public int getsame(String member_loginID, String friend_loginID);
    
    public List<FrdVO> getMyFrdStatus(String friend_loginID);   //列出那些人邀請你以及狀態(0 未確認  1 接受  9拒絕)
    public List<FrdVO> getFrined_count();

}
