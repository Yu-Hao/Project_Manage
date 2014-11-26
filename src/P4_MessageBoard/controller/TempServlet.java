package P4_MessageBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FirstServlet1
 */
@WebServlet("/FirstServlet1")
public class TempServlet extends HttpServlet {
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
		String account = req.getParameter("account");// 抓輸入的帳號
		
		if (account==""){
			account = "guest";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("myinfo", account);
		
		RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/showALL2.jsp");
		succuessView.forward(req, res);
	}

}
