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
		ContactUsVO ctVO = (ContactUsVO)session.getAttribute("ctVO");
		pageContext.setAttribute("ctVO",ctVO);
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
		<div class="container">
			<div class="row">
      			<div class="col-md-12">
        			<div class="well well-sm">
         				<form class="form-horizontal" method="post" action="ContactUsServlet">
          					<fieldset>
            					<legend class="text-center header">Contact us</legend>    
<%--              					<c:forEach var="contactUsS" items="${contactUsS}"> --%>
	            					<div class="form-group">              
	              						<span class="col-md-2 col-md-offset-2 text-center">Your Name</span>          
	             						<div class="col-md-4">
						                	<input id="fname" name="name" type="text" placeholder="John Stuart" class="form-control" value="${ctVO.contactUsName}" required>
						              	  	<input type="hidden"  id="frommail" name="frommail" size="30" value="cecj0601@gmail.com" />
						              	  	<input type="hidden"  id="contactUsReply" name="contactUsReply" value="0" />
	              						</div>
	            					</div>    
               						<div class="form-group">
              							<span class="col-md-2 col-md-offset-2 text-center">E-mail</span>
              							<div class="col-md-4">
                							<input type="email" name="recipients" id="recipients" placeholder="XXXOOO@hotmail.com" class="form-control" required value="${ctVO.contactUsMail}">
              							</div>
            						</div>    
            						<div class="form-group">
              							<span class="col-md-2 col-md-offset-2 text-center">Subject</span>
              							<div class="col-md-4">
                							<input name="subject" id="subject" type="text" placeholder="Questions" class="form-control" required value="${ctVO.contactUsSubject}">
              							</div>
            						</div>
						            <div class="form-group">
						            	<span class="col-md-2 col-md-offset-2 text-center">Contact</span>
						              	<div class="col-md-4">
						                	<textarea class="form-control" id="userContents" name="userContents" rows="7" ></textarea>
						              	</div>
						            </div>
    								<div class="form-group">
						            	<span class="col-md-2 col-md-offset-2 text-center">Contact</span>
						              	<div class="col-md-4">
						                	<textarea class="form-control" id="contents" name="contents" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7" required></textarea>
						              	</div>
						            </div>
						            <div class="form-group">
						            	<div class="col-md-12 text-center">
						              		<button class="btn btn-danger " type="reset">RESET</button>
						              		<input type="button" class="btn btn-primary" name="send" id="send" value="送出">
						                	<input type="hidden" name="action" value="contactus" />
						              	</div>
            						</div>
<%--             					</c:forEach> --%>
          					</fieldset>
          				</form><!-- end form-horizontal -->
        			</div><!-- end well well-sm -->
      			</div><!-- end col-md-12 -->
			</div><!-- end row -->
		</div><!-- end container -->
	</div><!-- end page-inner -->
</div><!-- end page-wrapper -->

</div><!-- end WRAPPER  -->
	
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
		     
			 	var userContents = "${ctVO.contactUsContent}";
			 	$("#userContents").val(userContents);
			 	
// 			    $('#example tbody').on('click', 'tr', function () {
// 			        var name = $('td', this).eq(0).text();
// 			        alert( 'You clicked on '+name+'\'s row' );
// 			    } );

	     		$(".stop_class").click(function(){
	     			var sel = $(this).closest('tr').find('td:nth-child(1)').text();
	     			var stopM = "Y";
			    	 //console.log($(this).closest('tr').find('td:eq(0)').text());
			     		swal({ title: "Are you sure?",
					 	text: "確定是否對"+sel+"做出停權處分!!",
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
	     		
	     		$(".open_class").click(function(){
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
			     		
	     		});
		})(jQuery);
		
		function stop_class(name,stopType){
			$.get("stopAccount.jsp",{"name":name,"stopMessage":stopType},function(data){
    		});
		}
	</script>
</body>
</html>