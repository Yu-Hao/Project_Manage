<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>下一站，幸福</title>
	<link rel="shortcut icon" href="img/favicon.ico">
	
<!-- BOOTSTRAP STYLES-->
<link href="css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	
<%@ page import="java.util.*,P10_Chart.model.*,P4_MessageBoard.model.*,P3_TravelDiary.model.*"%>	
<%  
	eachAreaTopOneDAO topDAO = new eachAreaTopOneDAO();
	List<eachAreaTopOneVO> listCount = new ArrayList<eachAreaTopOneVO>();
	listCount = topDAO.getTopOne();
	int i2=0;
	String p0=null;String p1=null;String p2=null;String p3=null;
	for(eachAreaTopOneVO p:listCount){
		if(i2==0)
			p0= p.getView_hitrate();
		if(i2==1)
			p1= p.getView_hitrate();
		if(i2==2)
			p2= p.getView_hitrate();
		if(i2==3)
			p3= p.getView_hitrate();
		i2++;
	}
	
	//昱豪
	FrdService frdSvc = new FrdService();
	List<FrdVO> friend_count = frdSvc.getFriend_count();
	//String fKing1=null,fKing2=null,fKing3=null,fKing4=null,fKing5=null,fKing6=null;
	String fKing[] = new String[6];
	String fCount[] = new String[6];
	int iCount = 0;
	for(FrdVO friend_Counts : friend_count){
// 		fKing[iCount] = friend_Counts.getMember_loginID();
		fKing[iCount] = friend_Counts.getMember_name();
		fCount[iCount] = friend_Counts.getFriend_count();
		iCount++;
	}
//  	System.out.println(fKing[0]);
//  	System.out.println(fCount[0]);
//  	System.out.println(fKing[1]);
//  	System.out.println(fCount[1]);

	TravelDiaryService blobSvc = new TravelDiaryService();
	List<TravelDiaryVO> blog_count = blobSvc.getBlog_count();
	//String fKing1=null,fKing2=null,fKing3=null,fKing4=null,fKing5=null,fKing6=null;
	String bKing[] = new String[6];
	String bCount[] = new String[6];
	int jCount = 0;
	for(FrdVO friend_Counts : friend_count){
// 		bKing[jCount] = friend_Counts.getMember_loginID();
		bKing[jCount] = friend_Counts.getMember_name();
		bCount[jCount] = friend_Counts.getFriend_count();
		jCount++;
	}
//  	System.out.println(fKing[0]);
//  	System.out.println(fCount[0]);
//  	System.out.println(fKing[1]);
//  	System.out.println(fCount[1]);
%>
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index2.jsp">下一站，幸福</a>
			</div>
			<div
			style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
			管理者，${userName}&nbsp;您好!!&nbsp; <a href="LoginServlet?action=logOut"
				class="btn btn-warning square-btn-adjust">Logout</a>
		</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img src="img/benny.jpg"
						class="user-image img-responsive" /></li>


					<li><a href="index2.jsp"><i class="fa fa-dashboard fa-3x"></i>
							Dashboard</a></li>
<!-- 					<li><a href="ui.html"><i class="fa fa-desktop fa-3x"></i> -->
<!-- 							UI Elements</a></li> -->
<!-- 					<li><a href="tab-panel.html"><i class="fa fa-qrcode fa-3x"></i> -->
<!-- 							Tabs & Panels</a></li> -->
					<li>
						<a class="active-menu" href="chart.jsp">
							<i class="fa fa-bar-chart-o fa-3x"></i> Morris Charts
						</a>
					</li>
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
<!-- 					<li><a href="table.html"><i class="fa fa-table fa-3x"></i> -->
<!-- 							Table Examples</a></li> -->
<!-- 					<li><a href="form.html"><i class="fa fa-edit fa-3x"></i> -->
<!-- 							Forms </a></li> -->


<!-- 					<li><a href="#"><i class="fa fa-sitemap fa-3x"></i> -->
<!-- 							Multi-Level Dropdown<span class="fa arrow"></span></a> -->
<!-- 						<ul class="nav nav-second-level"> -->
<!-- 							<li><a href="#">Second Level Link</a></li> -->
<!-- 							<li><a href="#">Second Level Link</a></li> -->
<!-- 							<li><a href="#">Second Level Link<span class="fa arrow"></span></a> -->
<!-- 								<ul class="nav nav-third-level"> -->
<!-- 									<li><a href="#">Third Level Link</a></li> -->
<!-- 									<li><a href="#">Third Level Link</a></li> -->
<!-- 									<li><a href="#">Third Level Link</a></li> -->

