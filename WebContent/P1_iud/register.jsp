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
<%@ page import="P1_iud.model.*"%>
<%
	MemberService memSvc = new MemberService();
		List<MemberVO> memberList = memSvc.getAll();
		pageContext.setAttribute("memberList",memberList);
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
	<div id="page-inner" style="padding-top:5%;padding-right:1%;">
		<table id="example" class="display" cellspacing="0"  >
        <thead>
            <tr>
                <th>會員帳號</th>
                <th>會員信箱</th>
                <th>會員權限</th>
                <th>會員權限</th>
                <th>會員性別</th>
                <th>會員生日</th>
                <th>會員地址</th>
                <th>會員建立時間</th>
                <th>會員資料最後修改時間</th>
                <th>停權處份</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>會員帳號</th>
                <th>會員信箱</th>
                <th>會員權限</th>
                <th>會員停權</th>
                <th>會員性別</th>
                <th>會員生日</th>
                <th>會員地址</th>
                <th>會員建立時間</th>
                <th>會員資料最後修改時間</th>
                <th>停權處份</th>
            </tr>
        </tfoot>
 
        <tbody class="memberListEdit">
        	<c:forEach var="memberList" items="${memberList}">
        		<tr>
        			<td id="${memberList.member_loginID}">${memberList.member_loginID}</td>
        			<td>${memberList.member_email}</td>
        			<td>${memberList.member_class}</td>
        			<td>${memberList.member_gender}</td>
        			<td>${memberList.member_birthday}</td>
        			<td>${memberList.member_address}</td>
        			<td>${memberList.member_buildtime}</td>
        			<td>${memberList.member_updateTime}</td>
        			<td><input type="button" class="btn btn-danger stop_class" value="停權"></td>
        		</tr>
        	</c:forEach>
        </tbody>
    </table>
    <table><tbody id="rrr"><tr><td>3333</td><td><input type="submit" value="55"/></td></tr></tbody></table>
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

	     $(".stop_class").click(function(){
	    	 console.log($(this).closest('tr').find('td:eq(0)').text());
	    	 //console.log($('#rrr > tr > td:first').text());
	    	 //console.log($(':button').text());
	     		swal({ title: "Are you sure?",
			 	text: "You will not be able to recover this imaginary file!",
			  	type: "warning",   
			  	showCancelButton: true,   
			  	confirmButtonColor: "#DD6B55",   
			  	confirmButtonText: "Yes, delete it!",   
			  	closeOnConfirm: false }, function(){
			  		var sel = $(this).closest('tr').find('td:nth-child(1)').text();
			  		stop_class(sel);
			  		swal("Deleted!", "Your imaginary file has been deleted.","success"); });
	     });
	     
	     

		})(jQuery);
		
		function stop_class(name){
			$.get("checkAccount.jsp",{"name":name},function(data){
    			//$("#errName").text(data);
    			
    			if(data==1){
    				$("#checkAccount").html("<span id='chkAccount' style='color:red;'><img src=images/errorImg.png />此組帳號已有人使用</span>");
    				$("#accountLabel").prop("hidden",false);
    			}else{
    				$("#checkAccount").html("<span id='chkAccount' style='color:blue;'><img src=images/OK.png />此組帳號可以使用</span>");
    				$("#accountLabel").prop("hidden",true);
    			}
    			$("#loadding").prop("hidden",true);
    		});
		}
	</script>
</body>
</html>