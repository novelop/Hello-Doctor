<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="issVO" value="${issVO}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
element.style {

}

.form-group {
	margin-bottom: -1rem;
}

.form-text {
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 8px;
	display: block;
	height: 170px;
	overflow: auto;
	padding-left: 20px;
	width: 80%;
}

.ibox-title {
	text-align: left;
	padding: 10px;
}

button.dim {
	height: 25px;
	padding-down: 5px;
	margin-bottom: 10px !important;
	margin-left: 9px;
}
</style>
</head>
<body>

	<div class="ibox ">
		<div class="ibox-title">
			<h3 style="margin-left: 20px;">
				특이사항 상세 <img alt="상세보기" src="<%=request.getContextPath()%>/resources/img/file.png" style="width: 20px; height: 20px;">
				<span style="float: right; font-size: 0.8em;"> <i class="fa fa-clock-o"></i>${issVO.mDate}&nbsp;&nbsp;&nbsp;
					<button class="btn btn-warning" type="button" onclick="window.close();">닫기</button>
				</span>

			</h3>
		</div>
		<div class="ibox-content">

			<div class="form-group row">
				<label class="col-sm-2 col-form-label"><strong>주치의</strong> </label>
				<h4>${issVO.coDocName}</h4>
			</div>
			<hr>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label"><strong>작성 의료진</strong></label>
				<h4>${issVO.dName}</h4>
			</div>
			<hr>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label"><strong>환자명</strong></label>
				<h4>${issVO.pName}</h4>
			</div>
			<hr>


			<div class="form-group row">
				<label class="col-sm-2 col-form-label"><i class="fa fa-pencil-square-o"></i><strong>특이사항</strong></label>
				<div class="form-text">
					<h4>${issVO.issContent}</h4>
				</div>
			</div>

			<br>

		</div>

	</div>

</body>
</html>