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


<!-- Sweet Alert -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">


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

input:read-only {
background-color: #95a1ad;

}

</style>
</head>
<body class="gray-bg">
   <div id="backimg" >

      <div id="ch">
         <div id="loginDiv">
<!-- 				<form action="/ddit/login/login" method="post" style="width: 450px;"> -->
					<ul style="padding-right: 11px;">
						<li>
							<h1>Hello Doctor</h1>
						</li>
						<li></li>
						<div class="info">
							<li style="display: inline-block; float: left;">
							<input  type="text" placeholder="아이디" value="" name="dId" id="dId" style="width: 250px"  autocomplete="off">
							</li>
							<button type="button"  id="firstbtn" class="btn btn-primary " style="height: 74px;margin-top: 9px;" onclick="firstLogin()">1차 로그인</button>
							<li style="position: absolute;margin-top: -34px;"><input type="password" placeholder="비밀번호" value="" name="pwd" id="pwd" style="width: 250px"  autocomplete="off">
							</li>

						</div>

				<div class="secondLogin" style="display: none;">
				   <form action="<%=request.getContextPath() %>/otpcheck/" method="post">
						<li style="display: inline-block; width: 250px; margin-right: 0px; margin-top: 24px;">
						<input maxlength="6"  type="text" placeholder="OTP" name="user_code" style="width: 100%;">
							<input name="encodedKey" type="hidden" readonly="readonly" value="${doctorLogin.otpCo}">
						</li>

						<li style="display: inline-block; margin-bottom: 0px; width: 89px; margin-right: 0; margin-left: 8px;">
							<button type="submit" class="btn btn-primary block full-width m-b" style="width: 100%;">2차 로그인</button>
						</li>
					</form>
				</div>



					<!-- 						<div class="info"> -->
<!-- 							<li style="display: inline-block; float: left;"><input type="text" placeholder="아이디" value="" name="dId" style="width: 330px"> -->
<!-- 							</li> -->
<!-- 							<button type="submit" class="btn btn-primary " style="height: 74px;margin-top: 9px;">1차 로그인</button> -->
<!-- 							<li style="position: absolute;margin-top: -34px;"><input type="password" placeholder="비밀번호" value="" name="pwd" style="width: 330px"> -->
<!-- 							</li> -->

<!-- 						</div> -->


						<!--                <li> -->
						<!--                   <button type="submit" class="btn btn-primary block full-width m-b" >1차 로그인</button> -->
						<!--                </li> -->
						<li style="">
							<h3>
								<a onclick="window.open('http://localhost/ddit/findid/','window_name','width=550,height=500');"><small style="color: white;">아이디/비밀번호 찾기</small> </a>
							</h3>
						</li>
						<li style="margin-right: 0px;">
						<a class="btn btn-sm btn-white btn-block" href="/ddit/regist/"> 회원가입 </a>
						</li>
					</ul>
<!-- 				</form> -->
			</div>
      </div>
   </div>

 <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

<!-- Sweet alert -->
<script
	src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>



<script>
function firstLogin(){

	 var dId = $('#dId').val();
	 var pwd = $('#pwd').val();

	 console.log(dId)
	 console.log(pwd)

		data = {
			"dId" : dId,
			"pwd" : pwd
		}

		$.ajax({
				url:"<%=request.getContextPath()%>/login/login",
				type : "POST",
				data: JSON.stringify(data),
				contentType:'application/json',
				success:function(res){
// 					alert("클라이언트  IP@@"+res.docipresult)
// 					alert("로그인"+res.loginchoice)
					const resdId = $.trim(res.dId);
					const respwd = $.trim(res.pwd);
					const resfail = $.trim(res.fail);
					const resadmin = $.trim(res.admin);
					const loginchoice = $.trim(res.loginchoice);
					const docipresult = $.trim(res.docipresult);
// 					alert("어떤 res!"+res.admin)
// 					alert("어떤 res!"+resadmin)


				if(resdId==dId && respwd==pwd){
					if(docipresult.toUpperCase() == 'IPSUCCESS'){
// 					alert("로그인 성공")
						if(resadmin){
	//	 						alert("관리자")
								location.href="<%=request.getContextPath()%>/manager/manager"
							}
							else if(loginchoice == '2'){

							$('.secondLogin').css('display','block');
							$("#firstbtn").css('visibility','hidden')
							$("#dId").attr('disabled','disabled')
							$("#pwd").attr('disabled','disabled')
							}else if(loginchoice =='1'){
								location.href="<%=request.getContextPath()%>/index.do"
							}
					}else{
						swal("", "허가되지 않은 IP입니다. 관리자에게 문의하세요.", "warning");
						setTimeout(function(){
						}, 3000);
					}

				}else{
					swal({
							title : "로그인이 실패했습니다. 아이디와 비밀번호를 확인해주세요.",
							type : "warning"
						});
					$("#dId").val('')
					$("#pwd").val('')
				}




				},
				error:function(xhr){
					alert("오류:"+xhr)
				}

			})


}
</script>

<c:if test="${loginfail eq 'login'}" >
   <script>
   	swal({
		title : "OTP가 일치하지 않습니다. 다시 확인해주세요.",
		type : "warning"
	});
//       window.close();
//       window.opener.location.reload();
   </script>
</c:if>


<c:if test="${loginfail eq 'blank'}" >
   <script>
   	swal({
		title : "OTP를 입력해주세요.",
		type : "warning"
	});
//       window.close();
//       window.opener.location.reload();
   </script>
</c:if>


<c:if test="${regist eq 'success'}" >
   <script>
	 swal("", "회원가입에 성공했습니다.", "success");
		setTimeout(function(){
		}, 1000);
   </script>
</c:if>


<c:if test="${regist eq 'fail'}" >
   <script>
	swal({
	title : "시스템 장애로 회원등록에 실패했습니다.\n관리자에게 문의바랍니다.",
	type : "warning"
});
   </script>
</c:if>


</body>



</html>