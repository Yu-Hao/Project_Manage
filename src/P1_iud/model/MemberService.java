package P1_iud.model;

import java.sql.Date;
import java.util.List;

public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public MemberVO insert(	String				member_loginID ,
							String				member_password ,
							String				member_email ,
							int					member_class ,
							String				member_name ,
							String				member_stop ,
							String				member_gender, 
							Date				member_birthday, 
							String				member_address ,
							java.sql.Timestamp	member_buildtime, 
							String				member_type) {

		MemberVO memVO = new MemberVO();	
		
		memVO.setMember_loginID(member_loginID);
		memVO.setMember_password(member_password);
		memVO.setMember_email(member_email);
		memVO.setMember_class(member_class);
		memVO.setMember_name(member_name);
		memVO.setMember_stop(member_stop);
		memVO.setMember_gender(member_gender);
		memVO.setMember_birthday(member_birthday);
		memVO.setMember_address(member_address);
		memVO.setMember_buildtime(member_buildtime);
		memVO.setMember_type(member_type);
		dao.insert(memVO);
		return memVO;
	}

	
	public MemberVO update(String member_loginID,String member_password,String member_name,
			String member_gender,Date member_birthday,String member_address,java.sql.Timestamp member_updateTime,
			String member_type) {

		MemberVO memVO = new MemberVO();

		memVO.setMember_loginID(member_loginID);
		memVO.setMember_password(member_password);
		memVO.setMember_name(member_name);
		memVO.setMember_gender(member_gender);
		memVO.setMember_birthday(member_birthday);
		memVO.setMember_address(member_address);
		memVO.setMember_updateTime(member_updateTime);
		memVO.setMember_type(member_type);
		dao.update(memVO);

		return dao.findByPrimaryKey(member_loginID);
	}
	
	
	public void deleteMem(String member_loginID ) {
		dao.delete(member_loginID);
	}

	public MemberVO getOneMem(String member_loginID) {
		return dao.findByPrimaryKey(member_loginID);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}
	public String memeber_Count() {
		return dao.memeber_Count();
	}
}
