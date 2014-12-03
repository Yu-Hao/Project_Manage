package P5_index.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import P5_index.model.newsService;



/**
 * Servlet implementation class Leaderboard
 */
@WebServlet("/newsServlet")
public class newsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
				
		String action = request.getParameter("action");
		
		if("addNews".equals(action)){
			HttpSession sion = request.getSession();
			Date news_date = java.sql.Date.valueOf(request.getParameter("news_date"));
			String news_title = request.getParameter("news_title");
			String news_image = request.getParameter("news_image");
			String news_Content = request.getParameter("news_Content");
			newsService newsSvc = new newsService();
			int count = newsSvc.insertNews(news_date, news_title, news_image, news_Content);
			sion.setAttribute("success", count);
			response.sendRedirect(contextPath+"/P1_iud/news_Manage/news_Manage.jsp");
			return;
		}
		
		
		if("updateNews".equals(action)){
			HttpSession sion = request.getSession();
			Date news_date = java.sql.Date.valueOf(request.getParameter("news_date"));
			String news_title = request.getParameter("news_title").trim();
			String news_image = request.getParameter("news_image").trim();
			String news_Content = request.getParameter("news_Content").trim();
			newsService newsSvc = new newsService();
			String id = sion.getAttribute("id").toString().trim();
			int count = newsSvc.updateNews(news_date, news_title, news_image, news_Content,id);
			response.sendRedirect(contextPath+"/P1_iud/news_Manage/news_Manage.jsp");
			return;
		}
		
		if("deleteNews".equals(action)){
			HttpSession sion = request.getSession();
			String id = sion.getAttribute("id").toString().trim();
			new newsService().deleteNews(id);
			response.sendRedirect(contextPath+"/P1_iud/news_Manage/news_Manage.jsp");
			return;
		}
		//		res.setContentType("text/html; charset=UTF-8");
//		res.setHeader("Access-Control-Allow-Origin", "*");
//		req.setCharacterEncoding("UTF-8");
//		
//		Connection conn= null;
//		OutputStream os = null;
//		
//		String newsId = req.getParameter("newsId");
//		String GET_ALL_NEWS = "select news_identity , news_date , news_title ,news_content from news where news_identity=?;";
//		
//		int		news_identity	;
//		String	news_date 		;
//		String 	news_title 		;
//		String 	news_content 	;
//		
//		try {
//			Context context = new InitialContext();
//			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
//			conn = ds.getConnection();
//			PreparedStatement pstmt = null;
//			
//			pstmt = conn.prepareStatement(GET_ALL_NEWS);			
//			pstmt.setString(1, newsId);
//						
//			ResultSet rs = pstmt.executeQuery();
//			PrintWriter out = res.getWriter();
//			
//			
//			if(rs.next()){
//				
//				news_identity = rs.getInt("news_identity");
//				news_date 	  = rs.getString("news_date");
//				news_title 	  = rs.getString("news_title");
//				news_content  = rs.getString("news_content");
//				
//				//res.setContentType("text/html");
//				//os = res.getOutputStream();
//
//				out.println("第"+news_identity+"筆<br>");
//				out.println("news_date= " + news_date +"<br>");
//				out.println("news_title= " + news_title +"<br>");
//				out.println("news_content= " + news_content +"<br>");
//			}
//			
//			
//			
//		} catch (NamingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}catch(SQLNonTransientException e){
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			if(conn!=null){
//				try{
//					conn.close();
//				}catch(SQLException e){
//					e.printStackTrace();
//				}
//			}
//			if(os!=null){
//				os.close();
//			}
//			
//		}
//		
//		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
	}

}
