<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Object sionName = session.getAttribute("userName");
%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Free Bootstrap Admin Template : Binary Admin</title>
<%@ page import="java.util.*"%>
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
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom:0;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index2.jsp">下一站，幸福</a>
		</div>
		<div
			style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
			管理者，${userName}&nbsp;您好!!&nbsp; <a href="LoginServlet?action=logOut"
				class="btn btn-warning square-btn-adjust">Logout</a>
		</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li class="text-center"><img src="img/benny.jpg"
					class="user-image img-responsive" /></li>
				<li><a class="active-menu" href="index2.jsp"><i
						class="fa fa-dashboard fa-3x"></i> Dashboard</a></li>
<!-- 				<li><a href="ui.html"><i class="fa fa-desktop fa-3x"></i> -->
<!-- 						UI Elements</a></li> -->
<!-- 				<li><a href="tab-panel.html"><i class="fa fa-qrcode fa-3x"></i> -->
<!-- 						Tabs & Panels</a></li> -->
				<li><a href="chart.jsp"><i
						class="fa fa-bar-chart-o fa-3x"></i> Morris Charts</a></li>
<!-- 				<li><a href="table.html"><i class="fa fa-table fa-3x"></i> -->
<!-- 						Table Examples</a></li> -->
<!-- 				<li><a href="form.html"><i class="fa fa-edit fa-3x"></i> -->
<!-- 						Forms </a></li> -->


<!-- 				<li><a href="#"><i class="fa fa-sitemap fa-3x"></i> -->
<!-- 						Multi-Level Dropdown<span class="fa arrow"></span></a> -->
<!-- 					<ul class="nav nav-second-level"> -->
<!-- 						<li><a href="#">Second Level Link</a></li> -->
<!-- 						<li><a href="#">Second Level Link</a></li> -->
<!-- 						<li><a href="#">Second Level Link<span class="fa arrow"></span></a> -->
<!-- 							<ul class="nav nav-third-level"> -->
<!-- 								<li><a href="#">Third Level Link</a></li> -->
<!-- 								<li><a href="#">Third Level Link</a></li> -->
<!-- 								<li><a href="#">Third Level Link</a></li> -->

