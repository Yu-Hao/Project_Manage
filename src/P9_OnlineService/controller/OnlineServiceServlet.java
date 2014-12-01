package P9_OnlineService.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P9_OnlineService.model.OnlineServiceService;

/**
 * Servlet implementation class onlineServiceServlet
 */
@WebServlet("/P9_OnlineService/OnlineServiceServlet")
public class OnlineServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public OnlineServiceServlet() {
        super();
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		//給前端接收資料用
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		
		//判別按下click時候是接收到什麼ID
		if ("insertOnlineSvc".equals(action)) {
			String memID= req.getParameter("memID");
			System.out.println(memID);
			String memStatus="";
			OnlineServiceService onlineServiceService =new OnlineServiceService();
			onlineServiceService.updateID(memID);
			
			
		}
		
		//當按下click時候update ID或IP為 "null"
		if("changeToNULL".equals(action)){
			//從前端抓現在開啟svc是誰ID或IP
			String svcID= req.getParameter("svcID");
			OnlineServiceService onlineServiceService =new OnlineServiceService();
			onlineServiceService.updateNull(svcID);
			
		}
		
		
		
	}

}
