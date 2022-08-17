<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">

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
 <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<style type="text/css">
.nav-tabs .nav-link{
	border-top-left-radius : 0px;
	border-top-right-radius : 0px;
}
.onoffswitch-inner:after{
	text-align: center;
	padding-right: 0px;
}
.onoffswitch-inner:before{
	text-align: center;
	padding-right: 0px;
}
label{
	font-weight: bold;
}
</style>
<%@ include file="header.jsp" %>
	<section class="" >
		<div class="ibox-content" style="height: 100%; padding: 0%">
			<div class="" style="">
				<div class="card card-outline card-info">
					<div class="card-header">

						<div class ="row">
							<div class="col-sm-8">
								<span style="font-size: 1.5em">	${noticeVO.nTitle }</span>
							</div>
							<div class="col-sm-4" style="text-align: end">
								<button type="button" class="btn btn-warning" id="cancelBtn" onclick="history.go(-1)" >목록</button>
								<button class="btn btn-success" onclick="modifyNotice()">수정</button>
								<button class="btn btn-danger" onclick="deleteNotice()">삭제</button>
							</div>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
<!-- 							<div class="form-group row"> -->
<!-- 								<div class="col-sm-1"> -->
<!-- 									<label for="title">제 목</label> -->
<!-- 								</div> -->
<!-- 								<div class="col-sm-11"> -->
<%-- 									${noticeVO.nTitle } --%>
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="form-gruop">
								<div class="row">
									<div class="col-sm-1">
										<span>공지고정</span>
									</div>
									<div class="col-sm-11">
									<c:if test="${noticeVO.pickYn == 'Y' }">
										<div class="i-checks" style="display: inline;"><label class="">설정
										<div class="icheckbox_square-green" style="position: relative;"><input type="checkbox" disabled="disabled" checked="checked" value="Y" style="position: absolute; opacity: 0;" name="radioTxt"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div></label></div>
									</c:if>
									<c:if test="${noticeVO.pickYn == 'N' }">
										<div class="i-checks" style="display: inline;"><label class="">설정
										<div class="icheckbox_square-green" style="position: relative;"><input type="checkbox" disabled="disabled" value="N" style="position: absolute; opacity: 0;" name="radioTxt"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div></label></div>
									</c:if>
									</div>
								</div>
							</div>
							<div class="form-group popUp">
								<div class="row">
									<div class="col-sm-1">
										<span>팝업노출</span>
									</div>
									<div class="col-sm-11" style="display: inline;">
									<c:if test="${noticeVO.popYn == 'Y' }">
										<fmt:parseDate value="${noticeVO.popPeriodStart }" pattern="yyyy-MM-dd HH:mm:ss" var="sDate"/>
										<fmt:parseDate value="${noticeVO.popPeriodEnd }" pattern="yyyy-MM-dd HH:mm:ss" var="eDate"/>
										<div class="i-checks pop" style="display: inline;"><label class="" style="">설정
										<div class="icheckbox_square-green" id="pop" style="position: relative;"><input type="checkbox" disabled="disabled" value="Y" checked="checked" style="position: absolute; opacity: 0;" name="radioTxt"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div></label></div>
										<div style="display: contents">
											&emsp;<fmt:formatDate value="${sDate }"/> ~ <fmt:formatDate value="${eDate }"/>
										</div>
									</c:if>
									<c:if test="${noticeVO.popYn == 'N' }">
										<div class="i-checks pop" style="display: inline;"><label>설정
										<div class="icheckbox_square-green" id="pop" style="position: relative;"><input type="checkbox" disabled="disabled" value="N" style="position: absolute; opacity: 0;" name="radioTxt"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div></label></div>
									</c:if>
									<div id="d" style="display: contents">

									</div>
									</div>

								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="content"></label>
									${noticeVO.nContent }
							</div>
							<hr>


						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
      <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/hs.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/summernote/summernote-bs4.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

	<script type="text/javascript">
	window.onload = function(){
		summernote_go($('#content'), '<%=request.getContextPath()%>');
	}
	</script>
    <script type="text/javascript">
    $(document).ready(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
    </script>
    <script type="text/javascript">
	function deleteNotice(){
		swal({
			title : "공지사항을 삭제하시겠습니까?",
			text : "삭제시 복구 불가합니다.",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6855",
			confirmButtonText : "확인",
			closeOnConfirm : false
		}, function(){
			swal("", "게시글이 정상적으로 삭제되었습니다.", "success");
			setTimeout(function(){
				location.href = "deleteNotice?nNo=${noticeVO.nNo}"
			}, 1000);
		});

	}
    </script>
    <script type="text/javascript">
	function modifyNotice(){
		location.href = "modifyForm?nNo=${noticeVO.nNo}"
	}
    </script>
</body>
</html>