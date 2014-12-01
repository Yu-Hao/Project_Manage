<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>

<% 
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		PreparedStatement stmt1 = null;
		//SQL Server
		String serverName =request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
		String url = "jdbc:sqlserver://" + serverName+ ":1433;DatabaseName=Project_1";
		String query = "update sysmember set member_stop=? where member_loginid = ?";
		String queryMessage = "update messageboard set message_stop=? where member_loginid = ?";
		String name = request.getParameter("name").trim();
		String stopType = request.getParameter("stopType").trim();
		String stopMessage = request.getParameter("stopMessage").trim();
		int count = 0;
		try{
			//SQL Server
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn = DriverManager.getConnection(url, "sa", "sa123456");
			
			//會員
			stmt = conn.prepareStatement(query);
			stmt.setString(1,stopType);
			stmt.setString(2,name);
			
			count = stmt.executeUpdate();
			//會員
			
			//留言
			stmt1 = conn.prepareStatement(queryMessage);
			stmt1.setString(1,stopMessage);
			stmt1.setString(2,name);
			count = stmt1.executeUpdate();
			//留言
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