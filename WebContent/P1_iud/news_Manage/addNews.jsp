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
<%@ page import="P1_iud.model.*,P2_route.model.*,java.text.*"%>
<%
		MemberService memSvc = new MemberService();
		List<MemberVO> memberList = memSvc.getAll();
		pageContext.setAttribute("memberList",memberList);
		
		P2_route.model.viewnameService viewSvc = new P2_route.model.viewnameService();
		List<P2_route.model.viewnameVO> viewList = viewSvc.getViewAll();
		pageContext.setAttribute("viewList",viewList);
		
		Date date = new Date();
	    SimpleDateFormat simDate = new SimpleDateFormat("yyyy-MM-dd");       
	       
	    java.sql.Date today =java.sql.Date.valueOf(simDate.format(date));  
		
%>
 <link href="../../css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../../css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="../../js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../../css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<!--  	<link href='../../css/googleapis.css' rel='stylesheet' type='text/css' /> -->

<!-- GOOGLE FONTS-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
<link href='../../css/googleapis.css' rel='stylesheet' type='text/css' />
<!-- <link href="css/style.css" rel='stylesheet' type='text/css' /> -->
<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
	
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
				<a class="navbar-brand" href="../../index.jsp">Binary admin</a>
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
                    	<img src="../../img/find_user.png" class="user-image img-responsive"/>
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
			<div class="col-sm-10">
	            <h3><b>&nbsp;&nbsp;&nbsp;新增最新消息:</b></h3>
	            <div class="" >
	            	<form method="post" action="addNews">
	                <div class="panel-body form-horizontal payment-form">
	                	<div class="form-group">
	                        <label class="col-sm-3 control-label">最新消息主題:</label>
	                        <div class="col-sm-7">
	                            <input type="text" class="form-control" id="news_title"  placeholder="請輸入最新消息主題" name="news_title">
	                        	<span id="checkNews_title" style="font-size:18px;color:red;"></span>                            
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-3 control-label ">選擇活動地點:</label>
	                        <div class="col-sm-4">
	                        	<select id="news_image" name="news_image" class="form-control" >
	                        		<option value="noChoose" >---------請選擇---------</option>
	                        		<c:forEach var="viewList" items="${viewList}">
	                        			<option value="${viewList.viewID}" >${viewList.viewname}</option>
	                        		</c:forEach>
	                        	</select>
								<span id="checkNews_image" style="font-size:18px;color:red;"></span>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-3 control-label">最新消息內容:</label>
	                        <div class="col-sm-7">
	                            <textarea class="form-control"  id="news_Content" name="news_Content" placeholder="Enter your content." rows="7" required wrap="physical"></textarea>
								<span id="checkNews_Content" style="font-size:18px;color:red;"></span>
	                        </div>
	                    </div>
	                    <br class="addViewPrv">
	                    <div class="form-group">
	                    	<div class="col-sm-4 text-right">
								<input type="button" class="btn btn-default preview-add-button btn-warning"  id="fakeData" value="data"/>
							</div>
	                        <div class="col-sm-6 text-right">
	                        	<input type="reset"  class="btn btn-default preview-add-button btn-danger" value="Reset" id="cleanBtn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="submit" class="btn btn-default preview-add-button btn-success"  id="subBtn" value="送 出"/>
	                            <input type="hidden" name="news_date" value="<%=today%>">
	                            <input type="hidden" name="action" value="addNews">
	                        </div>
	                    </div>
	                </div>
	                </form>
	            </div>            
	        </div> <!-- / panel preview -->
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
		//focus
		$("#news_title").focus(function(){
			$("#checkNews_title").html("");
		});
		$("#news_image").focus(function(){
			$("#checkNews_image").html("");
		});
		$("#news_Content").focus(function(){
			$("#checkNews_Content").html("");
		});
		
		//blur
		$("#news_title").blur(function(){
			var news_title = $.trim($(':text[id="news_title"]').val());
			if(news_title == ""){
				$("#checkNews_title").html("<img src=../images/errorImg.png />標題欄位不可空值");
				return;
			}
		});
		
		$("#news_image").blur(function(){
			var news_image = $.trim($("#news_image").val());
			if(news_image == "noChoose"){
				$("#checkNews_image").html("<img src=../images/errorImg.png />景點選擇欄位未選擇");
				return;
			}
		});
		
		$("#news_Content").blur(function(){
			var news_Content = $.trim($("#news_Content").val());
			if(news_Content == ""){
				$("#checkNews_Content").html("<img src=../images/errorImg.png />內容欄位不可空值");
				return;
			}
		});
		
		$("#subBtn").click(function(){  
			var news_title = $.trim($(':text[id="news_title"]').val());
			var news_image = $.trim($("#news_image").val());
			var news_Content = $.trim($("#news_Content").val());
			if(news_title == ""||news_image == "noChoose"||news_Content == ""){
				
				if(news_title == ""){
					$("#checkNews_title").html("<img src=../images/errorImg.png />標題欄位不可空值");
				}
				
				if(news_image == "noChoose"){
					$("#checkNews_image").html("<img src=../images/errorImg.png />景點選擇欄位未選擇");
				}
				if(news_Content == ""){
					$("#checkNews_Content").html("<img src=../images/errorImg.png />內容欄位不可空值");
				}
				return false;
			}
		});
		
		$("#cleanBtn").click(function(){
			$("#checkNews_title").html("");
			$("#checkNews_image").html("");
			$("#checkNews_Content").html("");
		});
		
		$("#fakeData").click(function(){
		 	$(':text[id="news_title"]').val("宜蘭頭城老街16周年祭典");
			$("#news_Content").val("宜蘭頭城老街16周年祭典<br>超級好玩唷~~~~~");
		});
		
// 		$('#news_Content').keyup(function(e){
// 		    if(e.keyCode == 13){
// 		    	$(this).val($(this).val()+"<br style='hidden:hidden;'>");
// 		    }
// 		});
	})(jQuery);
	
</script>
</body>
</html>