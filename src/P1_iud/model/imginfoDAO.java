package P1_iud.model;

import java.io.InputStream;
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
	
	private static final String Insert_img ="insert into images values(?,?,?,?,?)";
		// 新增一筆記錄
	@Override
	public String insertImg(String imagesID,String imagesName,String imgDescript, InputStream is, long size,String images_format){
		Connection connection = null;
		PreparedStatement pStmt = null;
		String successImagesMsg=null;
		try {

			connection = ds.getConnection();
			pStmt = connection.prepareStatement(Insert_img);
			pStmt.setString(1,imagesID);
			pStmt.setString(2,imagesName);
			pStmt.setString(3,imgDescript);
			pStmt.setBinaryStream(4, is, size);
			pStmt.setString(5,images_format);
			pStmt.executeUpdate();
			successImagesMsg = "成功";
		}catch(Exception e){
			
		}finally {
			if(connection!=null){
				try{
					connection.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
		return successImagesMsg;
	}
}
