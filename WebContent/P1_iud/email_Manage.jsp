<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Object sionName = session.getAttribute("userName");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Free Bootstrap Admin Template : Binary Admin</title>
<%@ page import="java.util.*"%>
<%@ page import="P6_contactUs.model.*"%>
<%
		ContactUsService conSvc = new ContactUsService();
		List<ContactUsVO> contactUsS = conSvc.getAll();
		pageContext.setAttribute("contactUsS",contactUsS);
		
		
		String serverName = request.getServerName() ;
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
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
		<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index.jsp">Binary admin</a>
			</div>
			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
				<c:if test="<%=sionName == null%>">
					<a href="P0_login/login.jsp"
						class="btn btn-danger square-btn-adjust">login</a>
				</c:if>
				<c:if test="<%=sionName != null%>">
		 			管理者，${userName}&nbsp;您好!!&nbsp; <a
						href="LoginServlet?action=logOut"
						class="btn btn-danger square-btn-adjust">Logout</a>
				</c:if>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		</nav>   
           <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					<li class="text-center">
                    	<img src="../img/find_user.png" class="user-image img-responsive"/>
					</li>
                    <li>
                        <a class="active-menu"  href="index.html"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a  href="ui.html"><i class="fa fa-desktop fa-3x"></i> UI Elements</a>
                    </li>
                    <li>
                        <a  href="tab-panel.html"><i class="fa fa-qrcode fa-3x"></i> Tabs & Panels</a>
                    </li>
						   <li  >
                        <a   href="chart.html"><i class="fa fa-bar-chart-o fa-3x"></i> Morris Charts</a>
                    </li>	
                      <li  >
                        <a  href="table.html"><i class="fa fa-table fa-3x"></i> Table Examples</a>
                    </li>
                    <li  >
                        <a  href="form.html"><i class="fa fa-edit fa-3x"></i> Forms </a>
                    </li>				
					                   
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                      </li>  
                  	<li>
                        <a  href="blank.html"><i class="fa fa-square-o fa-3x"></i> Blank Page</a>
                    </li>	
                </ul>
               
            </div>
            
        </nav>  
	
	<div id="page-wrapper">
	<div id="page-inner" style="padding-right:1%;">
	<br>
	<a href="../" style="text-decoration:none;"><i class="fa fa-reply fa-3x" style="color:black;display:inline;"></i></a>
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
        			<td>${contactUsS.contactUsDate}</td>
        			<td>${contactUsS.contactUsSubject}</td>
        			<td>${contactUsS.contactUsContent}</td>
        			<td>${contactUsS.contactUsReply}</td>
        			<td>
        			<c:if test='${contactUsS.contactUsReply==0}'>
        				<a href="<%=request.getContextPath() %>/P6_contactUs/ContactUsServlet?action=contactUs_Reply&contactUsId=${contactUsS.contactUsId}"><input type="button" class="btn btn-danger stop_contact" value="回復" ></a>
        			</c:if>
	         		<c:if test='${contactUsS.contactUsReply==1}'>
        				<input type="button" class="btn btn-danger open_contact" value="已回復" display>
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
		     
// 			    $('#example tbody').on('click', 'tr', function () {
// 			        var name = $('td', this).eq(0).text();
// 			        alert( 'You clicked on '+name+'\'s row' );
// 			    } );
/*
	     		$(".stop_contact").click(function(){
	     			var sel = $(this).closest('tr').find('td:nth-child(2)').text();
	     			var stopM = "Y";
	     			alert(sel);
			    	 //console.log($(this).closest('tr').find('td:eq(0)').text());
			     		swal({ title: "Are you sure?",
					 	text: "確定是否對"+sel+"此封訊息做出回覆?",
					  	type: "warning",   
					  	showCancelButton: true,   
					  	confirmButtonColor: "#DD6B55",   
					  	confirmButtonText: "Yes, do it!",   
					  	closeOnConfirm: false }, function(){
					  		stop_class(sel,stopM);
					  		swal("Success!", "已成功對"+sel+"做出停權處分","success"); 
					  		setTimeout("self.location.reload()",2000);
					  	});
			     		
	     		});
	     		
	     		$(".open_contact").click(function(){
	     			var sel = $(this).closest('tr').find('td:nth-child(1)').text();
	     			var openM = "N";
			    	 //console.log($(this).closest('tr').find('td:eq(0)').text());
			     		swal({ title: "Are you sure?",
					 	text: "確定是否對"+sel+"解除停權處分!!",
					  	type: "warning",   
					  	showCancelButton: true,   
					  	confirmButtonColor: "#DD6B55",   
					  	confirmButtonText: "Yes, do it!",   
					  	closeOnConfirm: false }, function(){
					  		stop_class(sel,openM);
					  		swal("Success!", "已成功對"+sel+"解除停權處分","success"); 
					  		setTimeout("self.location.reload()",2000);
					  	});
			     		
	     		});*/
		})(jQuery);
		
// 		function stop_class(name,stopType){
// 			$.get("stopAccount.jsp",{"name":name,"stopMessage":stopType},function(data){
//     		});
// 		}
	</script>
</body>
</html>