<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<style type="text/css">
.input_ip{
/* 	    background-color: #FFFFFF; */
/*     background-image: none; */
/*     border: 1px solid #e5e6e7; */
/*     border-radius: 1px; */
/*     color: inherit; */
/*     padding: 6px 12px; */
/*     transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; */
}
</style>
</head>
<body>
	<table class="table table-bordered" style="width: 90%; margin: 0 auto;">
		<thead>
			<tr>
				<th>의사명</th>
				<th>아이디</th>
				<th>호수</th>
				<th>TEL</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>강현수</td>
				<td>gustn</td>
				<td>304호</td>
				<td>826-0501</td>
			</tr>
		</tbody>
	</table>
	<br>
	<div style="text-align: center;">
		<input type="text" id="input_ip"><button class="btn btn-success ip_check">IP체크</button>
	</div>
	<br>
	<div class="check_div" style="text-align: center;">
		<button class="btn btn-success ip_update">등록</button>
		<button class="btn btn-success">취소</button>
	</div>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
	var ip = document.getElementById('input_ip');
	var use_ip = "1"
	var db_ip = ["1", "2", "3" ];
			
	$(".ip_check").on("click", function(){
		if(db_ip.includes(ip.value) == true){
			if(ip.value == use_ip){
				alert("이미 사용중인 아이피입니다.");
			}else{
				alert("사용가능한 아이피입니다.");
			}
		}else{
			alert("허용된 아이피가 아닙니다.");
		}
	});
	
	$(".ip_update").on("click", function(){
				
	});
	</script>
</body>
</html>