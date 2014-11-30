package P6_contactUs.model;
import java.util.*;
import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ContactUsDAO implements ContactUs_Interface{
	private static DataSource ds=null;
	static{
		try{
			Context ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/Project_1");
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
	
	
	//準備insert contact指令
	private static final String INSERT_STMT=
			"insert into ContactUs (contactUsName, contactUsMail, contactUsDate, contactUsSubject, contactUsContent)values(?,?,?,?,?)";
	private static final String contactUs_Count=
			" select * from contactus where contactUsReply=0";
	private static final String getAll=
			" select * from contactus order by contactUsId";
	private static final String getOne=
			" select * from contactus where contactUsId =?";

	

	@Override
	public void insertContactUs(ContactUsVO contactUsVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			//取得連線
			con=ds.getConnection();
			pstmt=con.prepareStatement(INSERT_STMT);
			//姓名
			pstmt.setString(1,contactUsVO.getContactUsName());
			//mail
			pstmt.setString(2,contactUsVO.getContactUsMail());
			//日期
			pstmt.setTimestamp(3,contactUsVO.getContactUsDate());
			//主題
			pstmt.setString(4,contactUsVO.getContactUsSubject());
			//內容
			pstmt.setString(5,contactUsVO.getContactUsContent());
			//執行
			pstmt.executeUpdate();
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		}finally{
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

	}
		
	@Override
	public String contactUs_Count() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String contactUs_Counts="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(contactUs_Count);	
			
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
				jsonObj.put(cols.get(0), rs.getString(1));//contactUsId
				jsonObj.put(cols.get(1), rs.getString(2));//contactUsName
				jsonObj.put(cols.get(2), rs.getString(3));//contactUsMail
				jsonObj.put(cols.get(3), rs.getString(4));//contactUsDate
				jsonObj.put(cols.get(4), rs.getString(5));//contactUsSubject
				jsonObj.put(cols.get(5), rs.getString(6));//contactUsContent
				jsonObj.put(cols.get(6), rs.getString(7));//contactUsReply
				jsonObj.put("contactCount", count);//count
				jsonArray.put(jsonObj);
			}
			
			contactUs_Counts = jsonArray.toString();
			
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
		return contactUs_Counts;
	}

	@Override
	public List<ContactUsVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ContactUsVO> list = new ArrayList<ContactUsVO>();
		ContactUsVO conVO = null;
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(getAll);	
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				conVO = new ContactUsVO();
				conVO.setContactUsId(rs.getString(1));//contactUsId
				conVO.setContactUsName(rs.getString(2));//contactUsName
				conVO.setContactUsMail(rs.getString(3));//contactUsMail
				conVO.setContactUsDateS(rs.getString(4));//date
				conVO.setContactUsSubject(rs.getString(5));//contactUsSubject
				conVO.setContactUsContent(rs.getString(6));//contactUsContent
				conVO.setContactUsReply(rs.getString(7));//contactUsReply
				list.add(conVO);
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
	public ContactUsVO getOne(String i) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ContactUsVO conVO = new ContactUsVO();
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(getOne);	
			pstmt.setString(1,i);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				conVO.setContactUsId(rs.getString(1));//contactUsId
				conVO.setContactUsName(rs.getString(2));//contactUsName
				conVO.setContactUsMail(rs.getString(3));//contactUsMail
				conVO.setContactUsDateS(rs.getString(4));
				conVO.setContactUsSubject(rs.getString(5));//contactUsSubject
				conVO.setContactUsContent(rs.getString(6));//contactUsContent
				conVO.setContactUsReply(rs.getString(7));//contactUsReply
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
		return conVO;
	}
}
