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

public class FrdDAO implements FrdDAO_interface {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_FRD = "INSERT INTO member_friend (member_loginID, friend_loginID, invite_msg, relationship_status) VALUES (?,?,?,?)"; // 新增一個朋友邀請
	private static final String UPDATE_FRD = "UPDATE member_friend set relationship_status=1 where friendNum = ?";
	private static final String SELECT_FRD = "SELECT friendNum, member_loginID, invite_msg from member_friend where relationship_status=0 and friend_loginID = ?";
	private static final String SELECT_COUNT = "SELECT Count(*) from member_friend where member_loginID=? and friend_loginID = ?"; // 回傳此條件的搜尋筆數

	private static final String SELECT_FRDSTATUS = "SELECT friendNum, member_loginID, friend_loginID, invite_msg, relationship_status from member_friend where friend_loginID = ?";

	
	//昱豪
	private static final String FRIEND_COUNT = "select top(6) f.member_loginid, s.member_name, count(*)friend_count from member_friend f join sysmember s on f.member_loginID = s.member_loginid group by f.member_loginid,s.member_name;"; 

	
	
	@Override
	public void insert(FrdVO frdVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_FRD);

			pstmt.setString(1, frdVO.getMember_loginID());
			pstmt.setString(2, frdVO.getFriend_loginID());
			pstmt.setString(3, frdVO.getInvite_msg());
			pstmt.setInt(4, frdVO.getRelationship_status());

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

	} // end of insert

	
	@Override
	public void update(FrdVO frdVO) { //此方法需再確認 可能有寫錯

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FRD);

			pstmt.setInt(1, 1); // 把友誼狀態改為1

			pstmt.executeUpdate();

			// Handle any dirver errors
		} catch (SQLException se) {
			throw new RuntimeException("A DB error occured.(update)"
					+ se.getMessage());
			// clean up JDBC resources
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

	} // end of update
	
//	@Override
//	public void update(FrdVO frdVO) { //此方法需再確認 可能有寫錯
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(UPDATE_FRD);
//
//			pstmt.setInt(1, 1); // 把友誼狀態改為1
//
//			pstmt.executeUpdate();
//
//			// Handle any dirver errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A DB error occured.(update)"
//					+ se.getMessage());
//			// clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (SQLException e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//
//	} // end of update

	@Override
	public List<FrdVO> getPart(String friend_loginID) {

		List<FrdVO> list = new ArrayList<FrdVO>();
		FrdVO frdVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_FRD);
			pstmt.setString(1, friend_loginID);
			rs = pstmt.executeQuery();

			while (rs.next()) {				
				frdVO = new FrdVO();
				
				frdVO.setFriendNum(rs.getInt("friendNum"));
				frdVO.setMember_loginID(rs.getString("member_loginID"));
//				frdVO.setInvite_msg(rs.getString(columnLabel));
				frdVO.setInvite_msg(rs.getString("invite_msg"));
				
								
				list.add(frdVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A DB (getPart) error occured. "
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
	public void update(int friendNum) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FRD);

			pstmt.setInt(1, friendNum); // 把友誼狀態改為1

			pstmt.executeUpdate();

			// Handle any dirver errors
		} catch (SQLException se) {
			throw new RuntimeException("A DB error occured.(update)"
					+ se.getMessage());
			// clean up JDBC resources
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

	} // end of update


	@Override
	public int getsame(String member_loginID, String friend_loginID) {
		
		
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_COUNT);
			pstmt.setString(1,member_loginID);
			pstmt.setString(2,friend_loginID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				count = rs.getInt(1);
//				System.out.println("The count is " + rs.getInt(1));

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
		
		return count;
	}


	@Override
	public List<FrdVO> getMyFrdStatus(String friend_loginID) {
		
		List<FrdVO> list = new ArrayList<FrdVO>();
		FrdVO frdVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_FRDSTATUS);
			pstmt.setString(1, friend_loginID);
			rs = pstmt.executeQuery();

			while (rs.next()) {				
				frdVO = new FrdVO();
				
				frdVO.setFriendNum(rs.getInt("friendNum"));
				frdVO.setMember_loginID(rs.getString("member_loginID"));
				frdVO.setFriend_loginID(rs.getString("friend_loginID"));
				frdVO.setInvite_msg(rs.getString("invite_msg"));
				frdVO.setRelationship_status(rs.getInt("relationship_status"));
				
								
				list.add(frdVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A DB (getPart) error occured. "
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


	
	//昱豪
	@Override
	public List<FrdVO> getFrined_count() {

		FrdVO frdVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FrdVO> list = new ArrayList<FrdVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FRIEND_COUNT);
			rs = pstmt.executeQuery();

			while (rs.next()) {				
				frdVO = new FrdVO();
				frdVO.setMember_loginID(rs.getString("member_loginID"));//member_loginID
				frdVO.setMember_name(rs.getString("member_name"));//member_name
				frdVO.setFriend_count(rs.getString("friend_count"));//friend_count
				//System.out.println(rs.getString("member_loginID"));
				//System.out.println(rs.getString("friend_count"));
				list.add(frdVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A DB (getPart) error occured. "
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


}
