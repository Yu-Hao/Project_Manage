<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<!-- Bootstrap core CSS -->
	<!-- Custom styles for this template -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="css/signin.css" rel="stylesheet">
	<script src="js/ie-emulation-modes-warning.js"></script>
  	<script src="../js/jquery-1.10.2.js"></script>	
  	
<style>
	.form-group .glyphicon {
     display:none; 
    right: 30px;
    position: absolute;
    top: 12px;
    cursor:pointer;
}
</style>
	
</head>

<body>
    <div id="" class="">
      <div class="">
      	  <div class="col-xs-5"></div>
          <div class=" col-xs-7">
              <h2>&nbsp;&nbsp;管理者登入</h2> 
          </div>
          <hr>
           <hr>
            <hr style="color:red;">
          <div class="modal-body">
              <div class="row">
              	  <div class="col-xs-4"></div>
                  <div class="col-xs-4">
                      <div class="well">
                          <form id="loginForm" method="POST" action="login" novalidate="novalidate">
                              <div class="form-group">
                                  <label for="username" class="control-label">Username</label>
                                  <input type="text" class="form-control" id="inputLoginId" name="inputLoginId" value="" required="" title="Please enter you username" placeholder="請輸入帳號"  autofocus ><span style="color:red;" id="errorId">${errorMsgId}</span>
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="inputPassword" name="inputPassword" value="" required="" title="Please enter your password" placeholder="請輸入密碼"><span style="color:red;" id="errorPassword"> ${errorMsgPwd}</span>
                                  <span class="help-block glyphicon glyphicon-eye-open" style="margin-top:115px;margin-right:20px;"></span>
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>
                              <div class="checkbox">
                                  <label>
                                      <input type="checkbox" name="remember" id="remember"> Remember login
                                  </label>
                                  <p class="help-block">(if this is a private computer)</p>
                              </div>
                              <button type="submit" class="btn btn-success btn-block" id="loginBtn">Login</button>
                              <input type="hidden" name="action" value="LoginIdCheck">
                              
                              <a href="../P7_ForgetPassWord/ForgetPassWord.jsp" class="btn btn-default btn-block">忘記密碼</a>
                          </form>
                      </div>
                  </div>
                  <div class="col-xs-4"></div>
              </div>
          </div>
      </div>
  </div>





<!-- ***********************script************************** -->
   
<!-- jQuery Version 1.11.0 -->

<!-- Bootstrap Core JavaScript -->
<!-- <script src="js/bootstrap.min.js"></script>  -->
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
(function ($) {
	//照片輪播間格秒數
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });
  //照片輪播間格秒數
  
  //上方工具列滑鼠滑入自動彈出
    $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });
  //上方工具列滑鼠滑入自動彈出
  
  //登入處裡*****************************
  	
    $("#loginBtn").click(function(){
    	
    	$("#errorId").html("");
    	$("#errorPassword").html("");
    	var loginId = $("#inputLoginId").val();
    	var password = $("#inputPassword").val();
    	if($.trim(loginId).length==0){
    		$("#errorId").html("&nbsp;帳號欄位不能空白!!");
    		return false;
    	}
    	else if($.trim(password).length == 0){
    		$("#errorPassword").html("&nbsp;密碼欄位不能空白!!");
    		return false;
    	}
    	
    	//return true;
    });
  	
  
  
  
	$(".noLogin").click(function(){	
		//alert("請先登入會員!!");
		sweetAlert("此功能需先行登入會員!!","","warning");
		$("#ok_btn123456").click(function(){
			window.location.href="http://localhost:8081/Project_1/P0_login/login.jsp";
		});
			
	});
	
	
	//登入處裡*****************************
	

	$("#inputPassword").on("keyup",function(){
	    if($(this).val())
	        $(".glyphicon-eye-open").show();
	    else
	        $(".glyphicon-eye-open").hide();
	    });
	$(".glyphicon-eye-open").mousedown(function(){
	                $("#inputPassword").attr('type','text');
	            }).mouseup(function(){
	            	$("#inputPassword").attr('type','password');
	            }).mouseout(function(){
	            	$("#inputPassword").attr('type','password');
	            });
	
	
	
})(jQuery);

		
 	
</script>

</body>
</html>
