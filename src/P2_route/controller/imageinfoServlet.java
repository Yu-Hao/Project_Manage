package P2_route.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P2_route.model.imginfoService;
import P2_route.model.viewnameService;

/**
 * Servlet implementation class imageinfoServlet
 */
@WebServlet("/P2_route/imageinfoServlet")
public class imageinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public imageinfoServlet() {
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
		
		String action = request.getParameter("action");
		
		if("GetImgInfoByID".equals(action)){
			String imagesID = request.getParameter("id");
			
			imginfoService imgService = new imginfoService();
			String imgdesc = imgService.findDescByPK(imagesID);
			out.println(imgdesc);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
