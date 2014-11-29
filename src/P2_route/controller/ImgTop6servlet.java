package P2_route.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import P2_route.model.*;

/**
 * Servlet implementation class viewnameServlet
 */
@WebServlet("/P2_route/ImgTop6servlet")
public class ImgTop6servlet extends HttpServlet {
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
		
		if("GetImgTop6".equals(action)){
			//String area = request.getParameter("area");
			response.setBufferSize(2000*1024);
			viewnameService vnService = new viewnameService();
			String viewnames = vnService.getImgTop6();
			out.println(viewnames);
		}
		
		if("GetTop6".equals(action)){
			//String area = request.getParameter("area");
			
			viewnameService vnService = new viewnameService();
			String viewnames = vnService.getImgTop6();
			out.println(viewnames);
			//out.println(imgDescript);
		}
	
		if("img_Count".equals(action)){
			viewnameService vnService = new viewnameService();
			String viewCount = vnService.getImgCount();
			out.println(viewCount);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
