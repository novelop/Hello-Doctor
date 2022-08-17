<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="list" value="${dataMap.list }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker }"></c:set>
<c:set var="cri" value="${dataMap.pageMaker.cri }"></c:set>
<style>
table > tbody > tr > td{
	border: 1px solid #e7eaec;
    line-height: 1.42857;
    padding: 8px;
    vertical-align: top;
}

</style>
<!-- FooTable -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/footable/footable.core.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<%@ include file="header.jsp" %>

	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<h1 style="color:black; font-weight:bold;">의료진 관리</h1>
			</div>

			<div class="row" style="margin-right: 20px; max-height: 30px; margin-top: 2%; margin-left: 50%">
				<select id="status" name="userChoice">
					<option value="a" ${cri.userChoice eq 'a' ? 'selected' : '' }>전체</option>
					<option value="n" ${cri.userChoice eq 'n' ? 'selected' : '' }>이름</option>
					<option value="m" ${cri.userChoice eq 'm' ? 'selected' : '' }>전공</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${param.keyword }">
				<div class="input-group-append">
					<button class="btn btn-primary btn-sm" type="button" onclick="list_go(1)">검색</button>
				</div>
			</div>
		</div>
		<br>
		<div class="" style="margin-bottom:10px; height: 407px;">
		<table class="footable table table-stripped" data-page-size="8" data-filter=#filter
			style="text-align: center; width: 100%; font-size: 13px">
			<thead>
				<tr style="border-top: 2px solid; background-color: #F5F5F6">
					<th style="border-bottom:1px solid">이름</th>
					<th style="border-bottom:1px solid">전화번호</th>
					<th style="border-bottom:1px solid">전공</th>
					<th style="border-bottom:1px solid">상태</th>
					<th style="width: 6%; border-bottom:1px solid ">상태변경</th>
					<th style="border-bottom:1px solid">IP</th>
					<th style="border-bottom:1px solid">최근 로그인</th>
				</tr>
			</thead>
			<tbody >
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="list" varStatus="count">
						<tr>
							<td style="width: 6%;">${list.dName }</td>
							<td style="width: 13%">
								<c:set var="tel" value="${list.tel }"/>
								${fn:substring(tel,0,9) }XXXX
							</td>
							<td style="width: 30%">${list.maName }</td>
						<c:if test="${list.accountStatus == '1'}">
							<td style="width: 6%">
								<span style="color: blue; font-weight: bold">재직</span>
							</td>
						</c:if>
						<c:if test="${list.accountStatus == '2'}">
							<td style="width: 6%">
							<span style="color: orange; font-weight: bold">정직</span>
							</td>
						</c:if>
						<c:if test="${list.accountStatus == '3'}">
							<td style="width: 6%">
							<span style="color: red; font-weight: bold">퇴직</span>
							</td>
						</c:if>
							<td style="width: 10%;">
							<button class="btn btn-success btn-xs" onclick="OpenWindow('./change.do?dId=${list.dId}','의료진 관리', 400,345)">
							상태변경
							</button>
							</td>
							<td style="width: 6%">
								<button class="btn btn-warning btn-xs" onclick="OpenWindow('./ip_manager?dId=${list.dId}','IP추가/변경', 350,500)">등록</button>
<!-- 								<span onclick="">ip추가/변경</span> -->
							</td>
							<td style="width: 13%">
								${list.inDate }
							</td>
						</tr>
					</c:forEach>
				</c:if>


			</tbody>
		</table>
		</div>

		<div>


		</div>

	</div>

	<%@ include file="/WEB-INF/views/common/pagination.jsp" %>

	<!-- Mainly scripts -->
<%-- 	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script> --%>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/hs.js"></script>
	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
	<!-- FooTable -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/footable/footable.all.min.js"></script>

	<script>
	function list_go(page,url,dId){
		   if(!url) url="doctor";
		   var jobForm=$('#jobForm');
		   jobForm.find("[name='page']").val(page);
		   var userChoice = jobForm.find("[name='userChoice']")
		   .val($('select[name="userChoice"]').val());
		   var keyword = jobForm.find("[name='keyword']")
			.val($('input[name="keyword"]').val());
		   location.href = url+"?page="+page+"&perPageNum=9&userChoice="+userChoice.val()+"&keyword="+keyword.val();
		}
	</script>
	<!-- Page-Level Scripts -->
	<script>
		$(document).ready(function() {

			$('.footable').footable();
			$('.footable2').footable();

		});
	</script>
	<script>
	$(document).ready(function(){
		$("span").attr("class", "");
		$("th").attr("class","");
		$("tr").attr("class", "");
	});
	</script>
</body>
</html>