<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>
<%@ page import="P1_iud.model.*"%>
<%
		viewnameService viewSvc = new viewnameService();
		List<viewnameVO> viewnameList = viewSvc.getAll();
		pageContext.setAttribute("viewnameList",viewnameList);
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
<link rel="stylesheet" href="css/table_yuHao.css">
	
</head>
<body>
	<div id="wrapper">
		<%@ include file="../platform/include_aHref.jsp" %>
	  
	<div id="page-wrapper">
	<div id="page-inner" style="padding-right:1%;">
	<br>
	<a href="../index2.jsp" style="text-decoration:none;"><i class="fa fa-reply fa-3x" style="color:black;display:inline;"></i></a>
	<a href="addView.jsp"><input type="button"  class="btn btn-danger btn-lg" value="新增" style="float:right;"></a>
	<br>
	<br>
		<table id="example" class="display" cellspacing="0"  >
        <thead>
            <tr>
                <th>景點代號</th>
                <th>景點名稱</th>
                <th>景點區域</th>
                <th>景點地址</th>
                <th>景點點擊率</th>
                <th>景點經度</th>
                <th>景點緯度</th>
                <th>修改</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
               	<th>景點代號</th>
                <th>景點名稱</th>
                <th>景點區域</th>
                <th>景點地址</th>
                <th>景點點擊率</th>
                <th>景點經度</th>
                <th>景點緯度</th>
                <th>修改</th>
            </tr>
        </tfoot>
 
        <tbody class="viewnameListEdit">
        	<c:forEach var="viewnameList" items="${viewnameList}">
        		<tr>
        			<td>${viewnameList.viewID}</td>
        			<td>${viewnameList.viewname}</td>
        			<td>${viewnameList.viewArea}</td>
        			<td>${viewnameList.viewAddr}</td>
        			<td>${viewnameList.view_HitRate}</td>
        			<td>${viewnameList.viewlat}</td>
        			<td>${viewnameList.viewlng}</td>
					<td><a href="updateServlet?name=updateViewName&id=${viewnameList.viewID}"><input type="button"  class="btn btn-danger" value="維護" ></a></td>        			
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
<%@ include file="../platform/include_svc_script.jsp" %> 
<script>
	(function($) {
		 	$('#example').dataTable();
	})(jQuery);
</script>
</body>
</html>