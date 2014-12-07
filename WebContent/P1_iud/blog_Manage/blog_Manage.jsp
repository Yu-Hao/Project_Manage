<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../platform/include_title.jsp" %>

<%@ page import="P3_TravelDiary.model.*"%>
<%

		TravelDiaryService tdSvc = new TravelDiaryService();
		List<TravelDiaryVO> tdVO = tdSvc.getAll();
 		pageContext.setAttribute("tdVO",tdVO);
		
%>
 <link href="../../css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../../css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="../../js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../../css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
 	<link href='../../css/googleapis.css' rel='stylesheet' type='text/css' />

<!-- GOOGLE FONTS-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
<link href='../../css/googleapis.css' rel='stylesheet' type='text/css' />
<!-- <link href="css/style.css" rel='stylesheet' type='text/css' /> -->
<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
<link rel="stylesheet" href="../css/table_yuHao.css">

</head>
<body>
	<div id="wrapper">
		<%@ include file="../../platform/include_aHref2.jsp" %>
	
	
	<div id="page-wrapper">
	<div id="page-inner" style="padding-right:1%;">
	<br>
	<a href="../../index2.jsp" style="text-decoration:none;"><i class="fa fa-reply fa-3x" style="color:black;display:inline;"></i></a>
	<a href="addKnowledge.jsp"><input type="button"  class="btn btn-danger btn-lg" value="新增" style="float:right;"></a>
	<br>
	<br>
	
		<table id="example" class="display" cellspacing="0"  >
        <thead>
            <tr>
                <th>Blog筆數</th>
                <th>Blog建立者</th>
                <th>Blog標題</th>
                <th>Blog建立日期</th>
                <th>Blog內容</th>
                <th>Blog是否封鎖</th>
                <th>封鎖</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
            	<th>Blog筆數</th>
                <th>Blog建立者</th>
                <th>Blog標題</th>
                <th>Blog建立日期</th>
                <th>Blog內容</th>
                <th>Blog是否封鎖</th>
                <th>封鎖/解除封所</th>
            </tr>
        </tfoot>
 
        <tbody class="klVOEdit">
         <%int memCount=0; %>
        	<c:forEach var="tdVO" items="${tdVO}">
        		<tr>
        			<%memCount++;%>
        			<td><%=memCount%></td>
<%--         			<td>${klVO.knowledge_identity}</td> --%>
        			<td>${tdVO.member_loginID}</td>
        			<td>${tdVO.travelDiary_Name}</td>
        			<td>${tdVO.publish_date}</td>
        			<td>${tdVO.travelDiary_Content}</td>
<%--         			<td>${klVO.knowledge_img}</td> --%>
<%--         			<td>${klVO.knowledge_ImgFormat}</td> --%>
        			<td>
        				<c:if test="${tdVO.diary_class == 0}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;N</c:if>
        				<c:if test="${tdVO.diary_class == 1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Y</c:if>
        			</td>
<!--         		<td><input type="button" class="btn btn-danger" value="維護" ></td> -->
					<td>
						<c:if test="${tdVO.diary_class == 0}">
							<input type="button"  class="btn btn-danger stopBtn" id="${tdVO.travelDiary_ID}" value="封鎖" >
						</c:if>
        				<c:if test="${tdVO.diary_class == 1}">
							<input type="button"  class="btn btn-danger openBtn" id="${tdVO.travelDiary_ID}" value="解除封鎖" >
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
	<script src="../../js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="../../js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="../../js/jquery.metisMenu.js"></script>
	<!-- MORRIS CHART SCRIPTS -->
	<script src="../../js/morris/raphael-2.1.0.min.js"></script>
	<script src="../../js/morris/morris.js"></script>
	<script src="../../js/custom.js"></script>
	<script src="../js/jquery-1.11.1.js"></script>
	<script src="../js/DataTable-1.10.4.js"></script>
	<script src="../seetalertjs/sweet-alert.js"></script> 
	
	<!-- CUSTOM SCRIPTS -->
	
	<script>
		(function($) {
			
			/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
			

			//SSE服務瀏覽器端實作
			var getSvcUrl="../../platform/getSvc.jsp";
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
					
//					應該是要在關閉服務的時候再update null字串(所以是在StoryWebSocket這裡)		
//			 		servletURL = "P9_OnlineService/OnlineServiceServlet";
//			   		$.ajax({
//			     		"type": 'post',
//			       		"url": servletURL,
//			       		"data": {"action":"changeToNULL", "svcID":propID},
//			       		"dataType":"text",
//			       		"async":false,
//			       		"success":function(datas){
			      			
//			      		}
//			      	});
				}));
				/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
			
			
			
			
			
			 	$('#example').dataTable();
			 	$(".stopBtn").click(function(){
			 		//var sel = $(this).closest('tr').find('td:nth-child(1)').text();
	     			var sel = $(this).attr("id");
	     			var selUserName = $(this).closest('tr').find('td:nth-child(2)').text();
			     		swal({ title: "Are you sure?",
					 	text: "確定是否封鎖"+selUserName+"的此筆Blog!!",
					  	type: "warning",   
					  	showCancelButton: true,   
					  	confirmButtonColor: "#DD6B55",   
					  	confirmButtonText: "Yes, do it!",   
					  	closeOnConfirm: false }, function(){
					  		stop_class(sel,1);
					  		swal("Success!", "已成功封鎖"+selUserName+"的此筆Blog!!","success"); 
					  		setTimeout("self.location.reload()",2000);
					  	});
	     		});
			 	
			 	$(".openBtn").click(function(){
			 		//var sel = $(this).closest('tr').find('td:nth-child(1)').text();
	     			var sel = $(this).attr("id");
	     			var selUserName = $(this).closest('tr').find('td:nth-child(2)').text();
			     		swal({ title: "Are you sure?",
					 	text: "確定是否對"+selUserName+"的此筆Blog解除封鎖!!",
					  	type: "warning",   
					  	showCancelButton: true,   
					  	confirmButtonColor: "#DD6B55",   
					  	confirmButtonText: "Yes, do it!",   
					  	closeOnConfirm: false }, function(){
					  		stop_class(sel,0);
					  		swal("Success!", "已成功解除"+selUserName+"的此筆Blog!!","success"); 
					  		setTimeout("self.location.reload()",2000);
					  	});
	     		});
		})(jQuery);
		
		function stop_class(name,typeKind){
			$.get("stopBlob.jsp",{"name":name,"typeKind":typeKind},function(data){
    		});
		}
			 	
			 	
	</script>
</body>
</html>