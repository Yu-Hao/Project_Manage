package P2_route.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
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
import javax.sql.DataSource;

import P2_route.model.viewnameService;

/**
 * Servlet implementation class Leaderboard
 */
@WebServlet("/LeaderboardServlet")
public class LeaderboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaderboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connection conn= null;
		OutputStream os = null;
		
		String id = req.getParameter("id");
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
			conn = ds.getConnection();
			PreparedStatement pstmt = null;
			
			pstmt = conn.prepareStatement("select top(6) viewID, view_hitrate , viewname ,imagesID  , imgsrc ,images_format from  viewname join  images on viewname.viewid = images.imagesname where images.imagesID like '?' order by viewname.view_HitRate desc ;");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				//get images_format to set MIMEType
				String viewID = rs.getString("viewID");
				int view_hitrate = rs.getInt("view_hitrate");
				String viewName = rs.getString("viewname");
				
				//get imgSrc
				Blob bb = rs.getBlob("imgsrc");
				byte[] b = bb.getBytes(1, (int)bb.length());
				os.write(b, 0, (int)bb.length());
				os.flush();
				os.close();
				
				String images_format = rs.getString("images_format");
				
				String mimeType = getServletContext().getMimeType(images_format);
				//System.out.println(mimeType);
				res.setContentType(mimeType);
				os = res.getOutputStream();

			}
			
			
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
	}

}
