package P1_iud.model;

import java.util.*;
import java.io.*;
import java.sql.*;

import javax.naming.*;
import javax.servlet.http.Part;
import javax.sql.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import P1_iud.model.MemberVO;

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

	private static final String INSERT_STMT =
		      "INSERT INTO sysmember (member_loginID ,	member_password ,member_email ,member_class ,	member_name ,member_stop ,member_gender, member_birthday, member_address ,member_buildtime,	member_type ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";				
	private static final String GET_ALL_STMT =
		      "SELECT * FROM sysmember order by member_loginID";
	private static final String GET_ONE_STMT =
		      "  select *  from sysmember join persontype on member_type = typeID where member_loginID=?;";
	private static final String DELETE =
		      "DELETE FROM sysmember where member_loginID = ?";
	private static final String UPDATE =
		      "UPDATE sysmember set member_password=? ,member_name=? ,member_gender=?, member_birthday=?, member_address=? , member_updateTime=? , member_type=? where member_loginID = ?";
	private static final String memberCount =
		      "select * from sysmember;";
	private static final String INSERT_viewName =
		      " insert into viewName values('?','?','?','?',1,'?','?');";	
	private static final String INSERT_images =
	  "insert into images values('?','?','?','?','?')";

	@Override
	public void insertImages(MemberVO memVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_images);
			 
			pstmt.setString(1, memVO.getViewId());
			pstmt.setString(2, memVO.getViewName());
			pstmt.setString(3, memVO.getViewPlaceSel());			
			pstmt.setString(4, memVO.getViewAddr());
			pstmt.setString(5, memVO.getViewLng());
			pstmt.setString(6, memVO.getViewLat());
			pstmt.executeUpdate();
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
		
	}
	
	
	@Override
	public void insertView(MemberVO memVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_viewName);
			 
			pstmt.setString(1, memVO.getViewId());
			pstmt.setString(2, memVO.getViewName());
			pstmt.setString(3, memVO.getViewPlaceSel());			
			pstmt.setString(4, memVO.getViewAddr());
			pstmt.setString(5, memVO.getViewLng());
			pstmt.setString(6, memVO.getViewLat());
			pstmt.executeUpdate();
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
		
	}
	
	@Override
	public void insert(MemberVO memVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			 
			pstmt.setString(1, memVO.getMember_loginID());
			pstmt.setString(2, memVO.getMember_password());
			pstmt.setString(3, memVO.getMember_email());			
			pstmt.setInt(4, memVO.getMember_class());
			pstmt.setString(5, memVO.getMember_name());
			pstmt.setString(6, memVO.getMember_stop());
			pstmt.setString(7, memVO.getMember_gender());
			pstmt.setDate(8, memVO.getMember_birthday());
			pstmt.setString(9, memVO.getMember_address());
			pstmt.setTimestamp(10, memVO.getMember_buildtime());
			pstmt.setString(11, memVO.getMember_type());
			pstmt.executeUpdate();
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(MemberVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
            
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1,memVO.getMember_password());
			pstmt.setString(2, memVO.getMember_name());
			pstmt.setString(3, memVO.getMember_gender());
			pstmt.setDate(4, memVO.getMember_birthday());
			pstmt.setString(5, memVO.getMember_address());
			pstmt.setTimestamp(6, memVO.getMember_updateTime());
			pstmt.setString(7, memVO.getMember_type());
			pstmt.setString(8, memVO.getMember_loginID());
			
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	
	@Override
	public void delete(String member_loginID) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1,member_loginID);
			pstmt.executeUpdate();
			
			
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
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

	}

	@Override	
	public MemberVO findByPrimaryKey(String member_loginID) {

		MemberVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,member_loginID);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				memVO = new MemberVO();
				memVO.setMember_loginID(rs.getString("member_loginID"));	
				memVO.setMember_password(rs.getString("member_password"));
				memVO.setMember_email(rs.getString("member_email"));
				//memVO.setMember_class(rs.getInt("member_class"));
				memVO.setMember_name(rs.getString("member_name"));
				//memVO.setMember_stop(rs.getString("member_stop"));
				memVO.setMember_gender(rs.getString("member_gender"));
				memVO.setMember_birthday((rs.getDate("member_birthday")));
				memVO.setMember_address(rs.getString("member_address"));
				memVO.setMember_type(rs.getString("member_type"));
				//memVO.setMember_buildtime(rs.getDate("member_buildtime"));
				memVO.setTypeName(rs.getString("typeName"));
				
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
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
				memVO.setMember_buildtime(rs.getTimestamp("member_buildtime"));
				memVO.setMember_updateTime(rs.getTimestamp("member_updateTime"));
				memVO.setMember_type(rs.getString("member_type"));
				list.add(memVO); // Store the row in the list
			}
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public String memeber_Count() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String member_Counts="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(memberCount);	
			
			rs = pstmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int ColumnCount = rsmd.getColumnCount();
			for(int i = 1; i <= ColumnCount; i++) {
				cols.add(rsmd.getColumnLabel(i));
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObj;
			int count = 0;
			while(rs.next()){
				count++;
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));//member_loginID
				jsonObj.put(cols.get(1), rs.getString(2));//member_password
				jsonObj.put(cols.get(2), rs.getString(3));//member_email
				jsonObj.put(cols.get(3), rs.getString(4));//member_class
				jsonObj.put(cols.get(4), rs.getString(5));//member_name
				jsonObj.put(cols.get(5), rs.getString(6));//member_stop
				jsonObj.put(cols.get(6), rs.getString(7));//member_gender
				jsonObj.put(cols.get(7), rs.getString(8));//member_birthday
				jsonObj.put(cols.get(8), rs.getString(9));//member_address
				jsonObj.put(cols.get(9), rs.getString(10));//member_buildtime
				jsonObj.put(cols.get(10), rs.getString(11));//member_updateTime
				jsonObj.put(cols.get(11), rs.getString(12));//member_type
				jsonObj.put("member_Count", count);//member_count
				jsonArray.put(jsonObj);
			}
			
			member_Counts = jsonArray.toString();
			
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
		return member_Counts;
	}
	
	public static String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}
	
	public void insert_pic_test(String pic1,InputStream is , long sizeInBytes) throws ClassNotFoundException{
		Connection con = null;
		String insFile="";
		PreparedStatement pstmt;
		int count=0;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement("insert into images_ttt values(?,?);");
			
			pstmt.setString(1,pic1);
			pstmt.setBinaryStream(2,is,sizeInBytes);
			count += pstmt.executeUpdate();
			
			System.out.println("確認圖片成功insert: " + count + " 筆");
			
			
			
			ResultSet rs = null;
			int cut=0;
			for(int x=0;x<1;x++){
				BufferedOutputStream out=null;
				try {
					out = new BufferedOutputStream(new FileOutputStream(new File("C:\\images\\"+pic1+".jpg")));
				} catch (FileNotFoundException e1) {
					e1.printStackTrace();
				} 
				String queryFile1 =  "Select * from images_ttt where id=?";
				pstmt = con.prepareStatement(queryFile1);
				pstmt.setString(1, pic1);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					Blob bb = rs.getBlob(1);
					byte[] b = bb.getBytes(1, (int)bb.length());
					try {
						out.write(b, 0, (int)bb.length());
					} catch (IOException e) {
						e.printStackTrace();
					}
					try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
					cut++;
				}
				
			}
			System.out.println("確認圖片成功取出: "+cut+"筆");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	
	}

}
