package P4_MessageBoard.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P4_MessageBoard.model.MsgService;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/P4_MessageBoard/controller/InsertReplyServlet")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
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
		System.out.println("有來這個servlet");
		String reply_user = req.getParameter("reply_vuser");		//是誰在回應
		System.out.println("reply_user is" + reply_user);
		String reply_fortitle = req.getParameter("reply_vfortitle");//針對哪個留言回應(標題)
		String content = req.getParameter("reply_vcontent"); 			//真正的回應的內容
		java.util.Date d = new Date();
		java.sql.Date  a = new java.sql.Date(d.getTime()); 			//留言時間
		System.out.println("time : "+a);
		String reply_forwho = req.getParameter("reply_vforwho");	//針對哪則留言回應(留言的identity)
		System.out.println("ready to insert");
		MsgService MsgSvc = new MsgService();				
		MsgSvc.addMsg(10, reply_user,reply_fortitle, content, a, "n",Integer.parseInt(reply_forwho));// 把replyfrom 轉成數字..
		
		
	}

}
