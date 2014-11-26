package P1_iud.controller;

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
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
import P1_iud.model.*;

/**
 * Servlet implementation class iduServlet
 */
@WebServlet("/IUDServlet")
public class IUDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IUDServlet() {
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
		PrintWriter out=response.getWriter();
		
		// ======新增======
		if ("register".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			try {
				HttpSession session = request.getSession();
				String member_loginID = request.getParameter("idName").trim();
				String member_name = request.getParameter("userName").trim();
				String member_password = request.getParameter("idPwd").trim();
				String member_email = request.getParameter("userEmail").trim();
				String member_gender = request.getParameter("genderChecked").trim();
				java.sql.Date member_birthday = null;
				try {
					member_birthday = java.sql.Date.valueOf(request.getParameter("datepicker").trim());
				} catch (IllegalArgumentException e) {
					member_birthday = new java.sql.Date(System.currentTimeMillis());
					session.setAttribute("errorMsgDate", "日期格式錯誤");
					response.sendRedirect("register.jsp");
					return;
				}

				String member_address = request.getParameter("userAddr").trim();

				if (member_loginID == null || member_loginID.length() == 0) {
					session.setAttribute("errorMsgAccount", "請輸入帳號");
					response.sendRedirect("register.jsp");
					return;
				}
				if (member_name == null || member_name.length() == 0) {
					session.setAttribute("errorMsgName", "姓名請勿空白");
					response.sendRedirect("register.jsp");
					return;
				}
				if (member_password == null || member_password.length() == 0) {
					session.setAttribute("errorMsgPwd", "請輸入密碼");
					response.sendRedirect("register.jsp");
					return;
				}				
				if (member_gender == null || member_gender.length() == 0) {
					session.setAttribute("errorMsgGender", "請選擇性別");
					response.sendRedirect("register.jsp");
					return;
				}
				if (member_email == null || member_email.length() == 0) {
					session.setAttribute("errorMsgEmail", "信箱欄位不能空白");
					response.sendRedirect("register.jsp");
					return;
				}
				if (member_address == null || member_address.length() == 0) {
					session.setAttribute("errorMsgAddr", "請輸入地址");
					response.sendRedirect("register.jsp");
					return;
				}

				int member_class = Integer.valueOf(request.getParameter("member_class"));
				String member_stop = request.getParameter("member_stop").trim();
				java.sql.Timestamp member_buildtime = java.sql.Timestamp.valueOf(request.getParameter("member_buildtime"));
				String member_type = request.getParameter("member_type").trim();
				
				MemberDAO memDAO = new MemberDAO();
				MemberVO memVo = memDAO.findByPrimaryKey(member_loginID);
				
				if(memVo == null){
//					MemberService memSvc = new MemberService();
					new MemberService().insert(member_loginID, member_password, member_email,
									member_class, member_name, member_stop,
									member_gender, member_birthday, member_address,
									member_buildtime, member_type);
					session.setAttribute("current", "註冊成功");
					response.sendRedirect("/Project_1/index.jsp");
					return;
				}else{
					session.setAttribute("errorMsgs", "此組帳號已有人使用!!");
					response.sendRedirect("register.jsp");
					return;
				}

			} catch (Exception e) {
				e.getMessage();
			}
		}

		

		// =====修改=====
		if ("Update".equals(action)) {

			try {
				HttpSession session = request.getSession();
				String member_loginID = request.getParameter("idName").trim();
				String member_name = request.getParameter("userName").trim();
				String member_password = request.getParameter("idPwd").trim();
				String member_email = request.getParameter("userEmail").trim();
				String member_gender = request.getParameter("genderChecked").trim();
				java.sql.Date member_birthday = null;
				try {
					member_birthday = java.sql.Date.valueOf(request.getParameter("datepicker").trim());
				} catch (IllegalArgumentException e) {
					member_birthday = new java.sql.Date(System.currentTimeMillis());
					session.setAttribute("errorMsgDate", "日期格式錯誤");
					response.sendRedirect("register.jsp");
					return;
				}

				String member_address = request.getParameter("userAddr").trim();

				if (member_loginID == null || member_loginID.length() == 0) {
					session.setAttribute("errorMsgAccount", "請輸入帳號");
					response.sendRedirect("register.jsp");
					return;
				}
				if (member_name == null || member_name.length() == 0) {
					session.setAttribute("errorMsgName", "姓名請勿空白");
					response.sendRedirect("register.jsp");
					return;
				}
				if (member_password == null || member_password.length() == 0) {
					session.setAttribute("errorMsgPwd", "請輸入密碼");
					response.sendRedirect("register.jsp");
					return;
				}				
				if (member_gender == null || member_gender.length() == 0) {
					session.setAttribute("errorMsgGender", "請選擇性別");
					response.sendRedirect("register.jsp");
					return;
				}
				if (member_email == null || member_email.length() == 0) {
					session.setAttribute("errorMsgEmail", "信箱欄位不能空白");
					response.sendRedirect("register.jsp");
					return;
				}
				if (member_address == null || member_address.length() == 0) {
					session.setAttribute("errorMsgAddr", "請輸入地址");
					response.sendRedirect("register.jsp");
					return;
				}

				java.sql.Timestamp member_updateTime = java.sql.Timestamp.valueOf(request.getParameter("member_updateTime"));
				String member_type = request.getParameter("member_type").trim();

				MemberVO memVO = new MemberService().update(member_loginID, member_password,
										member_name, member_gender, member_birthday,
										member_address,member_updateTime,member_type);
				
				session.setAttribute("updateCurrent","修改成功");				
				response.sendRedirect("/Project_1/index.jsp");
				return;
			} catch (Exception e) {
				e.getMessage();
			}
		}
		// =====刪除=====
		
		
		if ("actionDelete".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數***************************************/
				
				String member_loginID = new String(request.getParameter("member_loginID"));
				/***************************2.開始刪除資料***************************************/
				
				MemberService memSvc = new MemberService();
				memSvc.deleteMem(member_loginID);
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
				
				
				RequestDispatcher successView = request
						.getRequestDispatcher("/P1_iud/next.jsp");
				
				successView.forward(request, response);
			} catch (Exception e) {
				e.getMessage();
			}
		}
		
		
		if("member_Count".equals(action)){
			MemberService memService = new MemberService();
			String memberCount = memService.memeber_Count();
			out.println(memberCount);
			
		}
	}
	
	
}
