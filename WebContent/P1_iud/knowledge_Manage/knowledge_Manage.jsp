<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../platform/include_title.jsp" %>

<%@ page import="P5_index.model.*"%>
<%

		knowledgeService kdSvc = new knowledgeService();
		List<knowledgeVO> klVO = kdSvc.getAll();
 		pageContext.setAttribute("klVO",klVO);
		
%>
 <link href="../../css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../../css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="../../js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../../css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
 	<link href='../../css/googleapis.css' rel='stylesheet' type='text/css' />

<!-- GOOGLE FONTS-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
<link href='../../css/googleapis.css' rel='stylesheet' type='text/css' />
<!-- <link href="css/style.css" rel='stylesheet' type='text/css' /> -->
<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
<link rel="stylesheet" href="../css/table_yuHao.css">

</head>
<body>
	<div id="wrapper">
		<%@ include file="../../platform/include_aHref2.jsp" %>
	
	
	<div id="page-wrapper">
	<div id="page-inner" style="padding-right:1%;">
	<br>
	<a href="../newsAndKnowledge.jsp" style="text-decoration:none;"><i class="fa fa-reply fa-3x" style="color:black;display:inline;"></i></a>
	<a href="addKnowledge.jsp"><input type="button"  class="btn btn-danger btn-lg" value="新增" style="float:right;"></a>
	<br>
	<br>
	
		<table id="example" class="display" cellspacing="0"  >
        <thead>
            <tr>
                <th>急救小知識筆數</th>
                <th>小知識種類</th>
                <th>小知識標題</th>
                <th>小知識內容</th>
                <th>小知識圖片檔名</th>
                <th>小知識建立時間</th>
                <th>維護</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
            	<th>急救小知識筆數</th>
                <th>小知識種類</th>
                <th>小知識標題</th>
                <th>小知識內容</th>
                <th>小知識圖片檔名</th>
                <th>小知識建立時間</th>
                <th>維護</th>
            </tr>
        </tfoot>
 
        <tbody class="klVOEdit">
         <%int memCount=0; %>
        	<c:forEach var="klVO" items="${klVO}">
        		<tr>
        			<%memCount++;%>
        			<td><%=memCount%></td>
<%--         			<td>${klVO.knowledge_identity}</td> --%>
        			<td>${klVO.knowledge_type}</td>
        			<td>${klVO.knowledge_title}</td>
        			<td>${klVO.knowledge_content}</td>
        			<td>${klVO.knowledge_imgName}</td>
<%--         			<td>${klVO.knowledge_img}</td> --%>
<%--         			<td>${klVO.knowledge_ImgFormat}</td> --%>
        			<td>${klVO.knowledge_build}</td>
<!--         		<td><input type="button" class="btn btn-danger" value="維護" ></td> -->
					<td>
						<a href="../updateServlet?name=updateKnowledge&id=${klVO.knowledge_identity}"><input type="button"  class="btn btn-danger" value="修改" ></a>
						<input type="button"  class="btn btn-danger deleteBtn" id="${klVO.knowledge_identity}" value="刪除" >
					</td> 
        		</tr>
        	</c:forEach>
        </tbody>
    </table>
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
	<%@ include file="../../platform/include_svc_script2.jsp" %> 
	<script>
		(function($) {
			
			
			 	$('#example').dataTable();
			 	$(".deleteBtn").click(function(){
			 		//var sel = $(this).closest('tr').find('td:nth-child(1)').text();
	     			var sel = $(this).attr("id");
			     		swal({ title: "Are you sure?",
					 	text: "確定是否刪除第"+sel+"筆小知識!!",
					  	type: "warning",   
					  	showCancelButton: true,   
					  	confirmButtonColor: "#DD6B55",   
					  	confirmButtonText: "Yes, do it!",   
					  	closeOnConfirm: false }, function(){
					  		stop_class(sel);
					  		swal("Success!", "已成功刪除第"+sel+"筆小知識!!","success"); 
					  		setTimeout("self.location.reload()",2000);
					  	});
	     		});
		})(jQuery);
		
		function stop_class(name){
			$.get("stopKnowledge.jsp",{"name":name},function(data){
    		});
		}
			 	
			 	
	</script>
</body>
</html>