<!-- 							</ul></li> -->
<!-- 					</ul></li> -->
<!-- 				<li><a href="blank.html"><i class="fa fa-square-o fa-3x"></i> -->
<!-- 						Blank Page</a></li> -->
			</ul>

		</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<center>
							<h2 style="color:#d86714;">
								<b>後台管理介面</b>
							</h2>
						</center>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-2 col-sm-6 col-xs-6">
						<a href="P1_iud/newsAndKnowledge.jsp"
							style="text-decoration: none">
							<div class="panel panel-back noti-box">
								<span class="icon-box bg-color-brown set-icon" style="background-color:#915eff"> <i
									class="fa fa-bolt"></i>
								</span>
								<div class="text-box">
									<br>
									<br>
									<br>
									<br>
									<h5 class="main-text" align='center'>
										最新消息<br>&<br>急救小知識管理
									</h5>
									<h6 class="text-muted "></h6>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-6">
						<a href="P1_iud/email_Manage.jsp" style="text-decoration: none">
							<div class="panel panel-back noti-box">
								<span class="icon-box bg-color-red set-icon"> <i
									class="fa fa-envelope-o fa-1x"></i>
								</span>
								<div class="text-box">
									<br>
									<br>
									<br>
									<br>
									<h4 class="main-text notReplyMail">無客服訊息需回復</h4>
									<h6 class="text-muted replyMail"></h6>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-6">
						<a href="P1_iud/member_Manage.jsp" style="text-decoration: none">
							<div class="panel panel-back noti-box">
								<span class="icon-box bg-color-green set-icon"> <i
									class="fa fa-user"></i>
								</span>

								<div class="text-box">
									<br>
									<br>
									<br>
									<br>
									<h4 class="main-text memberText">總會員人數</h4>
									<h6 class="text-muted memberCount"></h6>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-6">
						<a href="P1_iud/viewName_Manage.jsp" style="text-decoration: none">
							<div class="panel panel-back noti-box">
								<span class="icon-box set-icon" style="background-color:#0fbbff"> <i
									class="fa fa-camera"></i>
								</span>
								<div class="text-box">
									<br>
									<br>
									<br>
									<br>
									<h4 class="main-text">總景點數量</h4>
									<h6 class="text-muted viewCount"></h6>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-6">
						<a href="P1_iud/message_Manage.jsp" style="text-decoration: none">
							<div class="panel panel-back noti-box">
								<span class="icon-box bg-color-brown set-icon" style="background-color:#ffc870"> <i
									class="fa fa-pencil"></i>
								</span>
								<div class="text-box">
									<br>
									<br>
									<br>
									<br>
									<h4 class="main-text">留言板筆數</h4>
									<h6 class="text-muted messageCount"></h6>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-6">
						<a href="P1_iud/message_Manage.jsp" style="text-decoration: none">
							<div class="panel panel-back noti-box">
								<span class="icon-box bg-color-brown set-icon" style="background-color:#ff56bb"> <i
									class="fa fa-book"></i>
								</span>
								<div class="text-box">
									<br>
									<br>
									<br>
									<br>
									<h4 class="main-text" align='center'>Blog筆數</h4>
									<h3 class="text-muted blogCount" align='center'>
										共有<%=blogAllCount%>筆
									</h3>
								</div>
							</div>
						</a>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">Bar Chart Example</div>
							<div class="panel-body">
								<div id="morris-bar-chart"></div>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12" style="padding-top:100px">
						<div
							class="panel panel-primary text-center no-boder bg-color-green">
							<div class="panel-body">
								<i class="fa fa-comments-o fa-5x"></i>
								<div id="onlinesvc">
									<!--          							<a href="#" id=""><p>※線上克服</p></a>     -->
								</div>

							</div>
							<div class="panel-footer back-footer-green">線上客服</div>
						</div>
<!-- 						<div class="panel panel-primary text-center no-boder bg-color-red"> -->
<!-- 							<div class="panel-body"> -->
<!-- 								<i class="fa fa-edit fa-5x"></i> -->
<!-- 								<h3>20,000</h3> -->
<!-- 							</div> -->
<!-- 							<div class="panel-footer back-footer-red">Articles Pending -->

<!-- 							</div> -->
<!-- 						</div> -->
					</div>

				</div>
<!-- 				/. ROW  -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-3 col-sm-12 col-xs-12"> -->
<!-- 						<div -->
<!-- 							class="panel panel-primary text-center no-boder bg-color-green"> -->
<!-- 							<div class="panel-body"> -->
<!-- 								<i class="fa fa-comments-o fa-5x"></i> -->
<!-- 								<h4>200 New Comments</h4> -->
<!-- 								<h4>See All Comments</h4> -->
<!-- 							</div> -->
<!-- 							<div class="panel-footer back-footer-green"> -->
<!-- 								<i class="fa fa-rocket fa-5x"></i> Lorem ipsum dolor sit amet -->
<!-- 								sit sit, consectetur adipiscing elitsit sit gthn ipsum dolor sit -->
<!-- 								amet ipsum dolor sit amet -->

