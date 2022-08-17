<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<title>스케줄러</title>

<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/fullcalendar/fullcalendar.print.css"
	rel='stylesheet' media='print'>

<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/chart.css"
	rel="stylesheet">

<style>
.fc-scroller {
	overflow-y: hidden !important;
}
.width330{
	width: 634px;
}

body.light-skin {
    background-color: white;
    color: #3e5476;
}
</style>

</head>
<body style="background-color: white;">

<div  >
<div class="col-lg-12">
                <div >
                    <div>
					<div style="margin-bottom: 25px;margin-top: 23px;margin-left: 50px;">
						<h2><strong style="font-weight: bold;">MyLog</strong></h2><small style="color:red;">이력 보관기간은 14일입니다</small><hr>
					</div>
                        <c:forEach items="${logList}" var="logList">
								<c:set var="logNum" value="${logList.logNum}"/>
								<c:if test="${fn:substring(logNum,0,1) eq'O'}">
									<div class="timeline-item width330">
									<div class="row" style="margin-bottom: -15px;">
										<div class="col-3 date" style="padding-left: 5px; padding-top: 10px;">
											<i class="fa fa-briefcase"></i> <span style="margin-left: -5px;"></span><br>
											<small class="text-navy">${logList.logDate}<br></small>
										</div>
										<div class="col-7 content no-top-border" style="padding-top:0px;">
											<p class="m-b-xs">
												<strong style="color:darkblue;">오더세트 댓글 등록</strong><br>
												<medium>${logList.disTitle}</medium>
											</p>
											<c:choose>
											<c:when test="${fn:length(logList.disContent) gt 35}">
												<c:out value="${fn:substring(logList.disContent, 0, 29)}..">
		        								</c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${logList.disContent}">
												</c:out>
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
								</c:if>

								<c:if test="${fn:substring(logNum,0,1) eq'D'}">
									<div class="timeline-item width330">
									<div class="row">
										<div class="col-3 date" style="padding-left: 5px; padding-top: 10px;">
											<i class="fa fa-file-text"></i> <span style="margin-left: -5px;"></span><br>
											<small class="text-navy">${logList.logDate}<br></small>
										</div>
										<div class="col-7 content no-top-border" style="padding-top:0px;">
											<p class="m-b-xs">
												<strong>CaseDiscussion 댓글 등록</strong><br>
												<medium>${logList.disTitle}</medium>
											</p>
											<c:choose>
											<c:when test="${fn:length(logList.disContent) gt 35}">
												<c:out value="${fn:substring(logList.disContent, 0, 29)}..">
		        								</c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${logList.disContent}">
												</c:out>
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>
                    </div>
                </div>
            </div>
</div>

	<!-- Mainly scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/fullcalendar/moment.min.js"></script>
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

	<!-- jQuery UI  -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

	<!-- Full Calendar -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>

<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@5.5.0/main.global.min.js'></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

</body>
</html>