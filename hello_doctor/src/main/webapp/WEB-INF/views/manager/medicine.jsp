<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>
	<div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>약품명</th>
					<th>약품여부</th>
					<th style="width: 15%">급여여부</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>라베나정 20mg</td>
					<td>ME000001</td>
					<td style="width: 15%">Y</td>
					<td>2018/08/09</td>
				</tr>
			</tbody>
		</table>
		<h2 style="text-align: center;">해당 약품을 추가하시겠습니까?</h2>
		<div class="container">
			<div class="row">
				<div class="col">
					<button class="btn btn-warning" style="float: right;">취소</button>
				</div>
				<div class="col">
					<button class="btn btn-success">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".btn-success").on("click", function(){
			alert("약품이 정상적으로 등록되었습니다.");
			window.close();
			window.opener.location.reload();
		})
	</script>
	<script type="text/javascript">
		$(".btn-warning").on("click", function(){
			window.close();
			window.opener.location.reload();
		})
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/commons.js"></script>
</body>
</html>