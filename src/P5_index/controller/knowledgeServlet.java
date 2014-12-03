package P5_index.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;
import java.util.ArrayList;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import P5_index.model.*;


/**
 * Servlet implementation class Leaderboard
 */
@WebServlet("/knowledgeServlet")
@MultipartConfig(location = "C:\\temp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)

public class knowledgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public knowledgeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		String action = request.getParameter("action");
		
		if("addKnowledge".equals(action)){
			try {
	//			String knowledge_identity = request.getParameter("knowledge_identity");
	//			String knowledge_type = request.getParameter("knowledge_identity");
	//			String knowledge_title = request.getParameter("knowledge_identity");
	//			String knowledge_content = request.getParameter("knowledge_identity");;
	//			String knowledge_imgName = request.getParameter("knowledge_identity");
	//			Blob knowledge_img = request.getParameter("knowledge_identity");
	//			String knowledge_imgformat = request.getParameter("knowledge_identity");
	//			java.sql.Date knowledge_build = request.getParameter("knowledge_identity");
				String knowledge_identity = null;
				String knowledge_type = null;
				String knowledge_title = null;
				String knowledge_content = null;
				String knowledge_imgName = null;
				String knowledge_img = null;
				String knowledge_imgformat = null;
				java.sql.Date knowledge_build = null;
				long sizeInBytes = 0;
				InputStream is = null;
				String contextPath = request.getContextPath();
				Collection<Part> parts = request.getParts();
				knowService.exploreParts(parts, request);
	//			
	//			if (parts != null) {   // 如果這是一個上傳資料的表單				
	//				for (Part p : parts) {
	//					String fldName = p.getName();
	//					String value = request.getParameter(fldName);
	//					if (p.getContentType() == null) {
	//						if (fldName.equals("knowledge_title")) {
	//							knowledge_title = value;
	//						} else if (fldName.equals("knowledge_content")) {
	//							knowledge_content = value;
	//						} else if (fldName.equals("knowledge_imgName")) {
	//							
	//							knowledge_imgName = value;
	//							knowledge_imgName = knowledge_imgName.substring(0,(knowledge_imgName.lastIndexOf("."))-3);
	////******************************
	//						
	//						} else if (fldName.equals("knowledge_build")) {
	//							knowledge_build = java.sql.Date.valueOf(value);
	//						} 
	//						
	//					} else {
	//						knowledge_img = knowService.getFileName(p); // 此為圖片檔的檔名
	//						knowledge_imgName = knowledge_img.substring(0,(knowledge_img.lastIndexOf("."))-3);
	//						if (knowledge_img != null && knowledge_img.trim().length() > 0) {
	//							knowledge_imgName = knowledge_img.substring(0,(knowledge_img.lastIndexOf(".")));
	//							sizeInBytes = p.getSize();
	//							is = p.getInputStream();
	//						} 
	//					}
	//				}
	//			} 
				response.sendRedirect(response.encodeRedirectURL(contextPath+"/P1_iud/knowledge_Manage/knowledge_Manage.jsp"));
				return;
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher rd = request
						.getRequestDispatcher("addView.jsp");
				rd.forward(request, response);
			}
		}
		
		
		if("updateKnowledge".equals(action)){
			HttpSession sion = request.getSession();
			String id = sion.getAttribute("id").toString();
			System.out.println("id+"+id);
			try {
				String contextPath = request.getContextPath();
				Collection<Part> parts = request.getParts();
				updateKnowService.exploreParts(parts, request , id);

				response.sendRedirect(response.encodeRedirectURL(contextPath+"/P1_iud/knowledge_Manage/knowledge_Manage.jsp"));
				return;
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher rd = request
						.getRequestDispatcher("addView.jsp");
				rd.forward(request, response);
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
