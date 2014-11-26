<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="css/jquery-ui.css" rel="stylesheet">
	<%@ include file="../platform/include_title.jsp" %>   
	<%@ include file="../platform/include_start.jsp" %> 
	<%@ page import="P1_iud.model.*"%> 
	<script src="../js/jquery-1.11.0.js"></script>
	<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
	<!-- 調整navbar btn -->
	<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
	<!-- 昱豪 日期選今天 (縮排後)-->
    <%
    	Date date = new Date();
		java.util.Date right = new java.util.Date();
		//int a = ((right.toInstant()).toString()).lastIndexOf("-");
		String newA = ((right.toInstant()).toString()).substring(0, (((right.toInstant()).toString()).lastIndexOf("-"))+3);
		//System.out.println(newA);
   	%>
    <!-- 昱豪 日期選今天(縮排後) -->
    <%
		MemberService memSvc = new MemberService();
	 	String userId = (String)session.getAttribute("userLoginId"); 
		MemberVO list = memSvc.getOneMem(userId);
		pageContext.setAttribute("list",list);
	%>
<style>
	body{
		/*font: 100% "Trebuchet MS", sans-serif;*/
		margin: 50px;
	}
	.demoHeaders {
		margin-top: 2em;
	}
	#dialog-link {
		padding: .4em 1em .4em 20px;
		text-decoration: none;
		position: relative;
	}
	#dialog-link span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -8px;
	}
	#icons {
		margin: 0;
		padding: 0;
	}
	#icons li {
		margin: 2px;
		position: relative;
		padding: 4px 0;
		cursor: pointer;
		float: left;
		list-style: none;
	}
	#icons span.ui-icon {
		float: left;
		margin: 0 4px;
	}
	.fakewindowcontain .ui-widget-overlay {
		position: absolute;
	}
	select {
		width: 200px;
	}
	</style>
</head>

<body>
   	<!-- Navigation -->
	<nav class="navbar navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
			<%@ include file="../platform/include_A_href/toIndex.jsp" %> 
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                  	<%@ include file="../platform/include_A_href/P2_route.jsp" %>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %> 
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp"%>
					<%@ include file="../platform/include_A_href/P6_contactUs.jsp"%>
					<%@ include file="../platform/include_A_href/memberSession.jsp"%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
    </div>
    <!-- /.container -->
</nav>
<%-- 	<%@ include file="../platform/include_picture.jsp"%> --%>
<%@ include file="../platform/include_picture/include_picture.jsp" %>


    <!-- ********************************************************* -->
<div class="container">
	<div class="row">
        <div class="col-sm-12">
            <legend>Next Station , Blessed(下一站，幸福)</legend>
        </div>
        <!-- panel preview -->
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <h4>Register Member(註冊會員): </h4>
            <div class="" >
            	<form method="post" action="update">
                <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">帳號:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="idName"  placeholder="請輸入帳號" name="idName" value="${list.member_loginID}" readonly="readonly">
                        	<span id="checkAccount" style="font-size:18px;color:red;">${errorMsgAccount}${errorMsgs}</span>                            
                       		<label class="lable" id="accountLabel">&nbsp;&nbsp;&nbsp;(帳號需填寫6碼包含英文、數字且不能空格!!)</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">姓名:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="userName" name="userName" placeholder="請輸入姓名" value="${list.member_name}">
                            <span id="nameOk" style="font-size:18px;color:red;">${errorMsgName}</span>
                             <label class="lable" id="nameLabel">&nbsp;&nbsp;&nbsp;(不可空白，需為中文字，至少2個字)</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">密碼:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="idPwd"  placeholder="請輸入密碼" name="idPwd">
                        	<span id="pwdOk" style="font-size:18px;color:red;">${errorMsgPwd}</span>  
                            <label class="lable" id="pwdLabel">&nbsp;&nbsp;&nbsp;(不可空白、中文字，至少六個字且包含英文字母、數字)</label>                          
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">確認密碼</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="doubleIdPwd"  placeholder="請再次輸入密碼" name="amount">
                        	<span id="pwdOk2" style="font-size:18px;color:red;"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-3 control-label">E-mail信箱:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="請輸入信箱" value="${list.member_email}" >
                            <span id="emailOk" style="font-size:18px;color:red;">${errorMsgEmail}</span>
                        </div>
                    </div> 
                    <div class="form-group">
                    	<label for="concept" class="col-sm-3 control-label">性別:</label>
                    	<div class="col-sm-2">
				      		<span class="form-control">
				        		<input type="radio" id="radio_male" name="genderChecked" >男&nbsp;
				        		<input type="radio" id="radio_female" name="genderChecked" >女 ${errorMsgGender}
				      		</span>
				     	</div>
				    </div><!-- /input-group -->
                    <div class="form-group">
                        <label for="date" class="col-sm-3 control-label">生日:</label>
                        <div class="col-sm-9">
                        	<input type="text" id="datepicker" name="datepicker" class="form-control" readonly="readonly"  placeholder="請選擇生日日期" value="${list.member_birthday}">
							<span id="dateOk" style="font-size:18px;color:red;">${errorMsgDate}</span>
