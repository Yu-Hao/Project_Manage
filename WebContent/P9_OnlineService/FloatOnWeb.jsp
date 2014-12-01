<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery-1.11.0.js"></script>
<script src="../platform/include_sticker/sticker_js/sticker.js"></script>
<title>Insert title here</title>
<style>
  #abgne_float_ad {
    display: none;
    position: absolute;
  }
  #abgne_float_ad img {
    border: none;
  }
/*   故意給很長的內容測試 */
   div.bigDiv {
    height: 3000px;
  }

</style>
</head>
<body>
	
	<div id="abgne_float_ad" >
	<a href="">
		<img src="../platform/include_sticker/sticker_pic/onlinepic.png" id="openService">
	</a>
	</div>
	<div class="bigDiv">我是一個很長的區塊</div>
	
<%--   <%@ include file="../platform/include_sticker/include_sticker.jsp" %> --%>

</body>
</html>