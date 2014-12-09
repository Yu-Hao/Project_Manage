<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>

<%@ page import="P6_contactUs.model.*"%>
<%
		ContactUsVO ctVO = (ContactUsVO)session.getAttribute("ctVO");
		pageContext.setAttribute("ctVO",ctVO);
		Date date = new Date();
		java.util.Date right = new java.util.Date();
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
		 <%@ include file="../platform/include_aHref.jsp" %>
	  
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
		              	  	      			<input type="hidden"  id="date" name="date" value="<%=new java.sql.Timestamp(right.getTime())%>" readonly="<%=new java.sql.Timestamp(right.getTime())%>">
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
                							<input name="subject" id="subject" type="text" placeholder="Questions" class="form-control" required value="RE:${ctVO.contactUsSubject}">
              							</div>
            						</div>
						            <div class="form-group">
						            	<span class="col-md-2 col-md-offset-2 text-center">Contact</span>
						              	<div class="col-md-4">
						                	<textarea class="form-control" id="userContents" name="userContents" rows="2"></textarea>
						              	</div>
						            </div>
    								<div class="form-group">
						            	<span class="col-md-2 col-md-offset-2 text-center">Reply Contact</span>
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
				var serverName = "<%= request.getServerName()%>";
				var serverPort = "<%= request.getServerPort()%>";
				var contextPath = "<%= request.getContextPath()%>"
				//********************回覆信件給user**************************
				
				$('#send').click(function(){
				var mail_check= /.+@.+\..+/;
				var fname=$('#fname').val();
				var recipients=$('#recipients').val();
				var frommail=$('#frommail').val();
				var date=$('#date').val();
				var subject=$('#subject').val();
				var contents=$('#contents').val();
				var contactUsId="${ctVO.contactUsId}";
				if(fname.length==0){
					sweetAlert("Sorry...", "請輸入姓名!", "error");
					return false;
				}
				else if(recipients.length==0){
					sweetAlert("Sorry...", "請輸入E-mail!", "error");
					return false;
				}else if(!recipients.match(mail_check)){
					sweetAlert("Sorry...", "請輸入正確E-mail格式!", "error");
					return false;
				}else if(subject.length==0){
					sweetAlert("Sorry...", "請輸入subject!", "error");
					return false;
				}else if(contents.length==0){
					sweetAlert("Sorry...", "請輸入contents!", "error");
					return false;
				}
				
				 $.ajax({
		                "url": "../P6_contactUs/ContactUsServlet",
		                "type": "post",
		                "data": {'action': 'contactusReply','name':fname,'recipients':recipients,
		                	'frommail':frommail,'date':date,'subject':subject,'contents':contents,'contactUsId':contactUsId},
		                "dataType": "text", //json,xml
		                "success": function(data) {
		               		if($.trim(data)=="ok"){
		               			swal({ title: "Good Job!",   
		         				   text: "已成功回信!!",   
		         				   type:"success"});
		               			$('#fname').val("");
		        				$('#recipients').val("");
		        				$('#subject').val("");
		        				$('#contents').val("");

		        				$("#ok_sweetAlert").click(function(){
		             				window.location.href='http://'+ serverName +':'+ serverPort + contextPath +'/P1_iud/email_Manage.jsp';
		            			});	
		               		}else{
		               			sweetAlert("申請失敗", "請確定網路是否順暢!", "error");
		               		}
		                }
		            });
				});
				
				//********************回覆信件給user**************************
			
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