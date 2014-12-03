package P5_index.model;

import java.io.InputStream;
import java.sql.Blob;
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

public class knowledgeDAO implements knowledgeDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ALL_Knowledge_JSON ="select * from knowledge;";
	
	private static final String GET_ALL="select * from knowledge;";
	
	private static final String GET_ONE="select * from knowledge where knowledge_identity = ?;";
	
	
	private static final String Insert_img ="insert into knowledge values('食',?,?,?,?,?,?)";
	
	private static final String Update_img ="update knowledge set knowledge_title=?,knowledge_content=?,knowledge_imgName=?,knowledge_img=?,knowledge_imgformat=?,knowledge_build=? where knowledge_identity=? ; ";

	
	
	// 新增一筆記錄
	@Override
	public void insertKnowledge(String knowledge_title,
								String knowledge_content,
								String knowledge_imgName,
								InputStream is,
								long size,
								String knowledge_ImgFormat,
								java.sql.Date today){
		Connection connection = null;
		PreparedStatement pStmt = null;
		try {
	
			connection = ds.getConnection();
			pStmt = connection.prepareStatement(Insert_img);
			pStmt.setString(1,knowledge_title);
			pStmt.setString(2,knowledge_content);
			pStmt.setString(3,knowledge_imgName);
			pStmt.setBinaryStream(4, is, size);
			pStmt.setString(5,knowledge_ImgFormat);
			pStmt.setDate(6,today);
			
			pStmt.executeUpdate();
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
	}
	
	// 新增一筆記錄
		@Override
		public void updateKnowledge(String knowledge_title,
									String knowledge_content,
									String knowledge_imgName,
									InputStream is,
									long size,
									String knowledge_ImgFormat,
									java.sql.Date today,
									String knowledge_identity){
			Connection connection = null;
			PreparedStatement pStmt = null;
			try {
		
				connection = ds.getConnection();
				pStmt = connection.prepareStatement(Update_img);
				pStmt.setString(1,knowledge_title);
				pStmt.setString(2,knowledge_content);
				pStmt.setString(3,knowledge_imgName);
				pStmt.setBinaryStream(4, is, size);
				pStmt.setString(5,knowledge_ImgFormat);
				pStmt.setDate(6,today);
				pStmt.setString(7,knowledge_identity);
				pStmt.executeUpdate();
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
		}
	
	@Override
	public String getAllKnowledgeJSON() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String knowledges="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_Knowledge_JSON);	
			
			rs = pstmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObj;
			
			while(rs.next()){
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));//knowledge_idenity
				jsonObj.put(cols.get(1), rs.getString(2));//knowledge_type
				jsonObj.put(cols.get(2), rs.getString(3));//knowledge_title
				jsonObj.put(cols.get(3), rs.getString(4));//knowledge_content
				jsonObj.put(cols.get(4), rs.getString(5));//knowledge_img
				jsonArray.put(jsonObj);
			}
			
			knowledges = jsonArray.toString();
			
		}catch(SQLException e){
			e.printStackTrace();
		}catch (JSONException e) {
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
		
		return knowledges;
	}

	@Override
	public List<knowledgeVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		knowledgeVO kdVO =null;
		List<knowledgeVO> list = new ArrayList<knowledgeVO>();
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);	
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				kdVO = new knowledgeVO();
				kdVO.setKnowledge_identity(rs.getString("knowledge_identity"));//knowledge_identity
				kdVO.setKnowledge_type(rs.getString("knowledge_type"));//knowledge_type
				kdVO.setKnowledge_title(rs.getString("knowledge_title"));//knowledge_title
				kdVO.setKnowledge_content(rs.getString("knowledge_content"));//knowledge_content
				kdVO.setKnowledge_imgName(rs.getString("knowledge_imgName"));//knowledge_imgName
				kdVO.setKnowledge_img(rs.getBlob("knowledge_img"));//knowledge_img
				kdVO.setKnowledge_ImgFormat(rs.getString("knowledge_ImgFormat"));//knowledge_ImgFormat
				kdVO.setKnowledge_build(rs.getDate("knowledge_build"));//knowledge_build
				list.add(kdVO);
				/*
				 nsVO.setNews_ImgSrc(rs.getBlob("imgSrc"));//news_ImgSrc
				 nsVO.setNews_ImgFormat(rs.getString("images_format"));//news_ImgFormat
				 */
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
		
		return list;
	}
	
	@Override
	public knowledgeVO getOne(String knowledge_identity) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		knowledgeVO klVO =null;
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);	
			pstmt.setString(1, knowledge_identity);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				klVO = new knowledgeVO(); 
				klVO.setKnowledge_identity(rs.getString("knowledge_identity"));//knowledge_identity
				klVO.setKnowledge_type(rs.getString("knowledge_type"));//knowledge_type
				klVO.setKnowledge_title(rs.getString("knowledge_title"));//knowledge_title
				klVO.setKnowledge_content(rs.getString("knowledge_content"));//knowledge_content
				klVO.setKnowledge_imgName(rs.getString("knowledge_imgName"));//knowledge_imgName
				klVO.setKnowledge_img(rs.getBlob("knowledge_img"));//knowledge_img
				klVO.setKnowledge_ImgFormat(rs.getString("knowledge_ImgFormat"));//knowledge_ImgFormat
				klVO.setKnowledge_build(rs.getDate("knowledge_build"));//knowledge_build
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
		
		return klVO;
	}
	
	
	public String getAllCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		knowledgeVO klVO =null;
		String knowledgeCount=null;
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from knowledge;");	
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				knowledgeCount = rs.getString(1);
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
		
		return knowledgeCount;
	}
}
