<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Register</title>

    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
	<link
		   href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
		   rel="stylesheet">


<style>


.row{

    width: 80%;
    margin-left: 0px;
    margin-top: 20px;

}
</style>


</head>

<body class="gray-bg" style="background: white;overflow: hidden;">
<%-- 	<form action="<%=request.getContextPath()%>/regist/phonecheck" method="post"> --%>
	<div class="row-main">
 		<div class="col-sm-12">
	           <h1 class="logo-name" style="font-size: 30px;color: black;border-bottom: solid #e7eaec;letter-spacing: -3px;">전화번호 인증 확인</h1>
         </div>
 	</div>

 	<div class="row">
 		<div class="col-sm-12">
 		<input maxlength='6' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="telcheck" id="telcheck" type="text" class="form-control" placeholder="인증번호 입력" required="">
 		</div>
 	</div>
 	<p style="margin-left: 15px; color: red;" class="input"></p>
 	<div class="row" style="display: inline-block;">
 		<div class="col-sm-6"><button id="checkbtn" type="submit" class="btn btn-w-m btn-primary" style=" float: left; width: 45%;">확인</button></div>
 		<div class="col-sm-6"><button type="button" class="btn btn-w-m btn-primary" style=" float: right; width: 45%; background: #dc5c5c; border-color: #dc5c5c;" onclick="window.close()">취소</button></div>
 	</div>
<!-- </form> -->
 	 <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

	<script
   src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>




<script>

// 회원가입에서 전화인증 클릭시 함수 자동 실행
var result = null;
$(document).ready(function(){
	var number = '${param.number}';

	data = {
		"number" : number
	}

	$.ajax({
			url:"<%=request.getContextPath()%>/regist/phoneform",
			type : "POST",
			data: JSON.stringify(data),
			contentType:'application/json',
			success:function(res){
				result = res;

			},
			error:function(xhr){
				alert("오류:"+xhr)
			}

		})



});

// 인증확인 버튼 클릭시 인증번호 비교
$("#checkbtn").on('click',function(){
	var check = $("#telcheck").val();


	if(result==check){
// 		alert("인증번호가 완료되었습니다.");
		swal("", "인증번호가 완료되었습니다.", "success");
		setTimeout(function(){
		window.opener.parent_function();
 		window.close();

		}, 1000);
	}else{
// 		alert("인증번호가 다릅니다. 다시 확인해 주세요. ");
		swal({
				title : "인증번호가 다릅니다. 다시 확인해 주세요.",
				type : "warning"
			});
		$("#telcheck").val('');
	}



})



var num = 60*3;
var myVar;   
function time(){
	   myVar = setInterval(alertFunc, 1000);     
	}   
    time();
	function alertFunc() {
		var min = num / 60;
		    min = Math.floor(min);
		var sec = num - (60 * min);
		      console.log(min)
		      console.log(sec)  
	   $('.input').text(min + '분' + sec + '초'); 

	   if(num == 0){
		   alert("시간 초과로 인증을 종료합니다.");
		   window.close();
		   clearInterval(myVar); //타이머 종료

	   }
	   num--;

	}

</script>


</body>
</html>