<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="noticeDetail" value="${noticeDetail}" />
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
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
</head>
<body style="">
	<section class="content container-fluid" style="">
		<div class="row justify-content-center">
			<div class="col-md-9" style="padding-left:0px;padding-right:0px;">
				<div class="card card-outline card-info">
					<div class="card-header" style="background-color:rgb(194 231 223);">

						<div>
						<h4 style="font-weight: bold; color:black;display: inline-block;">${noticeDetail.nTitle}
						<c:if test="${noticeDetail.popYn eq 'Y'}">
						<span class="label label-primary" style="font-size:smaller;">팝업</span>
						</c:if>

						</h4><button style="border: 1px solid green; float:right;display:inline-block; font-size:small;" type="button" class="btn btn-primary" id="cancelBtn" onclick="window.close();" >확인</button>
						<h5 style=" color:black;"><c:if test="${noticeDetail.adminId eq 'admin'}">
									관리자
								</c:if>&emsp;${noticeDetail.nDate}</h5>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad" style="padding-top: 15px;">
						<form role="form" method="post" action="regist.do" name="registForm">


							<div class="form-group" style="height:400px;">
								${noticeDetail.nContent}
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>

 <script>



 </script>
</body>
</html>