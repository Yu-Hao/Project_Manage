<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,
 java.io.IOException,
 java.io.OutputStream,
 java.io.PrintWriter,
 java.sql.Blob,
 java.sql.Connection,
 java.sql.PreparedStatement,
 java.sql.ResultSet,
 java.sql.SQLException,
 java.sql.SQLNonTransientException,

 javax.naming.Context,
 javax.naming.InitialContext,
 javax.naming.NamingException,
 javax.servlet.ServletException,
 javax.servlet.annotation.WebServlet,
 javax.servlet.http.HttpServlet,
 javax.servlet.http.HttpServletRequest,
 javax.servlet.http.HttpServletResponse,
 javax.sql.DataSource;" 
 %>
<% 
		String serverName =request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
		
		Connection conn= null;
		OutputStream os = null;
		PreparedStatement pstmt = null;
		
		String knowledge_identity = request.getParameter("name");
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
			conn = ds.getConnection();
		
			pstmt = conn.prepareStatement("delete from knowledge where knowledge_identity = ? ;");	
			pstmt.setString(1,knowledge_identity);
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
%>