<!-- 								</ul></li> -->
<!-- 						</ul></li> -->
<!-- 					<li><a href="blank.html"><i class="fa fa-square-o fa-3x"></i> -->
<!-- 							Blank Page</a></li> -->
				</ul>

			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>圖表分析</h2>
						<h5>歡迎來到，下一站，幸福 !</h5>

					</div>
				</div>
				<!-- /. ROW  -->
				<hr />

				<div class="row">


					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">誰是旅遊王</div>
							<div class="panel-body">
								<div id="morris-bar-chart"></div>
							</div>
						</div>
					</div>
<!-- 					<div class="col-md-6 col-sm-12 col-xs-12"> -->
<!-- 						<div class="panel panel-default"> -->
<!-- 							<div class="panel-heading">Area Chart Example</div> -->
<!-- 							<div class="panel-body"> -->
<!-- 								<div id="morris-area-chart"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

					<!-- 昱豪 -->
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">下一站幸福，Top6 好友人氣王</div>
							<div class="">
								<div id="containerF"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">

					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">旅遊地區點擊率統計</div>
							<div class="panel-body">
								<div id="morris-donut-chart"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">部落格發表王~＊</div>
							<div class="">
								<div id="containerc"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="js/jquery.metisMenu.js"></script>
	<!-- MORRIS CHART SCRIPTS -->
	<script src="js/morris/raphael-2.1.0.min.js"></script>
	<script src="js/morris/morris.js"></script>
	<!-- CUSTOM SCRIPTS -->
