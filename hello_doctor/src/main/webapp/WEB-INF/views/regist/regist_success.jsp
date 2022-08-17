<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <link
   href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
   rel="stylesheet">

   <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>


<script>
// 	alert0('회원가입에 성공했습니다.\n 로그인 페이지로 이동합니다.');
// 	 swal("", "회원가입에 성공했습니다.\n 로그인 페이지로 이동합니다.", "success");
	 swal({
		title : "회원가입에 성공했습니다.",
		text : "로그인 페이지로 이동하시겠습니까?",
		type : "info",
		showCancelButton: true,
	    confirmButtonColor: "#DD6B55",
	    confirmButtonText: "확인",
	    closeOnConfirm: false
	 }, function(){
		location.href = "<%=request.getContextPath()%>/login/loginForm";
	 });




</script>