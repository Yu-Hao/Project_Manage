package P4_MessageBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P4_MessageBoard.model.MemDAO;
import P4_MessageBoard.model.MemService;
import P4_MessageBoard.model.MemVO;

/**
 * Servlet implementation class TestSeekServlet
 */
@WebServlet("/P4_MessageBoard/TestSeekServlet")
public class TestSeekServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestSeekServlet() {
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
		
		if("seek_friend".equals(action)){
			String keyword = req.getParameter("keyword");
			System.out.println("你的搜尋字串為" + keyword);
			
			MemService memSvc = new MemService();
			List<MemVO> list = memSvc.getAll(keyword);
			
//			MemDAO dao = new MemDAO();
//			List<MemVO> list = dao.getAll(keyword);
			
			req.setAttribute("list", list);
			String url = "/P4_MessageBoard/tempshowresult.jsp";
			RequestDispatcher successView=req.getRequestDispatcher(url); 
			successView.forward(req, res);	
			
		}
		
		//回傳json給client端
		if("seek_friend2".equals(action)){
			String keyword = req.getParameter("keyword");
			System.out.println("你的搜尋字串為" + keyword);
			
			MemService memSvc = new MemService();
			String meminfo = memSvc.getAllJSON(keyword);
			out.println(meminfo);
			
			
		}
		
	}

}
