package P5_index.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import P5_index.model.*;

/**
 * Servlet implementation class viewnameServlet
 */
@WebServlet("/newsTop6Servlet")
public class newsTop6Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		if("GetNewsTop6".equals(action)){
			//String area = request.getParameter("area");
			
			newsService newsService = new newsService();
			String news = newsService.getAllNewsJSON();
			out.println(news);
		}
			
//		if ("news.do".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			//req.setAttribute("errorMsgs", errorMsgs);
//			try {				
//				HttpSession session = request.getSession();
//				String memberinfo=(String)session.getAttribute("userLoginId");	
//				TravelDiaryService travelDiarySvc=new TravelDiaryService();	
//				
//				List<TravelDiaryVO> travelDiaryVO=travelDiarySvc.getPic2(memberinfo);
//				
//				request.setAttribute("travelDiaryVO", travelDiaryVO);
//				String url = "/P3_TravelDiary/blog_one.jsp";
//				RequestDispatcher successView = request.getRequestDispatcher(url);
//				successView.forward(request, response);
//			} catch (Exception e) {
//				errorMsgs.add("upload" + e.getMessage());
//				RequestDispatcher failureView = request
//						.getRequestDispatcher("/P3_TravelDiary/blog_all.jsp");
//				failureView.forward(request, response);
//
//			}
//
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
