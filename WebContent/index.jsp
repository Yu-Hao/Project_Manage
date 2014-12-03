<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<%
		Object sionName = session.getAttribute("userName");
	%>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
    <%@ page import="java.util.*" %>
    <%@ page import="P4_MessageBoard.model.*,P3_TravelDiary.model.*"%>
    
<%
	//message
	MsgService msgSvc = new MsgService();
	List<MsgVO> messagelist = msgSvc.getAll();
	pageContext.setAttribute("messagelist",messagelist);
	
	//blog
	TravelDiaryService blogSvc = new TravelDiaryService();
	String blogAllCount = blogSvc.getAllCount();
%>
	
	<!-- BOOTSTRAP STYLES-->
    <link href="css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
 	<link href='css/googleapis.css' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom:0;">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">下一站，幸福</a> 
            </div>
            
  		<div style="color: white;padding: 15px 50px 5px 50px;float: right;font-size: 16px;">
			<c:if test="<%=sionName == null %>">
				<a href="P0_login/login.jsp" class="btn btn-danger">login</a>
			</c:if>
			<c:if test="<%=sionName != null %>">
	 			管理者，${userName}&nbsp;您好!!&nbsp; <a href="LoginServlet?action=logOut" class="btn btn-danger square-btn-adjust">Logout</a> 
			</c:if> 
		</div>
      </nav>
      </div>
    <div id="" class="">
      <div class="">
      	  <div class="col-xs-5"></div>
          <div class=" col-xs-7">
              <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;管理者登入</h2> 
          </div>
          <hr>
           <hr>
            <hr style="color:red;">
          <div class="modal-body">
              <div class="row">
              	  <div class="col-xs-4"></div>
                  <div class="col-xs-4">
                      <div class="well">
                          <form id="loginForm" method="POST" action="login" novalidate="novalidate">
                              <div class="form-group">
                                  <label for="username" class="control-label">Username</label>
                                  <input type="text" class="form-control" id="inputLoginId" name="inputLoginId" value="" required="" title="Please enter you username" placeholder="請輸入帳號"  autofocus >
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="inputPassword" name="inputPassword" value="" required="" title="Please enter your password" placeholder="請輸入密碼">
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>
                              <div class="checkbox">
                                  <label>
                                      <input type="checkbox" name="remember" id="remember"> Remember login
                                  </label>
                                  <p class="help-block">(if this is a private computer)</p>
                              </div>
                              <button type="submit" class="btn btn-success btn-block" id="loginBtn">Login</button>
                              <input type="hidden" name="action" value="LoginIdCheck">
                              <h2 style="color:red;">${errorMSG}</h2>
                          </form>
                      </div>
                  </div>
                  <div class="col-xs-4"></div>
              </div>
          </div>
      </div>
  </div>




<!-- ***********************script************************** -->
   
<!-- jQuery Version 1.11.0 -->

<!-- Bootstrap Core JavaScript -->
<!-- <script src="js/bootstrap.min.js"></script>  -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
(function ($) {
	var serverName = "<%= request.getServerName()%>";
	var serverPort = "<%= request.getServerPort()%>";
	var contextPath = "<%= request.getContextPath()%>";

	//照片輪播間格秒數
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });
  //照片輪播間格秒數
  
  //上方工具列滑鼠滑入自動彈出
    $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });
  //上方工具列滑鼠滑入自動彈出
  
  //登入處裡*****************************
  	
    $("#loginBtn").click(function(){
    	
    	$("#errorId").html("");
    	$("#errorPassword").html("");
    	var loginId = $("#inputLoginId").val();
    	var password = $("#inputPassword").val();
    	if($.trim(loginId).length==0){
    		$("#errorId").html("&nbsp;帳號欄位不能空白!!");
    		return false;
    	}
    	else if($.trim(password).length == 0){
    		$("#errorPassword").html("&nbsp;密碼欄位不能空白!!");
    		return false;
    	}
    	
    	//return true;
    });
  	
  
  
  
	$(".noLogin").click(function(){	
		//alert("請先登入會員!!");
		sweetAlert("此功能需先行登入會員!!","","warning");
		$("#ok_btn123456").click(function(){
			window.location.href="http://"+serverName+":"+ serverPort + contextPath +"/index.jsp";
		});
			
	});
	

	
})(jQuery);

		
 	
</script>

</body>
</html>
