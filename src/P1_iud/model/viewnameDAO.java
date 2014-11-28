package P1_iud.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class viewnameDAO implements viewnameDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_ViewName ="insert into viewName values(?,?,?,?,1,?,?)";
	private static final String GET_ALL_STMT = "select * from viewname order by viewname;";
	private static final String GET_ONE = "select * from viewname where viewid=?;";
	
	
	
	@Override
	public String insert(viewnameVO vnVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String success=null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ViewName);
			 
			pstmt.setString(1, vnVO.getViewID());
			pstmt.setString(2, vnVO.getViewname());
			pstmt.setString(3, vnVO.getViewArea());			
			pstmt.setString(4, vnVO.getViewAddr());
			pstmt.setString(5, vnVO.getViewlng());
			pstmt.setString(6, vnVO.getViewlat());
			pstmt.executeUpdate();
			success="成功";
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return success;
	}
	
	
	@Override
	public List<viewnameVO>  getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<viewnameVO> viewnames = new ArrayList<viewnameVO>();
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				viewnameVO vnVO = new viewnameVO();
				vnVO.setViewID(rs.getString("viewID"));
				vnVO.setViewname(rs.getString("viewname"));
				vnVO.setViewArea(rs.getString("viewArea"));
				vnVO.setViewAddr(rs.getString("viewAddr"));
				vnVO.setView_HitRate(rs.getInt("view_HitRate"));
				vnVO.setViewlng(rs.getString("viewlng"));
				vnVO.setViewlat(rs.getString("viewlat"));
				viewnames.add(vnVO);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
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
		return viewnames;
	}
	
	@Override
	public viewnameVO updateOne(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		viewnameVO vnVO = new viewnameVO();
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				vnVO.setViewID(rs.getString("viewID"));
				vnVO.setViewname(rs.getString("viewname"));
				vnVO.setViewArea(rs.getString("viewArea"));
				vnVO.setViewAddr(rs.getString("viewAddr"));
				vnVO.setView_HitRate(rs.getInt("view_HitRate"));
				vnVO.setViewlng(rs.getString("viewlng"));
				vnVO.setViewlat(rs.getString("viewlat"));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
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
		return vnVO;
	}
}
