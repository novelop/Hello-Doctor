<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <link
   href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
   rel="stylesheet">

   <script
   src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

<script>
	alert("시스템 장애로 회원등록에 실패했습니다.\n관리자에게 문의바랍니다.");

// 	swal({
// 		title : "시스템 장애로 회원등록에 실패했습니다.\n관리자에게 문의바랍니다.",
// 		type : "warning"
// 	});
	history.go(-1);
</script>