<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="<%=request.getContextPath() %>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

<style>

body {
   width: 1200px;
   height: 100%;
   margin: 0 auto;
}

#backimg{
   background-image : url("<%=request.getContextPath()%>/resources/css/patterns/background.png");
   z-index: -1;
   width: 100%;
   height: 100%;
   background-repeat: no-repeat;
   background-size: 100% 100%;
}

#loginDiv{
    display: inline-block;
    margin-top: 19%;
    background-color: #f3f3f4;
    border-radius: 10px;
    border: 1px solid #f3f3f4;
    opacity: 0.9;
    margin-left: 28%;
    color: black;
    width: 530px;
}
}


</style>

</head>
<body class="gray-bg">
	<div id="backimg">
		<div id="ch">
			<div id="loginDiv">
				<img alt="" src="https://images.prismic.io/smartproxy-main/7962258c-925a-4cf2-9d72-c0799ef5c9b7_What%20is%20IP%20Blocking%3F.jpeg?ixlib=gatsbyFP&amp;auto=compress%2Cformat&amp;fit=max&amp;rect=0%2C26%2C1400%2C788&amp;w=1024&amp;h=576"
					style="width: 100%;">
				<h1 style="font-weight: bold;color: black;text-align: center;font-size: 16px;">현재 접속하신 IP는 보안상 허용되지 않은 IP이므로 접근이 불가합니다!</h1>
			</div>
		</div>
	</div>

</body>
</html>