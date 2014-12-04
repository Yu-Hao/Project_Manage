package P20_BarChart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P20_BarChart.model.loginMostTopService;

/**
 * Servlet implementation class getLoginMostServlet
 */
@WebServlet("/getLoginMostServlet")
public class getLoginMostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getLoginMostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("text/html; charset=UTF-8"); //?
		res.setHeader("Access-Control-Allow-Origin", "*"); //?
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		
		String action = req.getParameter("action");
		
		//回傳json給client端  
				if("getLoginMostTopOne".equals(action)){
//					String keyword = req.getParameter("keyword");
					
					loginMostTopService lmtSvc = new loginMostTopService();
					String meminfo = lmtSvc.getAllJSON();
					
					out.println(meminfo);
					
				}
		
	}

}
