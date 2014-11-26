package P4_MessageBoard.model;

import java.sql.Date;
import java.util.List;

public class MsgService {
	
	private MsgDAO_interface dao;
	
	public MsgService(){
		dao = new MsgDAO();
	}
	
	public MsgVO addMsg(int messageNum, String member_loginID,String title,String content,
			Date build_time,String message_stop, int replyfrom){
		
		MsgVO msgVO = new MsgVO();
		
		msgVO.setMessageNum(messageNum);
		msgVO.setMember_loginID(member_loginID);
		msgVO.setTitle(title);
		msgVO.setContent(content);
		msgVO.setBuild_time(build_time);
		msgVO.setMessage_stop(message_stop);
		msgVO.setReplyfrom(replyfrom);
		dao.insert(msgVO);
		
		return msgVO;		
	}
	
	public List<MsgVO> getAll(){
		return dao.getAll();
		
	}

}
