<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%-- <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"> --%>
<%-- <link href="<%=request.getContextPath() %>/resources/css/animate.css" rel="stylesheet"> --%>
<link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
<link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<style type="text/css">
.input-group-append{
	display: contents;
}
</style>
</head>
<body>
	<div>
		<div style="float: right;">
			<span>환자명 검색</span>
			<input type="text" placeholder="검색어를 입력하세요">
			<div class="input-group-append">
				<button class="btn btn-primary btn-sm" type="button">검색</button>
			</div>
		
		</div>
		
		<table class="table table-bordered" style="text-align: center;">
			<thead>
				<tr>
					<th>환자명</th>
					<th>주민등록번호</th>
					<th>공개</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>강현수</td>
					<td id="p_num">970213-1******</td>
					<td><input type="checkbox"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	$('input:checkbox').click(function () {
        swal({
            title: "진료 공개 여부를 변경하시겠습니까?",
            text: "환자명 : 강현수(공개)",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "확인",
            closeOnConfirm: false
        }, function () {
            swal("", "공개 여부 수정에 성공했습니다.", "success");
            setTimeout(function(){             
               window.location.reload();
            },1000);
            
        });
        
    });
	</script>
		<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
	
</body>
</html>