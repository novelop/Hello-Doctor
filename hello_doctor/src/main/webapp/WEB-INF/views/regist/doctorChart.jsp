<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="openWindow()">조직도</button>
</body>
<script>
function openWindow(){
	var win = window.open("../scheduler/regist.do", "PopupWin", "width=1100,height=800");
}
</script>
</html>