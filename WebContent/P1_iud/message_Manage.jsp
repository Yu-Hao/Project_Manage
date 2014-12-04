<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Object sionName = session.getAttribute("userName");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Free Bootstrap Admin Template : Binary Admin</title>
<%@ page import="java.util.*"%>
<%@ page import="P4_MessageBoard.model.*"%>
<%
		MsgService messageSvc = new MsgService();
		List<MsgVO> messageList = messageSvc.getAll();
		pageContext.setAttribute("messageList",messageList);
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
                <th>留言板流水號</th>
                <th>會員帳號</th>
                <th>留言板標題</th>
                <th>留言內容</th>
                <th>回覆內容</th>
                <th>建立時間</th>
                <th>是否封鎖</th>
                <th>封鎖設定</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>留言板流水號</th>
                <th>會員帳號</th>
                <th>留言板標題</th>
                <th>留言內容</th>
                <th>回覆內容</th>
                <th>建立時間</th>
                <th>是否封鎖</th>
                <th>封鎖設定</th>
            </tr>
        </tfoot>
 
        <tbody class="messageListEdit">
        	<c:forEach var="messageList" items="${messageList}">
        		<tr>
        			<td>${messageList.messageNum}</td>
        			<td>${messageList.member_loginID}</td>
        			<td>${messageList.title}</td>
        			<td>${messageList.content}</td>
        			<td>${messageList.replyfrom}</td>
        			<td>${messageList.build_time}</td>
        			<td>${messageList.message_stop}</td>
        			<td>
        			<c:if test='${messageList.message_stop==0}'>
        				<input type="button" class="btn btn-danger stop_class" value="封鎖">
        			</c:if>
        			<c:if test='${messageList.message_stop==1}'>
        				<input type="button" class="btn btn-danger open_class" value="解除封鎖">
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
		(function($) {
			 	$('#example').dataTable();

	     		$(".stop_class").click(function(){
	     			var sel = $(this).closest('tr').find('td:nth-child(2)').text();
			    	 //console.log($(this).closest('tr').find('td:eq(0)').text());
			     		swal({ title: "Are you sure?",
					 	text: "確定是否對"+sel+"的此筆留言，做出封鎖處分!!",
					  	type: "warning",   
					  	showCancelButton: true,   
					  	confirmButtonColor: "#DD6B55",   
					  	confirmButtonText: "Yes, do it!",   
					  	closeOnConfirm: false }, function(){
					  		stop_class(sel,1);
					  		swal("Success!", "已成功封鎖"+sel+"的此筆留言!!","success"); 
					  		setTimeout("self.location.reload()",2000);
					  	});
	     		});
	     		
	     		$(".open_class").click(function(){
	     			var sel = $(this).closest('tr').find('td:nth-child(2)').text();
			    	 //console.log($(this).closest('tr').find('td:eq(0)').text());
			     		swal({ title: "Are you sure?",
					 	text: "確定是否對"+sel+"的此筆留言，解除封鎖處分!!",
					  	type: "warning",   
					  	showCancelButton: true,   
					  	confirmButtonColor: "#DD6B55",   
					  	confirmButtonText: "Yes, do it!",   
					  	closeOnConfirm: false }, function(){
					  		stop_class(sel,0);
					  		swal("Success!","已將"+sel+"的此筆留言解除封鎖!!","success"); 
					  		setTimeout("self.location.reload()",2000);
					  	});
	     		});

		})(jQuery);
		
		function stop_class(name,i){
			$.get("stopMessage.jsp",{"name":name,"typeMath":i},function(data){
    		});
		}
	</script>
</body>
</html>