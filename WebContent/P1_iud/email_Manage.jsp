<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>
<%@ page import="P6_contactUs.model.*"%>
<%
		ContactUsService conSvc = new ContactUsService();
		List<ContactUsVO> contactUsS = conSvc.getAll();
		pageContext.setAttribute("contactUsS",contactUsS);
%>
 <link href="../css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
 <link href="../css/font-awesome.css" rel="stylesheet" />
  <!-- MORRIS CHART STYLES-->
 <link href="../js/morris/morris-0.4.3.min.css" rel="stylesheet" />
     <!-- CUSTOM STYLES-->
 <link href="../css/custom.css" rel="stylesheet" />
  <!-- GOOGLE FONTS-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
 	<link href='../css/googleapis.css' rel='stylesheet' type='text/css' />

<!-- GOOGLE FONTS-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
<link href='../css/googleapis.css' rel='stylesheet' type='text/css' />
<!-- <link href="css/style.css" rel='stylesheet' type='text/css' /> -->
<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="seeetalertcss/sweet-alert.css">
<link rel="stylesheet" href="css/table_yuHao.css">
	
</head>
<body>
	<div id="wrapper">
	  <%@ include file="../platform/include_aHref.jsp" %>
	  
	  
	<div id="page-wrapper">
	<div id="page-inner" style="padding-right:1%;">
	<br>
	<a href="../index2.jsp" style="text-decoration:none;"><i class="fa fa-reply fa-3x" style="color:black;display:inline;"></i></a>
	<br>
	<br>
	
		<table id="example" class="display" cellspacing="0"  >
        <thead>
            <tr>
                <th>客服流水號</th>
                <th>使用者姓名</th>
                <th>使用者信箱</th>
                <th>發問日期</th>
                <th>發問主題</th>
                <th>發問內容</th>
                <th>是否回覆</th>
                <th>回覆訊息</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>客服流水號</th>
                <th>使用者姓名</th>
                <th>使用者信箱</th>
                <th>發問日期</th>
                <th>發問主題</th>
                <th>發問內容</th>
                <th>是否回覆</th>
                <th>回覆訊息</th>
            </tr>
        </tfoot>
 
        <tbody class="contactUsEdit">
        	<c:forEach var="contactUsS" items="${contactUsS}">
        		<tr>
        			<td>${contactUsS.contactUsId}</td>
        			<td>${contactUsS.contactUsName}</td>
        			<td>${contactUsS.contactUsMail}</td>
        			<td>${contactUsS.contactUsDateS}</td>
        			<td>${contactUsS.contactUsSubject}</td>
        			<td>${contactUsS.contactUsContent}</td>
        			<td>${contactUsS.contactUsReply}</td>
        			<td>
        			<c:if test='${contactUsS.contactUsReply==0}'>
        				<a href="<%=request.getContextPath() %>/P6_contactUs/ContactUsServlet?action=contactUs_Reply&contactUsId=${contactUsS.contactUsId}"><input type="button" class="btn btn-danger stop_contact" value="回復" ></a>
        			</c:if>
	         		<c:if test='${contactUsS.contactUsReply==1}'>
        				<input type="button" class="btn btn-danger open_contact" value="已回復" style="display:display;">
        			</c:if>
        			</td>
        		</tr>
        	</c:forEach>
        </tbody>
    </table>
	</div>
	</div>
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="../js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="../js/jquery.metisMenu.js"></script>
	<!-- MORRIS CHART SCRIPTS -->
	<script src="../js/morris/raphael-2.1.0.min.js"></script>
	<script src="../js/morris/morris.js"></script>
	<script src="../js/custom.js"></script>
	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/DataTable-1.10.4.js"></script>
	<script src="seetalertjs/sweet-alert.js"></script> 
	
	<!-- CUSTOM SCRIPTS -->
	
	<script>
			
	/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
	

	//SSE服務瀏覽器端實作
	var getSvcUrl="../platform/getSvc.jsp";
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
			
//			應該是要在關閉服務的時候再update null字串(所以是在StoryWebSocket這裡)		
//	 		servletURL = "P9_OnlineService/OnlineServiceServlet";
//	   		$.ajax({
//	     		"type": 'post',
//	       		"url": servletURL,
//	       		"data": {"action":"changeToNULL", "svcID":propID},
//	       		"dataType":"text",
//	       		"async":false,
//	       		"success":function(datas){
	      			
//	      		}
//	      	});
		}));
		/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
	
	

	
	
	
	
	
	
	
	
		(function($) {
			 	$('#example').dataTable();
		})(jQuery);
	</script>
</body>
</html>