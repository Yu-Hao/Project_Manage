package P4_MessageBoard.model;

public class FrdVO implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int 	friendNum;
	private String 	member_loginID;
	private String	friend_loginID;
	private String	invite_msg;
	private int		relationship_status;
	
	//昱豪
	private String friend_count;
	private String member_name;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getFriend_count() {
		return friend_count;
	}
	public void setFriend_count(String friend_count) {
		this.friend_count = friend_count;
	}
	public int getFriendNum() {
		return friendNum;
	}
	public void setFriendNum(int friendNum) {
		this.friendNum = friendNum;
	}
	public String getMember_loginID() {
		return member_loginID;
	}
	public void setMember_loginID(String member_loginID) {
		this.member_loginID = member_loginID;
	}
	public String getFriend_loginID() {
		return friend_loginID;
	}
	public void setFriend_loginID(String friend_loginID) {
		this.friend_loginID = friend_loginID;
	}
	public String getInvite_msg() {
		return invite_msg;
	}
	public void setInvite_msg(String invite_msg) {
		this.invite_msg = invite_msg;
	}
	public int getRelationship_status() {
		return relationship_status;
	}
	public void setRelationship_status(int relationship_status) {
		this.relationship_status = relationship_status;
	}
	
	

}