<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="js/jquery.metisMenu.js"></script>
<!-- MORRIS CHART SCRIPTS -->
<script src="js/morris/raphael-2.1.0.min.js"></script>
<script src="js/morris/morris.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="js/custom.js"></script>
<script>
(function ($) {
	
/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
		

//SSE服務瀏覽器端實作
var getSvcUrl="platform/getSvc.jsp";
var source = new EventSource(getSvcUrl);
//開啟連結的路徑
var url="";
//判別是否有傳回相同ID
var getID="";
source.addEventListener('message', function(e) {
		if((e.data).length!=0){
		 console.log(e.data);
		 console.log("1"+getID);
		 //當第一次近來時候一定不一樣所以只會append 一次
		 if(e.data!=getID){
		  url="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%>/Project_1/P9_OnlineService/OnlineService.jsp?svcmember="+e.data+"&admin=admin123";
		 
		 $('#onlinesvc').append("<a href='#' style='color:white;text-decoration: none' class='removeSvc' id="+url+"><p>※您有新訊息※</p></a> ");
		 getID=e.data;
		 console.log("2"+getID);
		
		}
		<%-- 				  url="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P9_OnlineService/OnlineService.jsp?svcmember="+e.data; --%>
		// 				  $('#onlinesvc').append("<a href="+url+"><p>※線上克服2</p></a> ");
		// 					$('#tiles').append("<li id='"+item.TravelDiary_ID+"'>"+item.TravelDiary_Content+"<p>"+item.TravelDiary_Name+"</p></li>");
		// 				  var notifymsg = JSON.parse(e.data);
		// 				  frdplatform = notifymsg.cooperation_friend;
		// 				  $('#dialog-checkCoFromFrd').dialog('option', 'title', notifymsg.frdName+' 邀請你一起規劃路線');
		// 				  $('#dialog-checkCoFromFrd > h4').text(notifymsg.invite_msg);
		// 				  dialogCoFromFrd.dialog("open");	
		  }else{
			  console.log("3"+getID);
			  console.log(e.data);
			  //當是null時候清空
			  getID="";
		  }
		}, false);
		
	var propID='';
	var servletURL='';
	//當後臺管理者下超連結的時候將連結取消掉
	//因為是動態生成的所以要用on來綁他老爸底下小孩有符合.removeSvc都可以使用click的事件
	$('#onlinesvc').on('click','.removeSvc',(function(){
		window.open(propID=$(this).prop('id'), "_blank", " top=5, left=50, width=660, height=600");
		//當按下管理者按下click時候把超連結移除
		//並去資料庫將這一筆的欄位改成null
		//這樣在getSvc.jsp就不會傳資料過來
		propID=$(this).prop('id');
		$(this).remove();
		
//		應該是要在關閉服務的時候再update null字串(所以是在StoryWebSocket這裡)		
// 		servletURL = "P9_OnlineService/OnlineServiceServlet";
//   		$.ajax({
//     		"type": 'post',
//       		"url": servletURL,
//       		"data": {"action":"changeToNULL", "svcID":propID},
//       		"dataType":"text",
//       		"async":false,
//       		"success":function(datas){
      			
//      		}
//      	});
	}));
	/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
	
	
  //上方工具列滑鼠滑入自動彈出
    $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });
  //上方工具列滑鼠滑入自動彈出
    
  	var serverName = "<%=request.getServerName()%>";
	var serverPort = "<%=request.getServerPort()%>";
	var contextPath = "<%=request.getContextPath()%>";

		//E-mail計數
		var contactUsUrl = contextPath + "/P6_contactUs/ContactUsServlet";
		$.getJSON(contactUsUrl, {
			'action' : 'contactUs_Count'
		}, function(datas) {
			$.each(datas, function(i, item) {
				//alert(item.count);
				$(".notReplyMail").html("待回復訊息:");
				$(".replyMail").html(
						"<h3 align='center'>" + item.contactCount
								+ "則</h3>");

			});
		});

		//會員計數
		var memberUrl = contextPath + "/P1_iud/IUDServlet";
		$.getJSON(memberUrl, {
			'action' : 'member_Count'
		}, function(datas) {
			$.each(datas, function(i, item) {
				$(".memberCount").html(
						"<h3 align='center'>" + item.member_Count
								+ "人</h3>");
			});
		});

		//景點計數
		var imageUrl = contextPath + "/P2_route/ImgTop6servlet";
		$.getJSON(imageUrl, {
			'action' : 'img_Count'
		}, function(datas) {
			$.each(datas, function(i, item) {
				$(".viewCount").html(
						"<h3 align='center'>" + item.viewNameCount+ "處</h3>");
			});
		});

		$(".messageCount").html("<h3 align='center'>共有" +<%=messagelist.size()%>+ "筆</h3>");

		//setTimeout("self.location.reload()",5000);
	})(jQuery);
</script>
</body>
</html>
