package P4_MessageBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P4_MessageBoard.model.FrdDAO;
import P4_MessageBoard.model.FrdVO;

/**
 * Servlet implementation class ShowInviteCountServlet
 */
@WebServlet("/P4_MessageBoard/ShowInviteCountServlet")
public class ShowInviteCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
		FrdDAO dao=new FrdDAO();
		//String member_loginID=(String)session.getAttribute("userLoginId"); 
//		List<FrdVO> list=dao.getPart("aa123");//先用aa123
		String temp = req.getParameter("member_loginID");
		System.out.println("temp is"+ temp);
		List<FrdVO> list=dao.getPart(temp);//先用aa123
		int invite_count = list.size();
		System.out.println("現在有"+invite_count+"個邀請");
		req.setAttribute("list",list);
		req.setAttribute("invite_count",invite_count);
		
		//@@@@@@@  我在亂寫什麼
		PrintWriter out = res.getWriter();
		out.print(invite_count);
		
	}

}
