

var socket = null;
//websocket初始化
function initialize() {
    //new WebSocket的服務網址(之後必須要用動態產生每一個網址都不同對話)
    socket = new WebSocket("ws://"+ serverName +':'+ serverPort + contextPath +"/P9_OnlineService/service/notifications/"+OlineSvc);
    //console.log("ws://"+ serverName +':'+ serverPort + contextPath +"/P9_OnlineService/service/notifications");
    //socket.onmessage 這個方法是當server 回傳聊天內容時候(也是當Encoder結束時候) 呼叫onSocketMessage這個方法去執行。
    socket.onmessage = onSocketMessage;
}         //處理收到的訊息  = 方法onSocketMessage↓↓↓


//從前端接收的資料到這然後送到Decoder.java作判別
function serviceChat(chat){
	//因為webSocket是接受json格式 但是在資料傳遞的時候必須要用String格式傳送
	//並須先包成json的object格式 在轉成字串到server端
	//server端接收到之後 必須把剛剛轉成字串的還原成json格式
	//json內容有:1.action 2.聊天內容每發送一次就記錄一次
	var chatToSend = {
			action:"addChatSvc",
			chat: chat,//userchat
	};
	//使用socket.send的方法 並要將josn物件轉成"字串格式"才可以送到server端
	socket.send(JSON.stringify(chatToSend));//object轉成字串送出
	console.log(JSON.stringify(chatToSend));
	console.log(chatToSend);
	
}




//接收Server發出的訊息
function onSocketMessage(event) { 
//	alert("server發出到前端1");
   if (event.data) {
//	   alert("server發出到前端2");
      var receivedSticker = JSON.parse(event.data);//建立接收sticker的物件 <- data轉成JSON物件 
//      alert(receivedSticker.action);
//      alert(receivedSticker.chat);
//      console.log(receivedSticker.action);
      if(receivedSticker.action == "addChatSvc"){
    	  var chatdiv = document.getElementById("chatDiv");
//    	  alert("if="+receivedSticker.action);
//    	  alert("回收到的內容="+receivedSticker.chat);
    	  chatdiv.insertAdjacentHTML("BeforeEnd" ,receivedSticker.chat+"<br>");
    	  chatdiv.scrollTop = chatdiv.scrollHeight;
      }
   }
}



window.onload = initialize;
