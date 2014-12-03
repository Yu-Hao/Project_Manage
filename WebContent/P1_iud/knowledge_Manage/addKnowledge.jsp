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
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="P1_iud.model.*"%>
<%
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
	            <h3><b>&nbsp;&nbsp;&nbsp;新增小知識:</b></h3>
	            <div class="" >
	            	<form method="post" action="addKnowledge" enctype="multipart/form-data" >
	                <div class="panel-body form-horizontal payment-form">
	                	<div class="form-group">
	                        <label class="col-sm-3 control-label">小知識主題:</label>
	                        <div class="col-sm-7">
	                            <input type="text" class="form-control" id="knowledge_title"  placeholder="請輸入小知識主題" name="knowledge_title">
	                        	<span id="checkKnowledge_title" style="font-size:18px;color:red;"></span>                            
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-3 control-label">小知識內容:</label>
	                        <div class="col-sm-7">
	                            <textarea class="form-control"  id="knowledge_content" name="knowledge_content" placeholder="Enter your content." rows="7" required></textarea>
								<span id="checkKnowledge_content" style="font-size:18px;color:red;"></span>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">上傳圖片:</label>
	                        <div class="col-sm-7" style="display:inline;">
	                            <input type="file" class="form-control" name="knowledge_img" id="knowledge_img">
	                            <span id="checkKnowledge_img" style="font-size:18px;color:red;"></span>
	                        </div>
	                    </div> 
	                    <div class="form-group">
	                    	<div class="col-sm-4 text-right">
								<input type="button" class="btn btn-default preview-add-button btn-warning"  id="fakeData" value="data"/>
							</div>
	                        <div class="col-sm-6 text-right">
	                        	<input type="reset"  class="btn btn-default preview-add-button btn-danger" value="Reset" id="cleanBtn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="submit" class="btn btn-default preview-add-button btn-success"  id="subBtn" value="送 出"/>
	                            <input type="hidden" name="knowledge_build" value="<%=today%>">
	                            <input type="hidden" name="action" value="addKnowledge">
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
		$("#loadding").prop("hidden",true);
		
		var countAdd = 1;
		
		$("#addFileBtn").click(function(){
			countAdd++;
			if(countAdd<=3){
// 				$(".addViewTest").after("<input type='file' class='form-control' name=pic"+$.trim(countAdd)+">");
				$(".addViewPrv").before("<div class='form-group'><label for='description' class='col-sm-3 control-label'>上傳圖片:</label><div class='col-sm-3' style='display:inline;'><input type='file' class='form-control' name='pic"+$.trim(countAdd)+"'></div><div class='col-sm-5'><input type='text' class='form-control' placeholder='景點說明' id='imgDescript"+$.trim(countAdd)+"' name='imgDescript"+$.trim(countAdd)+"'><span id='checkImgDescript"+$.trim(countAdd)+"' style='font-size:18px;color:red;'></span></div></div>");                  
			}else{
				swal("最多上傳三張圖片唷!", "", "error");
			}
		});
		
		
		//focus
		$(':text[id="viewId"]').focus(function(){
			$("#checkViewID").html("");
		});
		
		$(':text[id="viewName"]').focus(function(){
			$("#checkViewName").html("");
		});
		
		$(':text[id="viewAddr"]').focus(function(){
			$("#checkViewAddr").html("");
		});
		
		$(':text[id="viewLng"]').focus(function(){
			$("#checkViewLng").html("");
		});
		
		$(':text[id="viewLat"]').focus(function(){
			$("#checkViewLat").html("");
		});
		
		$(':text[id="imgDescript1"]').focus(function(){
			$("#checkImgDescript1").html("");
		});
		
		$(document).on("focus","#imgDescript2",function(){
			$("#checkImgDescript2").html("");
		});
		
		$(document).on("focus","#imgDescript3",function(){
			$("#checkImgDescript3").html("");
		});
		
		//viewname ID驗證**********************
		$(':text[id="viewId"]').blur(function(){
			var viewIdCheck = $.trim($(':text[id="viewId"]').val());
			if(viewIdCheck == ""){
				$("#checkViewID").html("<img src=images/errorImg.png />代號欄位不可空值");
				return;
			}
			$("#loadding").prop("hidden",false);
			$.get("checkViewName.jsp",{"name":viewIdCheck},function(data){
				if(data==1){
					$("#checkViewID").html("<img src=images/errorImg.png />此代號已使用過");
					$("#accountLabel").prop("hidden",false);
				}else{
					$("#checkViewID").html("<img src=images/OK.png />此代號可以使用");
					$("#accountLabel").prop("hidden",true);
				}
				$("#loadding").prop("hidden",true);
			});
		});
		
		$(':text[id="viewName"]').blur(function(){
			var viewViewName = $.trim($(':text[id="viewName"]').val());
			if(viewViewName == ""){
				$("#checkViewName").html("<img src=images/errorImg.png />景點名稱欄位不可空值");
				return;
			}
		});
		
		$(':text[id="viewAddr"]').blur(function(){
			var viewViewAddr = $.trim($(':text[id="viewAddr"]').val());
			if(viewViewAddr == ""){
				$("#checkViewAddr").html("<img src=images/errorImg.png />景點地址欄位不可空值");
				return;
			}
		});
		
		$(':text[id="viewLng"]').blur(function(){
			var viewViewLng = $.trim($(':text[id="viewLng"]').val());
			if(viewViewLng == ""){
				$("#checkViewLng").html("<img src=images/errorImg.png />景點經度欄位不可空值");
				return;
			}
		});
		
		$(':text[id="viewLat"]').blur(function(){
			var viewViewLat = $.trim($(':text[id="viewLat"]').val());
			if(viewViewLat == ""){
				$("#checkViewLat").html("<img src=images/errorImg.png />景點緯度欄位不可空值");
				return;
			}
		});
		
		$(':text[id="imgDescript1"]').blur(function(){
			var viewImgDescript1 = $.trim($(':text[id="imgDescript1"]').val());
			if(viewImgDescript1 == ""){
				$("#checkImgDescript1").html("<img src=images/errorImg.png />景點圖片說明欄位1不可空值");
				return;
			}
		});
		
		$(document).on("blur","#imgDescript2",function(){
			var viewImgDescript2 = $.trim($(':text[id="imgDescript2"]').val());
			if(viewImgDescript2 == ""){
				$("#checkImgDescript2").html("<img src=images/errorImg.png />景點圖片說明欄位2不可空值");
				return;
			}
		});
		
		$(document).on("blur","#imgDescript3",function(){
			var viewImgDescript3 = $.trim($(':text[id="imgDescript3"]').val());
			if(viewImgDescript3 == ""){
				$("#checkImgDescript3").html("<img src=images/errorImg.png />景點圖片說明欄位3不可空值");
				return;
			}
		});
		
