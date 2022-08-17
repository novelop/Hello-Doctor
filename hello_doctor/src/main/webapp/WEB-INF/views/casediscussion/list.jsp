<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="caseList" value="${dataMap.caselist }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">


<link
	href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

<script type="text/javascript">
	if ('${from}' == 'regist') {

		var url = "/case/list.do";
		var renewURL = window.parent.location.href;

		renewURL = renewURL.substring(0, renewURL.indexOf(".do") + 3);

		// 현재 주소 중 .do 뒤 부분이 있다면 날려버린다.

		url = url.replace(/&/g, "amp;");

		renewURL += "?page=" + url;

		// 페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용

		window.parent.history.pushState(url, null, renewURL);

		window.parent.location.reload();
	}
</script>

<style>
.col-8 {
	max-width: 100%;
}

.img-responsive {
	width: 20px;
	height: 20px;
	object-fit: cover;
}

#pagediv {
	position: absolute;
	margin: -150px 0px 0px -200px;
	top: 108%;
	left: 57%;
	padding: 3px;
}

.contact-box {
	border-radius: 5%;
}
</style>

</head>
<body>
	<br>
	<div class="row">
		<div class="col-sm-6" style="padding-left: 2%; display: flex;">
			<button type="button" class="btn btn-w-m btn-primary"
				onclick="subgoPage('/case/registForm.do')">의견 공유</button>
			<div class="input-group-prepend filter" style="margin-left: 1%;">
				<select class="form-control" name="userChoice" style="height: 36px;"
					onchange="list_go(1);">
					<option>전체</option>
					<option value="q" ${cri.userChoice eq 'q' ? 'selected' : ''  }>내가
						쓴글</option>
					<option value="t" ${cri.userChoice eq 't' ? 'selected' : ''  }>${doctorLogin.maName }</option>
				</select>

			</div>
			<div class="input-group-prepend filter" style="margin-left: 1%;">
				<select class="form-control" name="userFilter" style="height: 36px"
					onchange="list_go(1);">
					<option value="r" ${cri.userFilter eq 'r' ? 'selected' : ''  }>등록순</option>
					<option value="l" ${cri.userFilter eq 'l' ? 'selected' : ''  }>조회순</option>
					<option value="b" ${cri.userFilter eq 'b' ? 'selected' : ''  }>추천순</option>
				</select>
			</div>
		</div>
		<div class="col-sm-3" style="display: contents;">
			<div class="input-group-prepend search" style="margin-left: 20.4%;">
				<select class="form-control" name="searchType" style="height: 36px">
					<option value="t" ${cri.searchType eq 't' ? 'selected' : ''  }>제
						목</option>
					<option value="d" ${cri.searchType eq 'd' ? 'selected' : ''  }>질병명</option>
					<option value="w" ${cri.searchType eq 'w' ? 'selected' : ''  }>작성자</option>
				</select>
			</div>
		</div>
		<div class="col-sm-3" style="display: contents;">
			<input type="text" name="keyword" class="form-control"
				style="width: 240px;" placeholder="검색어를 입력하세요"
				value="${param.keyword }"> <i
				style="font-size: 1.5em; margin-top: 7px; position: absolute; margin-left: 99%;"
				class="fa fa-search" onclick="list_go(1);"></i>
		</div>
	</div>



	<div>
		<div style="margin-top: 2%;">
			<div class="row">
				<c:if test="${!empty caseList }">
					<c:forEach items="${caseList }" var="clist">
						<div class="col-lg-3">
							<div class="contact-box" style="padding: 12px">
								<div class=""
									onclick="subgoPage('/case/detail.do?from=list&disNo=${clist.disNo}&dId=${doctorLogin.dId }')"
									type="button">
									<h4
										style="text-align: center; font-size:; height: 50px; max-width: 100%; word-break: break-all;">
										<c:set var="title" value="${clist.disTitle }" />

										<strong>${fn:substring(title,0,60) }</strong>
									</h4>
									<p
										style="text-align: center; font-size: 12px; word-break: break-all; height: 35px; overflow: hidden;">
										<strong>${clist.disDName }</strong>
									</p>
									<table style="width: 100%; text-align: center;">
										<tr>
											<td colspan="2">${clist.maName }/${clist.dName }</td>
										</tr>


										<tr>
											<td colspan="2"><i class="fa fa-calendar">&nbsp;${clist.disDate }</i>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<hr style="margin-top: 4px; margin-botton: 4px">
											</td>
										</tr>
										<tr>
											<td><i class="fa fa-eye">${clist.disCnt }&nbsp;&nbsp;&nbsp;</i>

												<i class="fa fa-comments-o"> ${clist.reply }&nbsp;&nbsp;&nbsp;</i>

												<i class="fa fa-thumbs-o-up">${clist.recom }</i></td>
										</tr>
									</table>
								</div>

							</div>
						</div>
					</c:forEach>
				</c:if>


			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/pagination.jsp"%>



	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
	<!-- iCheck -->
	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});
	</script>
	<script type="text/javascript">
		function list_go(page, url, dId) {
			if (!url)
				url = "/case/list.do";
			var jobForm = $('#jobForm');
			jobForm.find("[name='page']").val(page);
			var searchType = jobForm.find("[name='searchType']").val(
					$('select[name="searchType"]').val());
			var keyword = jobForm.find("[name='keyword']").val(
					$('input[name="keyword"]').val());
			var userFilter = jobForm.find("[name='userFilter']").val(
					$('select[name="userFilter"]').val());
			var userChoice = jobForm.find("[name='userChoice']").val(
					$('select[name="userChoice"]').val());
			subgoPage(url + "?page=" + page + "&perPageNum=12&searchType="
					+ searchType.val() + "&keyword=" + keyword.val()
					+ "&userFilter=" + userFilter.val() + "&userChoice="
					+ userChoice.val());
		}
	</script>




</body>
</html>