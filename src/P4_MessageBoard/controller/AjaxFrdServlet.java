package P4_MessageBoard.controller;

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

import P4_MessageBoard.model.FrdDAO;
import P4_MessageBoard.model.FrdService;
import P4_MessageBoard.model.FrdVO;

/**
 * Servlet implementation class FrdServlet
 */
@WebServlet("/P4_MessageBoard/AjaxFrdServlet")
public class AjaxFrdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
		if("invite_friend".equals(action)){

			// 新增一筆友誼紀錄		
			String member_loginID = req.getParameter("vmember_loginID");
			String friend_loginID = req.getParameter("vfriend_loginID");		
			
			FrdDAO dao = new FrdDAO();
			int count = dao.getsame(member_loginID, friend_loginID);
//			System.out.println("多少筆 : "+count);
			
			if(count==0){
				FrdService frdSvc = new FrdService();
				String invite_msg = "嗨，還記得我嗎? 我是"+member_loginID+"啦，好久不見! 有空加我好友吧^^";
				frdSvc.addFrd(member_loginID, friend_loginID, invite_msg, 0);  // insert到資料庫
				
				out.println("已發送邀請給" +friend_loginID + "，請靜候佳音!");
				
				String path = getServletContext().getContextPath();			
//				res.sendRedirect(path+"/P4_MessageBoard/tempshowresult.jsp");	//使重新整理無作用!!!!
//				res.sendRedirect(path+"/P4_MessageBoard/SeekFriend2.jsp");  // 這行是否要寫.....
//				return;
			}else{
				out.println("系統發現你已經發送過 " +count + "次邀請給" +friend_loginID +"了!  你可能要看開一點QQ...");
			}
			

		}	
		
		if("show_invite".equals(action)){
			// 顯示有哪些人發送邀請給你
			
			System.out.println("come into ~~~ show_invite   ");
//			
////			String member_loginID = req.getParameter("vmember_loginID");
////			FrdDAO dao = new FrdDAO();
////			List<FrdVO> list = dao.getPart(member_loginID);
////			req.setAttribute("list",list);
////			RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/show_accept.jsp");
////			succuessView.forward(req, res);
//			res.setContentType("text/html;charset=UTF-8");
			String path = getServletContext().getContextPath();
			System.out.println(path);
			res.sendRedirect(path+"/P4_MessageBoard/show_accept.jsp");	//使重新整理無作用!!!!
			return;
				
		}
		
		if("accept_invite".equals(action)){
			// 按下確認 更新此筆友誼狀態
			
			int friendNum = new Integer(req.getParameter("vfriendNum"));

			
			FrdService frdSvc = new FrdService();
			frdSvc.updateFrd(friendNum);  // update到資料庫
//			RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/show_accept.jsp");
//			succuessView.forward(req, res);
			String path = getServletContext().getContextPath();
			res.sendRedirect(path+"/P4_MessageBoard/show_accept.jsp");	//使重新整理無作用!!!!
			return;
		}
		
		
		
	}

}