// 		$("#subBtn").click(function(){
// 			var viewIdCheck = $.trim($(':text[id="viewId"]').val());
// 			var viewViewName = $.trim($(':text[id="viewName"]').val());
// 			var viewViewAddr = $.trim($(':text[id="viewAddr"]').val());
// 			var viewViewLng = $.trim($(':text[id="viewLng"]').val());
// 			var viewViewLat = $.trim($(':text[id="viewLat"]').val());
// 			var viewPic1 = $.trim($(':file[id="pic1"]').val());
// 			var viewImgDescript1 = $.trim($(':text[id="imgDescript1"]').val());
// 			if(viewIdCheck == ""||viewViewName == ""||viewViewAddr == ""||viewViewLng == ""||viewViewLat == ""||viewPic1 == ""||viewImgDescript1 == ""){
				
// 				if(viewIdCheck == ""){
// 					$("#checkViewID").html("<img src=images/errorImg.png />代號欄位不可空值");
// 				}
				
// 				if(viewViewName == ""){
// 					$("#checkViewName").html("<img src=images/errorImg.png />景點名稱欄位不可空值");
// 				}
			
// 				if(viewViewAddr == ""){
// 					$("#checkViewAddr").html("<img src=images/errorImg.png />景點地址欄位不可空值");
// 				}
			
// 				if(viewViewLng == ""){
// 					$("#checkViewLng").html("<img src=images/errorImg.png />景點經度欄位不可空值");
// 				}
				
// 				if(viewViewLat == ""){
// 					$("#checkViewLat").html("<img src=images/errorImg.png />景點緯度欄位不可空值");
// 				}
			
// 				if(viewPic1 == ""){
// 					$("#checkPic1").html("<img src=images/errorImg.png />檔案上傳欄位不可空值");
// 				}
			
// 				if(viewImgDescript1 == ""){
// 					$("#checkImgDescript1").html("<img src=images/errorImg.png />景點圖片說明欄位1不可空值");
// 				}
// 				return false;
// 			}
// 		});
		
		$("#cleanBtn").click(function(){
			$("#checkViewID").html("");
			$("#checkViewName").html("");
			$("#checkViewAddr").html("");
			$("#checkViewLng").html("");
			$("#checkViewLat").html("");
			$("#checkImgDescript1").html("");
			$("#checkImgDescript2").html("");
			$("#checkImgDescript3").html("");
		});
	})(jQuery);
	
</script>
</body>
</html>