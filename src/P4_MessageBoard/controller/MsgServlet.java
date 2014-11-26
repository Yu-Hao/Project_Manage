package P4_MessageBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P2_route.model.viewnameService;
import P4_MessageBoard.model.MsgDAO;
import P4_MessageBoard.model.MsgService;
import P4_MessageBoard.model.MsgVO;

/**
 * Servlet implementation class MsgServlet
 */
@WebServlet("/MsgServlet")
public class MsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		
		if("leave_msg".equals(action)){
			String member_loginID = req.getParameter("vmember_loginID");// 抓輸入的ID
			String title = req.getParameter("vtitle");					// 抓輸入的標題
			String content = req.getParameter("vcontent");				// 抓輸入的內容
			java.util.Date d = new Date();
			java.sql.Date  a = new java.sql.Date(d.getTime()); 			//留言時間
			
			if(title == null ||(title.trim().length() ==0)  || member_loginID == null ||(member_loginID.trim().length() ==0) || content == null ||(content.trim().length() ==0)){
				System.out.println("你的ID 標題 內容怪怪喔!!");
				RequestDispatcher failureView = req.getRequestDispatcher("/P4_MessageBoard/showALL.jsp");
				failureView.forward(req, res);
//				req.getRequestDispatcher("/P4_MessageBoard/showALL2.jsp").forward(req, res); //參考寫法
			}

			
			// 把從JSP網頁抓到的值存到MsgVO中，然後塞入資料庫     
			
//			SELECT TOP 1000 [messageNum]
//				      ,[member_loginID]
//				      ,[title]
//				      ,[content]
//				      ,[build_time]
//				      ,[message_stop]
//				      ,[replyfrom]
//				  FROM [project_1].[dbo].[messageboard]
			
			MsgVO msgVO = new MsgVO();
			
			msgVO.setMember_loginID(member_loginID);
			msgVO.setTitle(title);			
			msgVO.setContent(content);
			//req.setAttribute("ShowMsg", msgVO);
			
			
			// 傳到資料庫
			MsgService MsgSvc = new MsgService();
			
			System.out.println("ID = " +member_loginID);
			System.out.println("title = " +title);
			System.out.println("content = " +content);
			
			msgVO = MsgSvc.addMsg(10, member_loginID, title, content, a, "n",0);  //messageNum 是identity 是否可亂set值

//			RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/showALL2.jsp");
//			succuessView.forward(req, res);
			String path = getServletContext().getContextPath();
			res.sendRedirect(path+"/P4_MessageBoard/showALL.jsp");	//使重新整理無作用!!!!
			return;
		}


		//***********   回應留言    ************************
		if("reply_msg".equals(action)){
			
			
			// 捕捉回應哪個留言的"對應"資料     動態抓不同的textarea
			String reply_content = req.getParameter("reply_vcontent");
		
			
			//String member_loginID = req.getParameter("vmember_loginID");// 抓輸入的標題
			//String title = req.getParameter("vtitle");// 抓輸入的標題
//			String content = req.getParameter("vcontent2");// 抓輸入的內容  要動態的抓不同的textarea......
			
			String reply_user = req.getParameter("reply_vuser");		//是誰在回應
			String reply_fortitle = req.getParameter("reply_vfortitle");//針對哪個留言回應(標題)
			String content = req.getParameter(reply_content); 			//真正的回應的內容
			java.util.Date d = new Date();
			java.sql.Date  a = new java.sql.Date(d.getTime()); 			//留言時間
			String reply_forwho = req.getParameter("reply_vforwho");	//針對哪則留言回應(留言的identity)
			System.out.println(a);
			
			
			// 把從JSP網頁抓到的值存到MsgVO中，然後塞入資料庫 
			// 想顯示在網頁上
			MsgVO msgVO = new MsgVO();
			msgVO.setTitle("this is reply");
			msgVO.setMember_loginID("this is ...");
			msgVO.setContent(content);
			req.setAttribute("ShowMsg", msgVO);
			
			MsgService MsgSvc = new MsgService();				
			msgVO = MsgSvc.addMsg(10, reply_user,"Re:"+reply_fortitle, content, a, "n",Integer.parseInt(reply_forwho));// 把replyfrom 轉成數字..
			
//			RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/showALL2.jsp");
//			succuessView.forward(req, res);
			
			String path = getServletContext().getContextPath();
			res.sendRedirect(path+"/P4_MessageBoard/showALL.jsp");	//使重新整理無作用!!!!
			return;
		}
		
		

	}

}
