<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <%
		Object sionName = session.getAttribute("userName");
		Object sionLoginId = session.getAttribute("userLoginId");
		Object serverName = request.getServerName();
		Object serverPort = request.getServerPort();
		Object contextPath = request.getContextPath();
	%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<%@ page import="java.util.*" %>
	<%@ page import="P4_MessageBoard.model.*"%>
    <%
        FrdDAO dao=new FrdDAO();
        String member_loginID=(String)session.getAttribute("userLoginId"); 
        List<FrdVO> listFriend = dao.getPart(member_loginID);
        int invite_count = listFriend.size();
        pageContext.setAttribute("listFriend",listFriend);
        pageContext.setAttribute("invite_count",invite_count);
    %>
	
    <title>Sticker Story</title>
    <script src="../js/jquery-1.10.2.js"></script>
  	<script src="../js/bootstrap.min.js"></script>
<%--   	<%@ include file="../platform/include_start.jsp" %>	 --%>
	 <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  	<style>
  	body {
    	background-image: url("../img/background.png");
    	padding-top: 1px;
}
	}
	.rowHeader{
		background-color:#67B0D1;
	}
	#indexBtn > a {
		font-size:24px;color:#FFF;font-weight:bold;
	}
	#indexBtn > a:hover{
		color:black;
	}
  	
  	
    .contentDiv {
      width:100%;
      height:400px;
      border-color: black;
      border-width: thin;
      border-style: solid;
      border-radius: 4px;
      display: block;
      padding:5px; 
      overflow: auto;
    }
    
    .username {
      font-weight: bold;
      color: #555599;
    }
  
  </style>
  </head>
  <body>
    


<!-- bootstrap -->
<body>
  <div class="container">
    <div class="row">
    <div class="col-xs-9">
      <h1>Online Service</h1>
    </div>
    
    </div>
    <div class="row">
      <div class="col-xs-9">
        <div><h3>Chat</h3></div>
        <div class="contentDiv" id="chatDiv">
<!--           <div><span class="username">hsilomedus : </span><span>whass uuup?</span></div> -->
        </div>
      </div>
      <div class="col-xs-3">
        <div><h3>Users</h3></div>
        <div class="contentDiv" id="nicknamesBox">
<!--            <div class="username">cc123</div> -->
        </div>
      </div>
    </div>
    <div class="row" style="margin-top:10px;">
      <div class="col-xs-7"><input type="text" id="chatinput" class="form-control" placeholder="Type your message here."/></div>
      <div class="col-xs-2"><button id="chatbt" class="btn btn-primary" style="width:100%;">Send</button></div>
    </div>
  </div>

    
    
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src='../js/jquery-ui.js'></script>	
<script src="js/story-page.js" type="text/javascript"></script>
  
    <script>
    var sionName = "<%= sionName %>";//username
    var serverName = "<%= serverName %>"; //localhost
	var serverPort = "<%= serverPort %>"; //8081
	var contextPath = "<%= contextPath %>"; //Project_1
	//為了接收會員ID是要在這把宣告在這當開啟對話視窗才抓的到(傳給stroy-page.js)
	
	//從include_sticker.jsp 內的url後面的參數svcmember 可以用getParameter取
	var OlineSvc="<%= request.getParameter("svcmember")%>";
	//遇到是訪客用IP來當ID
/*	var OlineSvc="";
 	var userIP="";
	 $.getJSON("http://jsonip.com?callback=?", function (data) {
	  		userIP=data.ip;
	  		if("${userLoginId}"==""){
	  			 alert("2"+userIP);
	  			 OlineSvc="guest-"+userIP;
//	  	 		 alert("userIP"+userIP);
	  		 }else{
	  			 OlineSvc="${userLoginId}";
	  			 alert(OlineSvc);
	  		 }
	  		
	});
	 
	 */
	
	 
	 
	//按下送出將文字送到對話框然後再去呼叫story-page.js將文字傳送過去
   (function ($){
	$('#chatbt').click(function(){  //送出 -> click事件
		var userchat = $('#chatinput').val();//讀取chatinput所輸入的值-> 並放入userchat
		$('#chatinput').val("");//將值拿掉
		var chat="";
		//判別是否可以抓到ID 若無法抓到ID在聊天內容就給他變換成guest+IP
		if(sionName=="null"){
			chat = OlineSvc +" : " + userchat; //將使用者(guest+IP) 跟 userchat 串在一起
		}else{
			chat = sionName +" : " + userchat; //將使用者(sionName) 跟 userchat 串在一起
		}
		
		serviceChat(chat);//呼叫story-page.js 的 chatsend並帶參數
	});
	
    
	//將名字顯示在右邊對話框(可以抓使用者ID  但後臺管理員名子寫死所以帳號就要建立一個超級管理員的名子是超級管理員)
	$('#nicknamesBox').append(" <div class='username'>超級管理員</div>");
	$('#nicknamesBox').append(" <div class='username'>"+OlineSvc+"</div>");
	
	
    })(jQuery);
    
      </script>
  </body>
</html>
