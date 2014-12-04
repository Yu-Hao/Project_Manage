package P10_Chart.model;

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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import P3_TravelDiary.model.TravelDiaryVO;

public class eachAreaTopOneDAO implements eachAreaTopOne_interface {
	
	private static DataSource ds=null;
	static{
		try{
			Context ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/Project_1");
		}catch(NamingException e){
			e.printStackTrace();
		}
	}

	private static final String GET_AREA_HIT=
			" select sum(view_hitRate) view_hitRate from viewname where viewarea =?";
	
	
	@Override
	public String getEachAreaTopOne() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String jsontoString="";
		List<String> cols = new ArrayList<String>();
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(GET_AREA_HIT);
			
			String [] country= {"北部","中部","南部","東部"};
			//先塞北中南資料到list之後用在json格式
			for(int i=0;i<country.length;i++){
				cols.add(country[i]);
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObj;
			//取出北中南總數
			for(int j=0;j<country.length;j++){
				pstmt.setString(1,country[j]);
				//執行指令
				rs=pstmt.executeQuery();
				//一筆一筆撈出來
				while(rs.next()){
					jsonObj = new JSONObject();
					jsonObj.put(cols.get(j), rs.getString(1));
					jsonArray.put(jsonObj);
				}
			}
			
			jsontoString=	jsonArray.toString();		
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return jsontoString;
	}
		
	@Override
	public List<eachAreaTopOneVO> getTopOne() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<eachAreaTopOneVO> listCount = new ArrayList<eachAreaTopOneVO>();
		eachAreaTopOneVO topVO = null;
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(GET_AREA_HIT);
			
			String [] country= {"北部","中部","南部","東部"};
			
			for(int j=0;j<country.length;j++){
				
				pstmt.setString(1,country[j]);
				//執行指令
				rs=pstmt.executeQuery();
				//一筆一筆撈出來
				while(rs.next()){
					topVO = new eachAreaTopOneVO();
					topVO.setView_hitrate(rs.getString(1));
					listCount.add(topVO);
				}
			}
			
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		} finally{
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
		return listCount;
	}
}
