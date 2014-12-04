<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>
<%@ page import="P1_iud.model.*"%>

 <link href="../css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="../js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<!--  	<link href='../css/googleapis.css' rel='stylesheet' type='text/css' /> -->

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
		<div id="page-inner" style="padding-top:5%;padding-right:1%;">
			<div class="col-sm-10">
	            <h3><b>&nbsp;&nbsp;&nbsp;景點維護:</b></h3>
	            <div class="" >
	            	<form method="post" action="addView" enctype="multipart/form-data" >
	                <div class="panel-body form-horizontal payment-form">
	                	<div class="form-group">
	                        <label class="col-sm-3 control-label">景點代號:(不可重複)</label>
	                        <div class="col-sm-6">
	                            <input type="text" class="form-control" id="viewId"  placeholder="請輸入景點代號(不可重複)" name="viewId" value="${vnVO.viewID}">
	                        	<img src="images/ajax-loader.gif" id="loadding">
	                        	<span id="checkViewID" style="font-size:18px;color:red;"></span>                            
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-3 control-label">景點名稱:</label>
	                        <div class="col-sm-6">
	                            <input type="text" class="form-control" id="viewName"  placeholder="請輸入景點名稱" name="viewName" value="${vnVO.viewname}">
	                            <span id="checkViewName" style="font-size:18px;color:red;"></span>
	                        </div>
	                    </div>
                        <div class="form-group">
	                        <label class="col-sm-3 control-label">景點區域:</label>
	                        <div class="col-sm-2">
							    <select id="viewPlaceSel" class="form-control" name="viewPlaceSel">
							    	<option value="北部" id="nouth">北部</option>
							    	<option value="中部" id="center">中部</option>
							    	<option value="東部" id="east">東部</option>
							    	<option value="南部" id="south">南部</option>
							    </select>
	    					</div>
	                    </div>
	                    <div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">景點地址:</label>
	                        <div class="col-sm-9">
	                            <input type="text" class="form-control" id="viewAddr"  placeholder="景點地址" name="viewAddr" value="${vnVO.viewAddr}">
	                            <span id="checkViewAddr" style="font-size:18px;color:red;"></span>
	                        </div>
	                    </div> 
	                    <div class="form-group" >
	                        <label for="amount" class="col-sm-3 control-label" >景點經、緯度:</label>
	                        <div class="col-sm-3" style="display:inline;" >
	                            <input type="text" class="form-control" id="viewLng"  placeholder="景點經度" name="viewLng" value="${vnVO.viewlng}" style="float:left;display:inline;">
	                            <span id="checkViewLng" style="font-size:18px;color:red;"></span>
	                        </div>
	                        <div class="col-sm-3"> 
		                       	<input type="text" class="form-control" id="viewLat"  placeholder="景點緯度" name="viewLat" value="${vnVO.viewlat}" >
		                       	<span id="checkViewLat" style="font-size:18px;color:red;"></span>
	                        </div>
	                    </div> 
	                    <div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">上傳圖片:</label>
	                        <div class="col-sm-3" style="display:inline;">
	                            <input type="file" class="form-control" name="pic1" id="pic1">
	                            <span id="checkPic1" style="font-size:18px;color:red;"></span>
	                        </div>
	                        <div class="col-sm-5">
	                        	<input type="text" class="form-control" placeholder="景點說明" id="imgDescript1" name="imgDescript1">
	                        	<span id="checkImgDescript1" style="font-size:18px;color:red;"></span>
	                        </div>
	                        <div class="col-sm-1">
	                        	<input type="button" class="btn btn-danger" value="+" id="addFileBtn">
	                        </div>
	                    </div> 
	                    <br class="addViewPrv">
	                    <div class="form-group">
	                    	<div class="col-sm-4 text-right">
								<input type="button" class="btn btn-default preview-add-button btn-warning"  id="fakeData" value="data"/>
							</div>
	                        <div class="col-sm-8 text-right">
	<!--                             <button type="button" class="btn btn-default preview-add-button"> -->
	<!--                                 <span class="glyphicon glyphicon-plus"></span> Add -->
	<!--                             </button> -->
	<!-- 							<input type="submit" class="btn btn-default preview-add-button" value="送出"> -->
	                        	<input type="reset"  class="btn btn-default preview-add-button btn-danger" value="Reset" id="cleanBtn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="submit" class="btn btn-default preview-add-button btn-success"  id="subBtn" value="送 出"/>
	                            <input type="hidden" name="action" value="addView">
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
		$("#loadding").prop("hidden",true);
		
		var selArea = "${vnVO.viewArea}";
		if (selArea == "中部"){
			$("#center").prop("selected",true);
		}
		if (selArea == "北部"){
			$("#nouth").prop("selected",true);
		}
		if (selArea == "南部"){
			$("#south").prop("selected",true);
		}
		if (selArea == "東部"){
			$("#east").prop("selected",true);
		}

		
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
		
		$("#subBtn").click(function(){
			var viewIdCheck = $.trim($(':text[id="viewId"]').val());
			var viewViewName = $.trim($(':text[id="viewName"]').val());
			var viewViewAddr = $.trim($(':text[id="viewAddr"]').val());
			var viewViewLng = $.trim($(':text[id="viewLng"]').val());
			var viewViewLat = $.trim($(':text[id="viewLat"]').val());
			var viewPic1 = $.trim($(':file[id="pic1"]').val());
			var viewImgDescript1 = $.trim($(':text[id="imgDescript1"]').val());
			if(viewIdCheck == ""||viewViewName == ""||viewViewAddr == ""||viewViewLng == ""||viewViewLat == ""||viewPic1 == ""||viewImgDescript1 == ""){
				
				if(viewIdCheck == ""){
					$("#checkViewID").html("<img src=images/errorImg.png />代號欄位不可空值");
				}
				
				if(viewViewName == ""){
					$("#checkViewName").html("<img src=images/errorImg.png />景點名稱欄位不可空值");
				}
			
				if(viewViewAddr == ""){
					$("#checkViewAddr").html("<img src=images/errorImg.png />景點地址欄位不可空值");
				}
			
				if(viewViewLng == ""){
					$("#checkViewLng").html("<img src=images/errorImg.png />景點經度欄位不可空值");
				}
				
				if(viewViewLat == ""){
					$("#checkViewLat").html("<img src=images/errorImg.png />景點緯度欄位不可空值");
				}
			
				if(viewPic1 == ""){
					$("#checkPic1").html("<img src=images/errorImg.png />檔案上傳欄位不可空值");
				}
			
				if(viewImgDescript1 == ""){
					$("#checkImgDescript1").html("<img src=images/errorImg.png />景點圖片說明欄位1不可空值");
				}
				return false;
			}
		});
		
		$("#cleanBtn").click(function(){
			$("#viewId").attr("value","");
			$("#viewName").attr("value","");
			$("#viewAddr").attr("value","");
			$("#viewLng").attr("value","");
			$("#viewLat").attr("value","");
			
			
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