<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <script>
    (function($) {
    	
    	/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
		

		//SSE服務瀏覽器端實作
		var getSvcUrl="../platform/getSvc.jsp";
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
		
		
	   })(jQuery);
    </script>