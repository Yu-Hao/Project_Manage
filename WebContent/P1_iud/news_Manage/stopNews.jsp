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
		
		String Leaderid = request.getParameter("leaderId");
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
			conn = ds.getConnection();
			PreparedStatement pstmt = null;
			
			pstmt = conn.prepareStatement("SELECT images_format, imgSrc , imgDescript  FROM images where imagesID = ?");
			pstmt.setString(1, Leaderid);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				//get images_format to set MIMEType
				String images_format = rs.getString(1);
				String mimeType = getServletContext().getMimeType(images_format);
				response.setContentType(mimeType);
				os = response.getOutputStream();

				//get imgSrc
				Blob bb = rs.getBlob(2);
				byte[] b = bb.getBytes(1, (int)bb.length());
				os.write(b, 0, (int)bb.length());
				os.flush();
				
				
				
			}
		}catch(SQLNonTransientException e){
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(os!=null){
				os.close();
			}
			
		}
		
%>