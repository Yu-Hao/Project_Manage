<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%
		String serverName = request.getServerName() ;
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
	%>
</head>
<body>
<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index2.jsp">下一站，幸福</a>
			</div>
			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
		 			管理者，${userName}&nbsp;您好!!&nbsp; <a href="<%=contextPath%>/LoginServlet?action=logOut" class="btn btn-warning square-btn-adjust">Logout</a>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		</nav>   
           <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					<li class="text-center">
                    	<img src="../img/benny.jpg" class="user-image img-responsive"/>
					</li>
                    <li>
                        <a class="active-menu"  href="../index2.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
						   <li  >
                        <a   href="../chart.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Morris Charts</a>
                    </li>	
					                   
                </ul>
               
            </div>
            
        </nav>  
	
</body>
</html>