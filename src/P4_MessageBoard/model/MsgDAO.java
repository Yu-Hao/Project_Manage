package P4_MessageBoard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MsgDAO implements MsgDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_MSG = "INSERT INTO messageboard (member_loginID, title, content, build_time, message_stop,replyfrom) VALUES (?,?,?,?,?,?)";
//	private static final String GET_ALL_MSG = "SELECT messageNum, member_loginID, title, content, build_time, message_stop From messageboard order by messageNum DESC";
//	private static final String GET_ALL_MSG = "SELECT messageNum, member_loginID, title, content, build_time, message_stop,replyfrom From messageboard where replyfrom=1 order by messageNum DESC";
	private static final String GET_ALL_MSG = "SELECT * From messageboard order by messageNum DESC";
	@Override
	public void insert(MsgVO msgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_MSG);

			pstmt.setString(1, msgVO.getMember_loginID());
			pstmt.setString(2, msgVO.getTitle());
			pstmt.setString(3, msgVO.getContent());
			// notice DATE format!!
			pstmt.setDate(4, msgVO.getBuild_time());
			pstmt.setString(5, msgVO.getMessage_stop());
			pstmt.setInt(6, msgVO.getReplyfrom());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A DB error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public List<MsgVO> getAll() {
		List<MsgVO> list = new ArrayList<MsgVO>();
		MsgVO msgVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_MSG);
			rs = pstmt.executeQuery();
			int count = 0;
			while (rs.next()) {				
				count++;
				msgVO = new MsgVO();
				msgVO.setMessageNum(rs.getInt("messageNum"));
				msgVO.setMember_loginID(rs.getString("member_loginID"));
				msgVO.setTitle(rs.getString("title"));
				msgVO.setContent(rs.getString("content"));
				msgVO.setBuild_time(rs.getDate("build_time"));
				msgVO.setMessage_stop(rs.getString("message_stop"));
				msgVO.setReplyfrom(rs.getInt("replyfrom"));
				msgVO.setMessage_Count(count);
				System.out.println(count);
				list.add(msgVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A DB (getALL) error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}

			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}

		}
		return list;
	}

	@Override
	public void insert2(MsgVO msgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_MSG);

			pstmt.setString(1, msgVO.getMember_loginID());
			pstmt.setString(2, msgVO.getTitle());
			pstmt.setString(3, msgVO.getContent());
			// notice DATE format!!
			pstmt.setDate(4, msgVO.getBuild_time());
			pstmt.setString(5, msgVO.getMessage_stop());
			pstmt.setInt(6, msgVO.getReplyfrom());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A DB error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
	
		

	
	

}