<!--                             <input type="date" class="form-control" id="date" name="date"> -->
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="addr" class="col-sm-3 control-label">地址:</label>
                        <div class="col-sm-9">
                        	<input type="text" id="userAddr" name="userAddr" class="form-control" placeholder="請輸入聯絡地址" value="${list.member_address}">
							<span id="addrOk" style="font-size:18px;color:red;">${errorMsgAddr}</span>
<!--                             <input type="date" class="form-control" id="date" name="date"> -->
                        </div>
                    </div>
                    <div class="form-group">  
                    	<label for="hobby" class="col-sm-3 control-label">旅遊偏好:</label>
                    	<div class="col-sm-9">
						    <select id="hobbySel" class="form-control" name="member_type">
						    	<option value="A">五光十色大都會之旅</option>
						    	<option value="B">自然奇景心靈沉澱之旅</option>
						    	<option value="C">節慶活動狂歡旅行</option>
						    </select>
    					</div>
					</div>    
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
<!--                             <button type="button" class="btn btn-default preview-add-button"> -->
<!--                                 <span class="glyphicon glyphicon-plus"></span> Add -->
<!--                             </button> -->
<!-- 							<input type="submit" class="btn btn-default preview-add-button" value="送出"> -->
                        	<a href="userProfile.jsp"><input type="button"  class="btn btn-default preview-add-button btn-danger" value="Cancel" id="cleanBtn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                            <input type="submit" class="btn btn-default preview-add-button btn-success"  id="subBtn" value="送 出"/>
                            <input type="hidden" name="action" value="Update"/>
                            <input type="hidden" name="member_class" value="1">
							<input type="hidden" name="member_stop" value="N">
							<input type="hidden" name="member_updateTime" value="<%=new java.sql.Timestamp(right.getTime())%>">
                        </div>
                    </div>
                </div>
                </form>
            </div>            
        </div> <!-- / panel preview -->
        <div class="col-sm-3"></div>
	</div>
</div>
 
<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->   
    
<!--<script src="external/jquery/jquery.js"></script>-->
<script src="../js/jquery-1.11.0.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="../seetalertjs/sweet-alert.js"></script>  
<script type="text/javascript">
    
