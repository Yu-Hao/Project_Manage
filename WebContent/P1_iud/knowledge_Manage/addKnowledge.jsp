<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../platform/include_title.jsp" %>

<%@ page import="java.text.*"%>
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
		<%@ include file="../../platform/include_aHref2.jsp" %>
	<div id="page-wrapper">
		<div id="page-inner" style="padding-right:1%;">
			<div class="col-sm-10">
			<a href="../newsAndKnowledge.jsp" style="text-decoration:none;"><i class="fa fa-reply fa-3x" style="color:black;"></i></a>
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
		  
		//focus
		$(':text[id="knowledge_title"]').focus(function(){
			$("#checkKnowledge_title").html("");
		});
		
		$('#knowledge_content').focus(function(){
			$("#checkKnowledge_content").html("");
		});
		
		$('#knowledge_img').focus(function(){
			$("#checkKnowledge_img").html("");
		});
		
		
		//viewname ID驗證**********************
		$(':text[id="knowledge_title"]').blur(function(){
			var knowledge_title = $.trim($(':text[id="knowledge_title"]').val());
			if(knowledge_title == ""){
				$("#checkKnowledge_title").html("<img src=../images/errorImg.png />標題欄位不可空值");
				return;
			}
		});
		
		$('#knowledge_content').blur(function(){
			var knowledge_content = $.trim($('#knowledge_content').val());
			if(knowledge_content == ""){
				$("#checkKnowledge_content").html("<img src=../images/errorImg.png />內容欄位不可空值");
				return;
			}
		});
		
		$('#knowledge_img').blur(function(){
			var knowledge_img = $.trim($('#knowledge_img').val());
			if(knowledge_img == ""){
				$("#checkKnowledge_img").html("<img src=../images/errorImg.png />需上傳一張圖片");
				return;
			}
		});
		
		$("#subBtn").click(function(){
			var knowledge_title = $.trim($(':text[id="knowledge_title"]').val());
			var knowledge_content = $.trim($('#knowledge_content').val());
			var knowledge_img = $.trim($('#knowledge_img').val());
			if(knowledge_title == ""||knowledge_content == ""||knowledge_img==""){
				
				if(knowledge_title == ""){
					$("#checkKnowledge_title").html("<img src=../images/errorImg.png />標題欄位不可空值");
				}
				
				if(knowledge_content == ""){
					$("#checkKnowledge_content").html("<img src=../images/errorImg.png />內容欄位不可空值");
				}
			
				if(knowledge_img == ""){
					$("#checkKnowledge_img").html("<img src=../images/errorImg.png />需上傳一張圖片");
				}
				return false;
			}
		});
		
		$("#cleanBtn").click(function(){
			$("#checkKnowledge_title").html("");
			$("#checkKnowledge_content").html("");
			$("#checkKnowledge_img").html("");
		});
		
		$("#fakeData").click(function(){
				$("#knowledge_title").val("原來豆乾的「黃」是色素來的！？");
				$("#knowledge_content").val("你知道嗎？我們常吃的黃色豆干原來並不是黃色的喔！而是加了食用黃色4號或5號色素。為了美觀、引起食慾，許多加工品會使用色素，依規定，目前可使用的食用煤焦色素，包含紅色六號、七號、四十號、黃色四號、五號、綠色三號、藍色一號、二號等；但生鮮肉類、魚貝類、豆類、蔬菜、水果、味噌、醬油、海帶、海苔、茶葉等都不得使用。煤焦色素大多由煤焦油經蒸餾、硫化、硝化…及其他複雜的反應製成。如今已發現好幾種煤焦色素皆具有強烈的致癌性，某些合成色素會危害人體健康，導致生育力下降、畸胎、兒童過動等。選購時，還是避免選擇色彩鮮艷或顏色稀奇的食物最好！");
		});
	})(jQuery);
	
</script>
</body>
</html>