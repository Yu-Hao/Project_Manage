package P2_route.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class imginfoDAO implements imginfoDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			//ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Travel01DB");
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_IMG_DESC_BY_PK ="SELECT imgDescript FROM images where imagesID=?";
	
	@Override
	public String findDescByPK(String imagesID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String imgdesc="";
		
		try{			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_IMG_DESC_BY_PK);	
			
			pstmt.setString(1, imagesID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				imgdesc = rs.getString(1);//get imgDescript
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		finally {
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
		
		return imgdesc;
	}
}
