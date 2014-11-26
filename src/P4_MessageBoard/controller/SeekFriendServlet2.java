package P4_MessageBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

/**
 * Servlet implementation class SeekFriendServlet
 */
@WebServlet("/P4_MessageBoard/SeekFriendServlet2")
public class SeekFriendServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeekFriendServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		//response.setContentType("application/json");
				// Get the printwriter object from response to write the required json object to the output stream      
				PrintWriter out = res.getWriter();
				// Assuming your json object is **jsonObject**, perform the following, it will return your json object  
				
				
				Connection conn = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Project_1";
//				String query = "select member_loginID, member_name from sysmember where member_loginID like ? OR member_name like ?";
				String query = "select member_name from sysmember where member_name like ?";
				
				String keyword = req.getParameter("keyword");
				keyword = "%" + keyword + "%";
				try{
					DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
					conn = DriverManager.getConnection(url, "sa", "sa123456");
					
					stmt = conn.prepareStatement(query);
					stmt.setString(1, keyword);
//					stmt.setString(2, keyword);
					
					rs = stmt.executeQuery();
					JSONArray jsonArray = new JSONArray();
					 while (rs.next())
					 {
						 jsonArray.add(rs.getString(1));
//						 jsonArray.add(rs.getString(1)+"  "+rs.getString(2));
					 }
					 out.print(jsonArray);
					
				}
				catch(SQLException e){
					out.println("Error:" + e.getMessage());
				}
				finally{
					//if(rs != null){
					//   rs.close();
					//}
					//if(stmt != null){
					// stmt.close();
					//}
					//if(conn != null){
					//}
				}
	}

}
