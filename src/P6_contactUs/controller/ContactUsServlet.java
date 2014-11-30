package P6_contactUs.controller;

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
import javax.xml.ws.RespectBinding;

import P6_contactUs.model.*;


@WebServlet("/P6_contactUs/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ContactUsServlet() {
        super();
        
    }

	
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//post中文處理
		req.setCharacterEncoding("UTF-8");
		//取name=actoin 的value判別是按到哪一個功能
		String action=req.getParameter("action");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		String contextPath = req.getContextPath();
		
		if("contactus".equals(action)){
			//建立一個用來存放errorMsg的List
			List<String> errorMsgs=new LinkedList<String>();
			//在jsp用來讀取${errorMsgs}方法
			req.setAttribute("errorMsgs", errorMsgs);
			try{
				//Contact欄位抓取並判別輸入是否OK(姓名 信箱 時間 標題 內容 要塞資料庫)
				String contactUsName = req.getParameter("name");
				if(contactUsName==null||(contactUsName.trim()).length()==0){
					errorMsgs.add("請輸入姓名");	
				}
				
				String contactUsMail = req.getParameter("recipients");
				if(contactUsMail==null||(contactUsMail.trim()).length()==0){
					errorMsgs.add("請輸入信箱");	
				}
						
				String fromuser = req.getParameter("frommail");
				if(fromuser==null||(fromuser.trim()).length()==0){
					errorMsgs.add("客服信箱有error");	
				}
				
				java.sql.Timestamp contactUsDate = java.sql.Timestamp.valueOf(req.getParameter("date"));
				if(contactUsDate==null){
					errorMsgs.add("時間無法抓取");	
				}
				
				String contactUsSubject = req.getParameter("subject");
				if(contactUsSubject==null||(contactUsSubject.trim()).length()==0){
					errorMsgs.add("請輸入主題");	
				}
				String contactUsContent = req.getParameter("contents");
				if(contactUsContent==null||(contactUsContent.trim()).length()==0){
					errorMsgs.add("請輸入內容");	
				}
				
				//new VO用來放資料
				ContactUsVO contactUsVO =new ContactUsVO();
				//共5筆資料 (姓名 信箱 時間 標題 內容 )
				contactUsVO.setContactUsName(contactUsName);
				contactUsVO.setContactUsMail(contactUsMail);
				contactUsVO.setContactUsDate(contactUsDate);
				contactUsVO.setContactUsSubject(contactUsSubject);
				contactUsVO.setContactUsContent(contactUsContent);
				
				
				//若有錯誤訊息要在原頁面顯示錯誤原因
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ContactUsVO", contactUsVO);
					// 之後在jsp用${failureView}讀取錯誤訊息
					RequestDispatcher failureView = req
							.getRequestDispatcher("/P6_ContactUs/ContactUs.jsp");
					failureView.forward(req, res);
					return;// 結束程式
				}
				
				//step1.
				//若沒有錯誤開始做寄信的工作
				//先寄信再去insert工作
				//開始呼叫service 做自動送信功能
				ContactUsService contactUsSvc=new ContactUsService();
				//傳參數到service 做autoEmail
				contactUsSvc.autoEmail(contactUsName, contactUsMail, contactUsDate, contactUsSubject, contactUsContent,fromuser);
				/************************************新增資料開始******************************************/
				//step2.
				//當自動送信成功後開始做insert ContactUs內容到資料庫
				contactUsSvc.insertContactUs(contactUsName, contactUsMail, contactUsDate, contactUsSubject, contactUsContent);
				/************************************新增資料完成******************************************/
//				String url = "/P6_ContactUs/ContactUsOK.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
				out.println("ok");
		
			}catch(Exception e){
				errorMsgs.add(e.getMessage());
				// 之後在jsp用${failureView}讀取錯誤訊息
				RequestDispatcher failureView = req
						.getRequestDispatcher("/P6_ContactUs/ContactUs.jsp");
				failureView.forward(req, res);
			}
			
			
		}
		
		if("contactUs_Count".equals(action)){
			ContactUsService conService = new ContactUsService();
			String contactUsCount = conService.contactUs_Count();
			out.println(contactUsCount);
		}
		
		if("contactUs_Reply".equals(action)){
			HttpSession sion = req.getSession();
			sion.setAttribute("ctVO", new ContactUsService().getOne(req.getParameter("contactUsId")));
			res.sendRedirect(contextPath+"/P1_iud/email_Replay.jsp");
			return;
		}
		
	}
}
