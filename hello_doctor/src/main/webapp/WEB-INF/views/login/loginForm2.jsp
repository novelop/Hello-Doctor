<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<!--  -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Login</title>

    <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="<%=request.getContextPath() %>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">


<style type="text/css">
body {
   width: 1200px;
   height: 100%;
   margin: 0 auto;
}

#ch{

   width: 500px;
   margin: 0 auto;
   z-index: 50;
   display: flex;
   justify-content: center;
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
   margin-top: 57%;
   background-color: #1555d8;
   border-radius: 10px;
   border: 1px solid gray;
   opacity: 0.9;
}
li{
   list-style: none;
   margin: 10px;
}
input{
   background-color: #ffffff;
   background-image: none;
   border: 1px solid #e5e6e7;
   border-radius : 1px;
   padding: 6px 12px;
}
h3{
   text-align: center;
}
h1{
   text-align: center;
   font-weight: bold;
   color : white;
}
h2{
   text-align: center;
    font-weight: bold;
    color: black;

}
ul{
   padding: 0px;
}
.info{
   text-align: inherit;
}
.infoLabel{
   width: 70px;
   display: inline-block;
}
span{
   text-align: right;
   padding: 5px;
   font-weight: bold;
   color : black;
}

</style>
</head>

<body class="gray-bg">
   <div id="backimg" >
      <div id="ch">
         <div id="loginDiv">
            <form action="<%=request.getContextPath() %>/otpcheck/" method="post">
            <ul>
               <li>
                  <h1>Hello Doctor</h1>
               </li>
               <li>
               </li>

                  <li>
                     <input type="text" placeholder="OTP"  name="user_code">
                     <input name="encodedKey" type="hidden" readonly="readonly" value="${doctorLogin.otpCo}">
                  </li>
               <li>
                  <button type="submit" class="btn btn-primary block full-width m-b" >2차 로그인</button>
               </li>
               <li>
               </li>
            </ul>
            </form>
         </div>
      </div>
   </div>


<c:if test="${loginfail eq 'login'}" >
   <script>
      alert("OTP가 틀렸습니다.");
      window.close();
      window.opener.location.reload();
   </script>
</c:if>

</body>



</html>