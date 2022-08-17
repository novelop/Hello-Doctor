<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ip" value="${dataMap.list }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker }"></c:set>
<c:set var="cri" value="${dataMap.pageMaker.cri }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
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
<!-- FooTable -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/footable/footable.core.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<style type="text/css">
table > tbody > tr > td{
	border: 1px solid #e7eaec;
    line-height: 1.42857;
    padding: 8px;
    vertical-align: top;
}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<br>
	<div class="container">
		<div>
			<h1 style="color: black; font-weight:bold; margin-top: 0px;">IP 관리</h1>
		</div>
		<br>
		<div>
		<div class="" style="margin-bottom:10px;">
			<table class="footable table table-stripped" data-page-size="8" data-filter=#filter>
				<thead>
				<tr style="border-top: 2px solid; background: #F5F5F6" >
					<th style="border-bottom:1px solid">
						IP
					</th>
					<th style="border-bottom:1px solid">
						사용자
					</th>
					<th style="border-bottom:1px solid">
						아이디
					</th>
					<th style="border-bottom:1px solid">
						전화번호
					</th>
					<th style="border-bottom:1px solid">
						최근 로그인
					</th>
				</tr>
				</thead>
					<c:if test="${!empty ip }">
						<c:forEach items="${ip }" var="ip">
							<tr>
								<td>
									${ip.ipAddress }
								</td>
								<td>
									${ip.dName }
								</td>
								<td>
									${fn:substring(ip.dId,0,5) }**
								</td>
								<td>
									${fn:substring(ip.tel,0,9) }XXXX
								</td>
								<td>
									${ip.inDate }
								</td>
							</tr>
						</c:forEach>
					</c:if>

			</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
	<!-- Mainly scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- FooTable -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/footable/footable.all.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

	<!-- Page-Level Scripts -->
	<script>
		$(document).ready(function() {

			$('.footable').footable();
			$('.footable2').footable();

		});
	</script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("span").attr("class", "");
		$("tr").attr("class", "");
	})
	</script>
</body>
</html>