(function ($) {
		//****************************
//     	$("#radio_male").click(function(){
//     		$("#radio_female").prop("checked",false);
//     		$(this).prop("checked",true);
//     		$(this).prop("name","genderChecked");
//     	});
//     	$("#radio_female").click(function(){
//     		$("#radio_male").prop("checked",false);
//     		$(this).prop("checked",true);
//     		$(this).prop("name","genderChecked");
//     	});
    	// ***************密碼*****************
    	$(':text[id="idPwd"]').focus(function(){
    		$("#pwdOk").html("");
			$("#pwdOk2").html("");
    	});
    	
    	$(':text[id="doubleIdPwd"]').focus(function(){
			$("#pwdOk2").html("");
    	});
    	
    	$(':text[id="idPwd"]').blur(function(){
    		
    		var pwd = $.trim($("#idPwd").val());
    		var doublePwd = $("#doubleIdPwd").val();
    		if(pwd.length == 0){
    			$("#pwdOk").html("<img src=images/errorImg.png />密碼不可以空白");
    			$("#pwdLabel").prop("hidden",false);
    			return;
    		}
    		var reV1 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*\w).{6,30}$/;
            if (!reV1.test(pwd)) {
            	$("#pwdOk").html("<img src=images/errorImg.png />密碼格式錯誤");
            	$("#pwdLabel").prop("hidden",false);
            	return;
    		}
            
    		if((pwd == doublePwd) && pwd.length != 0){
    			$("#pwdOk").html("<img src=images/OK.png />");
    			$("#pwdOk2").html("<img src=images/OK.png />");
    			$("#pwdLabel").prop("hidden",true);
    		}
    	});
    	
    	$(':text[id="doubleIdPwd"]').blur(function(){
    		var doublePwd = $.trim($("#doubleIdPwd").val());
    		var pwd = $("#idPwd").val();
    		if((pwd == doublePwd) && (pwd.length !=0 )){
    			$("#pwdOk").html("<img src=images/OK.png />");
    			$("#pwdOk2").html("<img src=images/OK.png />");
    			$("#pwdLabel").prop("hidden",true);
    		}else{
    			$("#pwdOk2").html("<img src=images/errorImg.png />請重新確認密碼");
    			$("#pwdLabel").prop("hidden",false);
    		}
    			
    		
    	});
    
    	// ***************密碼*****************
    		
    	// ***************姓名*****************
    	$(':text[id="userName"]').focus(function(){
    		$("#nameOk").html("");
    	});

    	$(':text[id="userName"]').blur(function(){
    		if($("#userName").val() == ""){
    			$("#nameOk").html("<img src=images/errorImg.png />姓名欄位不可空白!");
    			$("#nameLabel").prop("hidden",false);
    		}
    		
        	var reV2 = /^(?!.*[\s])[\u4E00-\u9FFF]{2,}$/;
            if (!reV2.test($("#userName").val())){
            	$("#nameOk").html("<img src=images/errorImg.png />姓名格式錯誤");
            	$("#nameLabel").prop("hidden",false);
            	return;
    		}
            $("#nameOk").html("<img src=images/OK.png />");
            $("#nameLabel").prop("hidden",true);
    	});
    	// ***************姓名*****************
    	
    	// ***************性別*****************
    	var memGender = "${list.member_gender}";
    	if(memGender == "男"){
    		$("#radio_female").prop("checked",false);
    		$("#radio_male").prop("checked",true);
    	}else{
    		$("#radio_male").prop("checked",false);
    		$("#radio_female").prop("checked",true);
    	}
    	// ***************性別*****************
    	
    	
    	
    	// ***************信箱*****************
    	$(':text[id="userEmail"]').focus(function(){
    		$("#emailOk").html("");
    	});
    	$(':text[id="userEmail"]').blur(function(){
    		 $("#emailOk").html("");
    		var email = $.trim($("#userEmail").val());
    		if(email.length == 0){
    			$("#emailOk").html("<img src=images/errorImg.png />email信箱不可以空白");
    			return;
    		}
    		var reV1 = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
            if (!reV1.test(email)) {
            	$("#emailOk").html("<img src=images/errorImg.png />email信箱格式錯誤 <span style='color:orange;'>(ex: abc@yahoo.com.tw)</span>");
            	return;
    		}else{
	            $("#emailOk").html("<img src=images/OK.png /> <span style='color:green;'>屬於合法的E-mail格式</span>");
    		}
    	});
    	
    
    	// ***************信箱*****************
    	
    	
    	// ***************地址*****************
     	$(':text[id="userAddr"]').focus(function(){
    		$("#addrOk").html("");
    	});
    	
    	$(':text[id="userAddr"]').blur(function(){
    		if($("#userAddr").val() == "")
    			$("#addrOk").html("<img src=images/errorImg.png />地址欄位不可空白");
    		else
    			$("#addrOk").html("<img src=images/OK.png />");
    	});
    	// ***************地址*****************
    	
    	// ***************生日*****************
//     	$("#datepicker").datepicker(); 
    	$("#datepicker").datepicker({
    		changeMonth: true,
    		changeYear: true,
    		yearRange:"1900:2100",
    		dateFormat:"yy-mm-dd", 
    		minDate: "1900-01-01",
    		maxDate:"dafaultDate"
    	});
    	
    	$(':text[id="datepicker"]').focus(function(){
    		$("#dateOk").html("");
    	});
    	
    	$(':text[id != "datepicker"]').focus(function(){
    		if($("#datepicker").val() != ""){
    			$("#dateOk").html("<img src=images/OK.png />");
    		}
    	});
    	// ***************生日*****************

    	// ***************興趣*****************
		var hobbySelect = "${list.member_type}";
		$("#hobbySel").val($.trim(hobbySelect));
		
    	// ***************興趣*****************
    	
    	
    	// ***************清除*****************
    	$("#cleanBtn").click(function(){
    		$("#checkAccount").html("");
    		$("#nameOk").html("");
    	  	$("#pwdOk").html("");
    	   	$("#pwdOk2").html("");
    	   	$("#emailOk").html("");
    	   	$("#dateOk").html("");
    	   	$("#addrOk").html("");
		});
    	// ***************清除*****************
    	
    	// ***************submit*****************
		$("#subBtn").click(function(){
			var idName = $.trim($("#idName").val());
			var userName = $.trim($("#userName").val());
			var idPwd = $.trim($("#idPwd").val());
			var doubleIdPwd = $.trim($("#doubleIdPwd").val());
			var userEmail = $.trim($("#userEmail").val());
			var datepicker = $("#datepicker").val();
			var userAddr = $.trim($("#userAddr").val());
			
			if(idName == "" || userName == "" || idPwd == "" || doubleIdPwd == "" || userEmail == "" || datepicker == "" || userAddr == ""){   
				if(idName == ""){
					$("#checkAccount").html("<img src=images/errorImg.png />帳號欄位不可空白");
				}
				if(userName == ""){
					$("#nameOk").html("<img src=images/errorImg.png />姓名欄位不可空白");
				}
				if(idPwd == ""){
					$("#pwdOk").html("<img src=images/errorImg.png />密碼欄位不可空白");
				}
				if(doubleIdPwd == ""){
					$("#pwdOk2").html("<img src=images/errorImg.png />確認密碼欄位不可空白");
				}
				if(userEmail == ""){
					$("#emailOk").html("<img src=images/errorImg.png />信箱欄位不可空白");
				}
				if(datepicker == ""){
					$("#dateOk").html("<img src=images/errorImg.png />生日欄位不可空白");
				}
				if(userAddr == ""){
					$("#addrOk").html("<img src=images/errorImg.png />地址欄位不可空白");
				}
				return false;
			}
			var pwd = $.trim($("#idPwd").val());
    		var reV1 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*\w).{6,30}$/;
            if (!reV1.test(pwd)) {
            	$("#pwdOk").html("<img src=images/errorImg.png />密碼格式錯誤");
            	$("#pwdLabel").prop("hidden",false);
            	return false;
    		}
            var reV2 = /^(?!.*[\s])[\u4E00-\u9FFF]{2,}$/;
            if (!reV2.test($("#userName").val())){
            	$("#nameOk").html("<img src=images/errorImg.png />姓名格式錯誤");
            	$("#nameLabel").prop("hidden",false);
            	return false;
    		}
            var reV3 = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
            if (!reV3.test(email)) {
            	$("#emailOk").html("<img src=images/errorImg.png />email信箱格式錯誤 <span style='color:orange;'>(ex: abc@yahoo.com.tw)</span>");
            	return false;
    		}
            var reV4 = /^(?!.*[\s])[\u4E00-\u9FFF]{2,}$/;
            if (!reV4.test($("#userAddr").val())){
            	$("#addrOk").html("<img src=images/errorImg.png />地址格式錯誤");
            	return false;
    		}
		});
		// ***************submit*****************
})(jQuery);
</script>
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>