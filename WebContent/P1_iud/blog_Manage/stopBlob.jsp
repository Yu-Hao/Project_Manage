<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,
 javax.naming.Context,
 javax.naming.InitialContext,
 javax.sql.DataSource;
" %>
<% 
		String serverName =request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
		

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//SQL Server
		
// 		String url = "jdbc:sqlserver://"+serverName+":1433;DatabaseName=Project_1";
		String query = "update TravelDiary set diary_class=? where TravelDiary_ID = ?";
		String name = request.getParameter("name");
		String typeKind = request.getParameter("typeKind").trim();
		System.out.println("name="+name+","+"typeKind="+typeKind);
		int count = 0;
		try{
			//SQL Server
// 			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
// 			conn = DriverManager.getConnection(url, "sa", "sa123456");
		
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
			conn = ds.getConnection();
			stmt = conn.prepareStatement(query);
			stmt.setString(1,typeKind);
			stmt.setString(2,name);
			
			count = stmt.executeUpdate();
			System.out.println("count="+count);
// 			System.out.println("count="+count);
		}
		catch(SQLException e){
			out.println("Error:" + e.getMessage());
		}
		finally{
			if(rs != null){
			   	rs.close();
			}
			if(stmt != null){
			   	stmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
%>