<!-- 	<script src="js/custom.js"></script> -->
	<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/highcharts-3d.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.highcharts.com/highcharts-more.js"></script>
	<script>
	(function ($) {
		
		/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
		

		//SSE服務瀏覽器端實作
		var getSvcUrl="platform/getSvc.jsp";
		var source = new EventSource(getSvcUrl);
		//開啟連結的路徑
		var url="";
		//判別是否有傳回相同ID
		var getID="";
		source.addEventListener('message', function(e) {
				if((e.data).length!=0){
				 console.log(e.data);
				 console.log("1"+getID);
				 //當第一次近來時候一定不一樣所以只會append 一次
				 if(e.data!=getID){
				  url="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%>/Project_1/P9_OnlineService/OnlineService.jsp?svcmember="+e.data+"&admin=admin123";
				 
				 $('#onlinesvc').append("<a href='#' style='color:white;text-decoration: none' class='removeSvc' id="+url+"><p>※您有新訊息※</p></a> ");
				 getID=e.data;
				 console.log("2"+getID);
				
				}
				<%-- 				  url="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P9_OnlineService/OnlineService.jsp?svcmember="+e.data; --%>
				// 				  $('#onlinesvc').append("<a href="+url+"><p>※線上克服2</p></a> ");
				// 					$('#tiles').append("<li id='"+item.TravelDiary_ID+"'>"+item.TravelDiary_Content+"<p>"+item.TravelDiary_Name+"</p></li>");
				// 				  var notifymsg = JSON.parse(e.data);
				// 				  frdplatform = notifymsg.cooperation_friend;
				// 				  $('#dialog-checkCoFromFrd').dialog('option', 'title', notifymsg.frdName+' 邀請你一起規劃路線');
				// 				  $('#dialog-checkCoFromFrd > h4').text(notifymsg.invite_msg);
				// 				  dialogCoFromFrd.dialog("open");	
				  }else{
					  console.log("3"+getID);
					  console.log(e.data);
					  //當是null時候清空
					  getID="";
				  }
				}, false);
				
			var propID='';
			var servletURL='';
			//當後臺管理者下超連結的時候將連結取消掉
			//因為是動態生成的所以要用on來綁他老爸底下小孩有符合.removeSvc都可以使用click的事件
			$('#onlinesvc').on('click','.removeSvc',(function(){
				window.open(propID=$(this).prop('id'), "_blank", " top=5, left=50, width=660, height=600");
				//當按下管理者按下click時候把超連結移除
				//並去資料庫將這一筆的欄位改成null
				//這樣在getSvc.jsp就不會傳資料過來
				propID=$(this).prop('id');
				$(this).remove();
				
//				應該是要在關閉服務的時候再update null字串(所以是在StoryWebSocket這裡)		
//		 		servletURL = "P9_OnlineService/OnlineServiceServlet";
//		   		$.ajax({
//		     		"type": 'post',
//		       		"url": servletURL,
//		       		"data": {"action":"changeToNULL", "svcID":propID},
//		       		"dataType":"text",
//		       		"async":false,
//		       		"success":function(datas){
		      			
//		      		}
//		      	});
			}));
			/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
				
		
		
	//先var變數到外面之後才可以給圓餅圖使用	
	var team = new Array();
	
	var team2 = new Array();
	var team3 = new Array();
	//因為圓餅圖網頁一載入時候就會執行所以我撈資料庫的值必須比他之前要先執行
	//所以先包成function並讓ajax設定改成非同步
	function gethit(){
		
		//去資料庫撈點擊率前4名
		$.ajax({ 
 			"url": "getEachAreaTopOneServlet",
 			"type":"post",
 			"data":{'action':'getEachTopOne'},
 			"dataType":"text",
 			"async": false,
 			"success":function(datas){
 				var myObject = JSON.parse(datas); 
 				$.each(myObject,function(i,item){
 					if(i==0){
 						team[0]=item.北部;
 					}
 					if(i==1){
 						team[1]=item.中部;
 					}
 					if(i==2){
 						team[2]=item.南部;
 					}
 					if(i==3){
 						team[3]=item.東部;
 					}
 				});
 			}
 		});	 
		
		
		//去資料庫撈登入前5名
		$.ajax({ 
 			"url": "getLoginMostServlet",
 			"type":"post",
 			"data":{'action':'getLoginMostTopOne'},
 			"dataType":"text",
 			"async": false,
 			"success":function(datas){
 				var myObject = JSON.parse(datas); //記得把字串轉乘json物件
 				$.each(myObject,function(i,item){
 					
 					team2[i]=item.member_name;
 					team3[i]=item.totalcount;
					

 				});
 			}
 		});	 // END of 登入前5名
		
		
	}	
	    "use strict";
	    var mainApp = {

	        main_fun: function () {
	            /*====================================
	            METIS MENU 
	            ======================================*/
	            $('#main-menu').metisMenu();

	            /*====================================
	              LOAD APPROPRIATE MENU BAR
	           ======================================*/
	            $(window).bind("load resize", function () {
	                if ($(this).width() < 768) {
	                    $('div.sidebar-collapse').addClass('collapse')
	                } else {
	                    $('div.sidebar-collapse').removeClass('collapse')
	                }
	            });

	            /*====================================
	            MORRIS BAR CHART
	         ======================================*/
	            Morris.Bar({
	                element: 'morris-bar-chart',
	                data: [
	                {y: 0, a: 0},
	                {y: team2[0], a: team3[0]},
	                {y: 0, a: 0}, 
	                {y: team2[1], a: team3[1]},
	                {y: 0, a: 0}, 
	                {y: team2[2], a: team3[2]},
	                {y: 0, a: 0}, 
	                {y: team2[3], a: team3[3]},
	                {y: 0, a: 0}, 
	                {y: team2[4], a: team3[4]} 
// 	                {y: 0, a: 0 }
	                ],
	                xkey: 'y',
	                ykeys: ['a'],
	                labels: ['登入次數'],
	                hideHover: 'auto',
	                resize: true
	            });
	    		
	            /*====================================
	          				MORRIS DONUT CHART
	      		 ======================================*/
	            Morris.Donut({
	                element: 'morris-donut-chart',
	                data: [{
	                    label: "北部",
	                    value: team[0]
	                }, {
	                    label: "中部",
	                    value: team[1]
	                }, {
	                    label: "南部",
	                    value: team[2]
	                }, {
	                    label: "東部",
	                    value: team[3],
	                }],
	                resize: true
	            });
	            
	            /*====================================
	         			MORRIS AREA CHART
	      		======================================*/

	            Morris.Area({
	                element: 'morris-area-chart',
	                data: [{
	                    period: '2010 Q1',
	                    iphone: 2666,
	                    ipad: null,
	                    itouch: 2647
	                }, {
	                    period: '2010 Q2',
	                    iphone: 2778,
	                    ipad: 2294,
	                    itouch: 2441
	                }, {
	                    period: '2010 Q3',
	                    iphone: 4912,
	                    ipad: 1969,
	                    itouch: 2501
	                }, {
	                    period: '2010 Q4',
	                    iphone: 3767,
	                    ipad: 3597,
	                    itouch: 5689
	                }, {
	                    period: '2011 Q1',
	                    iphone: 6810,
	                    ipad: 1914,
	                    itouch: 2293
	                }, {
	                    period: '2011 Q2',
	                    iphone: 5670,
	                    ipad: 4293,
	                    itouch: 1881
	                }, {
	                    period: '2011 Q3',
	                    iphone: 4820,
	                    ipad: 3795,
	                    itouch: 1588
	                }, {
	                    period: '2011 Q4',
	                    iphone: 15073,
	                    ipad: 5967,
	                    itouch: 5175
	                }, {
	                    period: '2012 Q1',
	                    iphone: 10687,
	                    ipad: 4460,
	                    itouch: 2028
	                }, {
	                    period: '2012 Q2',
	                    iphone: 8432,
	                    ipad: 5713,
	                    itouch: 1791
	                }],
	                xkey: 'period',
	                ykeys: ['iphone', 'ipad', 'itouch'],
	                labels: ['iPhone', 'iPad', 'iPod Touch'],
	                pointSize: 2,
	                hideHover: 'auto',
	                resize: true
	            });

	            /*====================================
	   					 MORRIS LINE CHART
				 ======================================*/
	            Morris.Line({
	                element: 'morris-line-chart',
	                data: [{
	                    y: '2006',
	                    a: 100,
	                    b: 90
	                }, {
	                    y: '2007',
	                    a: 75,
	                    b: 65
	                }, {
	                    y: '2008',
	                    a: 50,
	                    b: 40
	                }, {
	                    y: '2009',
	                    a: 75,
	                    b: 65
	                }, {
	                    y: '2010',
	                    a: 50,
	                    b: 40
	                }, {
	                    y: '2011',
	                    a: 75,
	                    b: 65
	                }, {
	                    y: '2012',
	                    a: 100,
	                    b: 90
	                }],
	                xkey: 'y',
	                ykeys: ['a', 'b'],
	                labels: ['Series A', 'Series B'],
	                hideHover: 'auto',
	                resize: true
	            });
	           
	     
	        },

	        initialization: function () {
	            mainApp.main_fun();

	        }

	    };
	    
	    //************************昱豪************************
	    // Initializing ///

	    $(document).ready(function () {
	    	gethit();
	        mainApp.main_fun();
	    });
	    
	    
        $('#containerF').highcharts({
        	chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45,
                    beta: 0
                }
            },
            title: {
                text: '下一站幸福，Top6 好友人氣王!!'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 80,
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                type: 'pie',
                name: '好有人數',
                data: [
                    {
                        name: '<%=fKing[0]%>',
                        y: <%=fCount[0]%>,
                        sliced: true,
                        selected: true
                    },
                    ['<%=fKing[1]%>',<%=fCount[1]%>],
                    ['<%=fKing[2]%>',<%=fCount[2]%>],
                    ['<%=fKing[3]%>',<%=fCount[3]%>],
                    ['<%=fKing[4]%>',<%=fCount[4]%>],
                    ['<%=fKing[5]%>',<%=fCount[5]%>]
                ]
            }]
        });
        
        //******************
        //************************昱豪************************
        $('#containerc').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: '部落格發表王~＊'
            },
            xAxis: {
                type: 'category',
                labels: {
                    rotation: -45,
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                    }
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '文章數'
                }
            },
            legend: {
                enabled: false
            },
            tooltip: {
                pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
            },
            series: [{
                name: 'Population',
                data: [
                    ['<%= bKing[0]%>', <%=bCount[0]%>],
                    ['<%= bKing[1]%>', <%=bCount[1]%>],
                    ['<%= bKing[2]%>', <%=bCount[2]%>],
                    ['<%= bKing[3]%>', <%=bCount[3]%>],
                    ['<%= bKing[4]%>', <%=bCount[4]%>],
                    ['<%= bKing[5]%>', <%=bCount[5]%>],
                ],
                dataLabels: {
                    enabled: true,
                    rotation: -90,
                    color: '#FFFFFF',
                    align: 'center',
                    x: 4,
                    y: 10,
                    style: {
                        fontSize: '15px',
                        fontFamily: 'Verdana, sans-serif',
                        textShadow: '0 0 3px black'
                    }
                }
            }]
        });
	}(jQuery));
	
// 	 label: "北部",
//      value: team[0]
//  }, {
//      label: "中部",
//      value: team[1]
//  }, {
//      label: "南部",
//      value: team[2]
//  }, {
//      label: "東部",
//      value: team[3],
	

	        
</script>
</body>
</html>
