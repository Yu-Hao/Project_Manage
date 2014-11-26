package P0_login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import P0_login.model.*;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String userId = request.getParameter("inputLoginId");
		String password = request.getParameter("inputPassword");
		String rm = request.getParameter("rememberMe");
		String path = getServletContext().getContextPath();
		
		
	//  ****************************************** 
		
		if("logOut".equals(action)){
			HttpSession session = request.getSession();					
			session.invalidate();
			response.sendRedirect(path+"/index.jsp");
			return;
		}
		
		

		if ("LoginIdCheck".equals(action)) {
			try {
			
				if (userId == null || userId.trim().length() == 0) {
					request.setAttribute("errorMsgId", "帳號不可為空值或空白!");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P0_login/login.jsp");
					rd.forward(request, response);					
				}
				
				if (password == null || password.trim().length() == 0) {
					request.setAttribute("errorMsgPwd", "密碼不可為空值或空白!");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P0_login/login.jsp");
					rd.forward(request, response);
				}
				
				MemberDAO ms = new MemberDAO();
			    MemberVO mb = ms.findByPrimaryKey(userId);
				
				if(mb == null && userId != null){
					request.setAttribute("errorMsgId", "無此會員帳號");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P0_login/login.jsp");
					rd.forward(request, response);
				}
				

				if (mb != null && mb.getMember_loginID().equals(userId) && mb.getMember_password().equals(password) && mb.getMember_class() == 9) {
					//request.setAttribute("userId", mb.getMember_name());
					//request.setAttribute("userloginid", mb.getMember_loginID());
					//將使用者存入session
					HttpSession session = request.getSession();					
					session.setAttribute("userName", mb.getMember_name());
					session.setAttribute("userLoginId",mb.getMember_loginID());
					//******************************************************
					
					
					// 此時不要用下面兩個敘述，因為網址列的URL不會改變
					//RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					//rd.forward(request, response);
					
					response.sendRedirect(path+"/index.jsp");
					return;
				} 
				else {
					request.setAttribute("errorMSG", "帳密錯誤 或 權限不足");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P0_login/login.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e) {
			}
		}
		
		
	}

}
