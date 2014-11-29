package P1_iud.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.jasper.tagplugins.jstl.core.Out;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
import P1_iud.model.*;

/**
 * Servlet implementation class iduServlet
 */
@WebServlet("/P1_iud/IUDServlet")
@MultipartConfig(location = "C:\\temp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
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
		if ("addView".equals(action)) {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			HttpSession session = request.getSession();
			
			try {
				      
				String viewId = "";
				String viewName = "";
				String viewPlaceSel = "";
				String viewAddr = "";
				String viewLng = "";
				String viewLat = "";
				String pic1 = "";
				String pic2 = "";
				String pic3 = "";
				
				long sizeInBytes = 0;
				InputStream is = null;
				long sizeInBytes2 = 0;
				InputStream is2 = null;
				long sizeInBytes3 = 0;
				InputStream is3 = null;
				Collection<Part> parts = request.getParts();
				GlobalService.exploreParts(parts, request);
				if (parts != null) {   // 如果這是一個上傳資料的表單				
					for (Part p : parts) {
						pic1 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						if (pic1 != null && pic1.trim().length() > 0) {
							sizeInBytes = p.getSize();
							is = p.getInputStream();
						} 
						pic2 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						if (pic2 != null && pic2.trim().length() > 0) {
							sizeInBytes2 = p.getSize();
							is2 = p.getInputStream();
						} 
						pic3 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						if (pic2 != null && pic2.trim().length() > 0) {
							sizeInBytes3 = p.getSize();
							is3 = p.getInputStream();
						} 
					}
				}
				
				new MemberDAO().insert_pic_test(pic1 , is , sizeInBytes);
				System.out.println("pic1"+pic1);
				new MemberDAO().insert_pic_test(pic2 , is2 , sizeInBytes2);
				System.out.println("pic2"+pic2);
				new MemberDAO().insert_pic_test(pic3 , is3 , sizeInBytes3);
				System.out.println("pic3"+pic3);
				
				response.sendRedirect(response.encodeRedirectURL("addView.jsp"));
				return;
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher rd = request
						.getRequestDispatcher("/addView.jsp");
				rd.forward(request, response);
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
