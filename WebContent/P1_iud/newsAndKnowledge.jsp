<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>

<%@ page import="P6_contactUs.model.*,P5_index.model.*"%>
<%
		ContactUsService conSvc = new ContactUsService();
		List<ContactUsVO> contactUsS = conSvc.getAll();
		pageContext.setAttribute("contactUsS",contactUsS);
		
		knowledgeDAO klDAO = new knowledgeDAO();
		String knowledgeCount = klDAO.getAllCount();
		
		newsDAO newsDAO = new newsDAO();
		String newsCount = newsDAO.getAllCount();
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
	
</head>
<body>
	<div id="wrapper">
		 <%@ include file="../platform/include_aHref.jsp" %>
	   
	
<div id="page-wrapper">
	<div id="page-inner" style="padding-right:1%;">
		<br>
		<a href="../index2.jsp" style="text-decoration:none;"><i class="fa fa-reply fa-3x" style="color:black;display:inline;"></i></a>
		<br><br>
		<div class="row">
                	<div class="col-md-6 col-sm-6 col-xs-6">   
	                	<a href="news_Manage/news_Manage.jsp" style="text-decoration: none">          
							<div class="panel panel-back noti-box">
		               			<span class="icon-box bg-color-brown set-icon" style="margin-left:200px;background-color:#60b2ff">
		                    		<i class="fa fa-bell-o"></i>
		                		</span>
			                	<div class="text-box" >
			                		<br><br><br><br>
			                    	<p class="main-text" align='center'>最新消息&nbsp;&nbsp;管理</p>
			                    	<h3 class="text-muted " align='center'>
			                    		<c:if test='<%=!newsCount.equals("0")%>'>
			                    			共<%=newsCount%>筆
			                    		</c:if>
			                    		<c:if test='<%=newsCount.equals("0")%>'>
			                    			尚無資料
			                    		</c:if>
			                    	</h3>
			                	</div>
		             		</div>
	             		</a>  
			     	</div>
	                <div class="col-md-6 col-sm-6 col-xs-6">    
	               	 	<a href="knowledge_Manage/knowledge_Manage.jsp" style="text-decoration: none">       
							<div class="panel panel-back noti-box">
		               			<span class="icon-box bg-color-red set-icon" style="margin-left:200px;">
		                   			<i class="fa fa-plus" ></i>
		                		</span>
		                		<div class="text-box" >
		                			<br><br><br><br>
		                			<p class="main-text notReplyMail"  align='center'>急救小知識&nbsp;&nbsp;管理</p>
		                    		<h3 class="text-muted replyMail" align='center'>
		                    			<c:if test='<%=!knowledgeCount.equals("0")%>'>
			                    			共<%=knowledgeCount%>筆
			                    		</c:if>
			                    		<c:if test='<%=knowledgeCount.equals("0")%>'>
			                    			尚無資料
			                    		</c:if>
		                    		</h3>
		                		</div>
		             		</div>
	             		</a>
			     	</div>
		</div><!-- end row  -->
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
		})(jQuery);
	</script>
</body>
</html>