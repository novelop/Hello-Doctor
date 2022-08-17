<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

 <!-- Sweet Alert -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">


<!-- Sweet alert -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

<script>

window.onload=function(){
	  //실행할 내용
	  swal("수락성공!","","success");
	  setTimeout(function(){
		  window.opener.location.reload();
			window.close();
	       },1000);
	}



</script>