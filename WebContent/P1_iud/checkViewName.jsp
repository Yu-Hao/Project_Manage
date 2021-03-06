<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,
 javax.naming.Context,
 javax.naming.InitialContext,
 javax.sql.DataSource;
" %>

<% 
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//SQL Server
		String serverName =request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
// 		String url = "jdbc:sqlserver://"+serverName+":1433;DatabaseName=Project_1";
		String query = "select count(*) from viewname where viewID=?";
		String name = request.getParameter("name");
		try{
			//SQL Server
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
			conn = ds.getConnection();
// 			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
// 			conn = DriverManager.getConnection(url, "sa", "sa123456");
		
			stmt = conn.prepareStatement(query);
			stmt.setString(1,name);
			
			rs = stmt.executeQuery();
			int strMsg =0;
			
			 rs.next();
			 if(rs.getInt(1) >= 1){
				 strMsg =1;
			 }
			 out.print(strMsg);
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