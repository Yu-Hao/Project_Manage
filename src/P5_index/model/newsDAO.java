package P5_index.model;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
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

public class newsDAO implements newsDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ALL_News_JSON ="select news_identity , news_date , news_title from news;";
	
	private static final String GET_ONE="select news.news_identity, news.news_date , news.news_title, news.news_image , news.news_Content , images.imgSRC , images.images_format from news  join images on news_image = imagesname where news.news_identity= ? and imagesID like '%01' order by news_identity ;";
	 
	private static final String GET_All="select * from news order by news_identity ;";
	
	private static final String Insert = "insert into news values(?,?,?,?)";
	
	private static final String Update_img ="update news set news_date=?,news_title=?,news_image=?,news_Content=? where news_identity=? ; ";
	
	private static final String delete ="delete from news where news_identity = ? ;";
	
	@Override
	public void deleteNews(String news_identity) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(delete);	
			pstmt.setString(1,news_identity);
			pstmt.executeUpdate();
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
	}
	@Override
	public int insertNews(newsVO nsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(Insert);	
			
			pstmt.setDate(1,  nsVO.getNews_date());
			pstmt.setString(2, nsVO.getNews_title());
			pstmt.setString(3, nsVO.getNews_image());
			pstmt.setString(4, nsVO.getNews_Content());
			
			count = pstmt.executeUpdate();
			
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
		return count;
	}
	
	@Override
	public int updateNews(newsVO nsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(Update_img);	
			
			pstmt.setDate(1,  nsVO.getNews_date());
			pstmt.setString(2, nsVO.getNews_title());
			pstmt.setString(3, nsVO.getNews_image());
			pstmt.setString(4, nsVO.getNews_Content());
			pstmt.setString(5, nsVO.getNews_identity());
			
			
			count = pstmt.executeUpdate();
			
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
		return count;
	}
	
	
	@Override
	public String getAllNewsJSON() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String news="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_News_JSON);	
			
			rs = pstmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
				//System.out.println(rsmd.getColumnLabel(i));//news_identity,news_date,news_title
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObj;
			while(rs.next()){
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getInt(1));//news_identity
				jsonObj.put(cols.get(1), rs.getDate(2));//news_date
				jsonObj.put(cols.get(2), rs.getString(3));//news_title
				jsonArray.put(jsonObj);
			}
			
			news = jsonArray.toString();
			
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
		
		return news;
	}

	@Override
	public newsVO getOne(String newsID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		newsVO nsVO =null;
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);	
			pstmt.setString(1, newsID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				 nsVO = new newsVO();
				 nsVO.setNews_identity(rs.getString("news_identity"));//news_identity
				 nsVO.setNews_date(rs.getDate("news_date"));//news_date
				 nsVO.setNews_title(rs.getString("news_title"));//news_title
				 nsVO.setNews_image(rs.getString("news_image"));//news_image(name)
				 nsVO.setNews_Content(rs.getString("news_Content"));//news_Content
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
		
		return nsVO;
	}
	
	@Override
	public List<newsVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<newsVO> list = new ArrayList<newsVO>();
		newsVO nsVO =null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_All);	
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				 nsVO = new newsVO();
				 nsVO.setNews_identity(rs.getString("news_identity"));//news_identity
				 nsVO.setNews_date(rs.getDate("news_date"));//news_date
				 nsVO.setNews_title(rs.getString("news_title"));//news_title
				 nsVO.setNews_image(rs.getString("news_image"));//news_image(name)
				 nsVO.setNews_Content(rs.getString("news_Content"));//news_Content
				 list.add(nsVO);
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
}
