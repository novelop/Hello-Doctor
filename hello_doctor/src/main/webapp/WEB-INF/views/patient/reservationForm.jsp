<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if ('${from}' == 'regist') {

		opener.location.reload();
		window.close();

	}
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer" />
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.datetimepicker.css" />
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox ">
				<div class="ibox-title">
					<h5>환자 예약</h5>
				</div>
				<div class="ibox-content">
					<form method="post" action="reserveRegist">
						<input type="submit" value="등록">
						<div class="form-group  row">
							<label class="col-sm-2 col-form-label">환자 코드</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="pNo"
									value="${pNo }">
							</div>
						</div>

						<div class="form-group  row">
							<label class="col-sm-2 col-form-label">예약 일</label>

							<div class="col-sm-10">
								<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
									for="date"></label> <input class="datetimepicker form-control"
									type="text" placeholder="YYYY - mm - dd" id="title"
									name="rsvDay2"
									style="display: inline; width: 30%; margin-left: 28px;">
							</div>
						</div>
						<div class="form-group  row">
							<label class="col-sm-2 col-form-label">예약 내용</label>

							<div class="col-sm-10">
								<select class="form-control m-b" name="rsvName">
									<option value="외래진료">외래진료</option>
									<option value="입원치료">입원치료</option>
									<option value="수술">수술</option>
								</select>
							</div>
						</div>
						<div class="form-group  row">
							<label class="col-sm-2 col-form-label">의사 선택</label>

							<div class="col-sm-10">
								<select class="form-control m-b" name="dId">
									<c:forEach items="${doctor }" var="i">

										<option value="${i.dId}">${i.dName }(${i.maName })</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

					</form>
				</div>
			</div>
		</div>
	</div>





	<!-- Mainly scripts -->
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

	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jquery.datetimepicker.full.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
			  $('.datetimepicker').datetimepicker();
		});

	</script>
</body>
</html>