<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Manager</title>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/manager.css"
	rel="stylesheet">
 <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<style type="text/css">
.top-navigation #page-wrapper{
	padding: 0%;
}
</style>
</head>
<body class="top-navigation pace-done">
	<div class="pace  pace-inactive">
		<div class="pace-progress" data-progress-text="100%"
			data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
			<div class="pace-progress-inner"></div>
		</div>
		<div class="pace-activity"></div>
	</div>

	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg" style="background:white;">
			<div class="row border-bottom white-bg">
				<nav class="navbar navbar-expand-lg navbar-static-top"
					role="navigation">

					<a href="manager" class="navbar-brand">Hello Doctor</a>
					<button class="navbar-toggler collapsed" type="button"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fa fa-reorder"></i>
					</button>

					<div class="navbar-collapse collapse" id="navbar" style="">
						<ul class="nav navbar-nav mr-auto">
							<li><a aria-expanded="false" role="button" href="med_admin">약품관리</a>
							</li>
							
							<li><a aria-expanded="false" role="button" href="notice">공지관리</a></li>
							<li><a aria-expanded="false" role="button" href="doctor">의료진관리</a>
							</li>
							<li><a aria-expanded="false" role="button" href="ip">IP관리</a></li>
<!-- 							<li><a aria-expanded="false" role="button" href="#" onclick="window.open('disstatus.do','',300,300)" > 공개 -->
<!-- 									여부 수정</a></li> -->


						</ul>
						<ul class="nav navbar-top-links navbar-right">
							<li><a href='<%=request.getContextPath()%>/login/logout'> <i class="fa fa-sign-out"></i>
									Log out
							</a></li>
						</ul>
					</div>
				</nav>
			</div>