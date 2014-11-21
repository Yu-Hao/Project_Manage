package P0_login.model;

import java.sql.*;
import java.util.Date;

import javax.naming.*;
import javax.sql.*;




public class MemberDAO implements MemberDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String SQL = "select * from sysmember where member_loginID = ?";
	
	@Override
	public MemberVO findByPrimaryKey(String member_loginID){
			
		MemberVO memVO = null;
		Connection conDB = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conDB = ds.getConnection();
			pstmt = conDB.prepareStatement(SQL);

			pstmt.setString(1, member_loginID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memVO = new MemberVO();
				memVO.setMember_loginID(rs.getString("member_loginID"));
				memVO.setMember_password(rs.getString("member_password"));
				memVO.setMember_email(rs.getString("member_email"));
				memVO.setMember_class(rs.getInt("member_class"));
				memVO.setMember_name(rs.getString("member_name"));
				memVO.setMember_stop(rs.getString("member_stop"));
				memVO.setMember_gender(rs.getString("member_gender"));
				memVO.setMember_birthday(rs.getDate("member_birthday"));
				memVO.setMember_address(rs.getString("member_address"));
				memVO.setMember_buildtime(rs.getDate("member_buildtime"));
				memVO.setMember_type(rs.getString("member_type"));
				
			}
		}catch(SQLException ex){
			System.err.println("Exception : " + ex.getMessage());
		}finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conDB != null) {
				try {
					conDB.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return memVO;
	}
	
	

}
