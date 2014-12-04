package P10_Chart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P10_Chart.model.eachAreaTopOneService;

/**
 * Servlet implementation class getEachAreaTopOneServlet
 */
@WebServlet("/getEachAreaTopOneServlet")
public class getEachAreaTopOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public getEachAreaTopOneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		res.setContentType("text/html; charset=UTF-8"); //?
		PrintWriter out = res.getWriter();
	
		//抓取每個地區的加總點擊數
		if ("getEachTopOne".equals(action)) {
			eachAreaTopOneService eachAreaTopOneSvc=new eachAreaTopOneService();
			String jsonString=eachAreaTopOneSvc.getEachAreaTopOne();
			out.print(jsonString);
		}
		
		
	}

}
