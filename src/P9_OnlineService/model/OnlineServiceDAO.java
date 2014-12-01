package P9_OnlineService.model;

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


public class OnlineServiceDAO implements OnlineService_Interface{

	private static DataSource ds=null;
	static{
		try{
			Context ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/Project_1");
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
	private static final String UPDATEID="update top(1)  helper set member_loginID=? where member_loginID=?";
	//updateID指令
	
	private static final String SELECTID="select member_loginID from helper where member_loginID!=?";
	
	@Override
	public String updateID(String memID) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			System.out.println("update"+memID);
			//尋找字串是null時候update會員或訪客ID
			con=ds.getConnection();
			pstmt=con.prepareStatement(UPDATEID);
			String nullID="null";
			pstmt.setString(1, memID);
			pstmt.setString(2, nullID);
			pstmt.executeUpdate();
		}catch(SQLException e){
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		
		
		return memID;
		// TODO Auto-generated method stub
		
	}



	@Override
	public String selectID() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String memOnline="";//抓有誰的ID不為NULL
//		List<String> list=new ArrayList<String>();
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(SELECTID);
			pstmt.setString(1,"null");
			//執行指令
			rs=pstmt.executeQuery();
			//一筆一筆撈出來
			while(rs.next()){
				memOnline=rs.getString(1);
			}		
//			System.out.println("DAO"+memOnline);
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		}finally{
			if(rs!=null){
				try{
					rs.close();
				}catch(SQLException e){
					e.printStackTrace(System.err);
				}
			}
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(SQLException e){
					e.printStackTrace(System.err);
				}
			}
			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace(System.err);
				}
			}
		}
		
		
		
		return memOnline;
	}


	//將原本ID或IP改NULL
	@Override
	public String updateNull(String svcID) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			System.out.println("svcID:"+svcID);
			//尋找從前端接收到的ID改為null
			con=ds.getConnection();
			pstmt=con.prepareStatement(UPDATEID);
			String nullID="null";
			pstmt.setString(1, nullID);
			pstmt.setString(2, svcID);
			pstmt.executeUpdate();
		}catch(SQLException e){
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		
		
		
		return null;
	}

}
