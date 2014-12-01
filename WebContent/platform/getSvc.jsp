<%@ page language="java" contentType="text/event-stream; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter,P9_OnlineService.model.* ,org.json.JSONObject;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			response.setContentType("text/event-stream");
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			
// 			String OlineSvc = request.getParameter("OlineSvc");
// 			System.out.println("OlineSvc = " + OlineSvc);
			String Notifymsg ="{}";
			OnlineServiceService onlineSvc=new OnlineServiceService();
			//接收到資料庫回傳不是NULL的ID
			String infoID=onlineSvc.selectID();
			
			if(infoID.equals("null")){
				//若接收到資料庫有null字串時候不動作  所以傳到admin時候會是空的
// 				System.out.println("N");
// 				if (!("null".equals(info.getString("cooperation_friend")))) {
// 					String frdName = frdSrv.getFrdsName(info.getString("cooperation_friend"));
// 					//System.out.println("frdName = " +frdName);
// 					info.put("frdName", frdName);
// 					Notifymsg = info.toString();
// 				}
			}else{
				//若接收到資料過有ID或IP傳資料到管理者頁面每10秒刷新
// 				System.out.println("Y");
				writer.write("data: " + infoID + "\n\n");
				writer.write("retry: 10000\n");
				
			}
// 			System.out.println("Notifymsg = " + Notifymsg);
// 			if (!("{}".equals(Notifymsg))) {
// 				writer.write("data: " + Notifymsg + "\n\n");
// 				writer.write("retry: 10000\n");
// 			}
		%>
</body>
</html>