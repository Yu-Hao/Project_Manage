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
				<a class="navbar-brand" href="../../index2.jsp">下一站，幸福</a>
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
                    	<img src="../../img/benny.jpg" class="user-image img-responsive"/>
					</li>
                    <li>
                        <a class="active-menu"  href="../../index2.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
					<li>
                        <a   href="../../chart.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Morris Charts</a>
                    </li>
                    
                    
                    <!-- 線上課客服用 -->
					<li>
					<div class="panel panel-primary text-center no-boder bg-color-green">
							<div class="panel-body">
								<i class="fa fa-comments-o fa-5x"></i>
								<div id="onlinesvc">
									<!--          							<a href="#" id=""><p>※線上克服</p></a>     -->
								</div>

							</div>
							<div class="panel-footer back-footer-green">線上客服</div>
						</div>
					</li>    
					 <!-- 線上課客服用 -->   	
                </ul>
               
            </div>
            
        </nav>  
	
</body>
</html>