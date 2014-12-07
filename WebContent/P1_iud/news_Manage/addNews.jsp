<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../platform/include_title.jsp" %>
	

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
		<%@ include file="../../platform/include_aHref2.jsp" %>
	<div id="page-wrapper">
		<div id="page-inner" style=""padding-right:1%;">
			<div class="col-sm-10">
			<a href="../newsAndKnowledge.jsp" style="text-decoration:none;"><i class="fa fa-reply fa-3x" style="color:black;"></i></a>
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
		 	$(':text[id="news_title"]').val("墾丁大街春吶晚會~~~＊");
		 	$("#news_image").val("Kenting_Street");
			$("#news_Content").val("所謂春吶是在1995年，兩個外國朋友Wade和Jimi所發起的，以追求「音樂原創」的目標，邀請幾個樂團同好，在四月初的墾丁開始舉辦春吶。接下來幾年，沒有宣傳、不需廣告，僅憑口耳相傳，在眾多樂團與樂迷支持下，春天吶喊已經成為國內樂界的一大盛事，每年四月初，墾丁地區就聚集了國內外許多地下樂團及樂迷，一起沉醉在充滿爆發性的原創音樂裡。這段期間，覺得全國80%以上的地下樂團和外國朋友幾乎都聚集到墾丁來了，走在墾丁簡直像走在國外，而且平時樂團人們就混在街上人群中(因為前一晚才聽過他們的演奏演唱)，即使沒有演奏，卻仍然可以感覺到他們隱隱的散發著自有的旋律，真是音樂無所不在(不是指其他刺耳的宣傳搖頭樂喔)，只要親身體驗一次，就一定會著迷。特別注意：請勿攜帶不被接受的(特殊藥品)，這段期間，全恆春半島的警力，以及屏東市警察大隊都會有派駐大批警力進入各會場，別以為只有門口的駐警，其實主要警力都經過喬裝融入會場中，很多是年輕還攜伴的便衣刑警，甚至都還改以攝影手機蒐證，請勿以身試法。");
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