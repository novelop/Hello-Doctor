<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="medicineList" value="${dataMap.medicineList }"></c:set>
<c:set var="pageMaker" value="${dataMap.pageMaker }"></c:set>
<c:set var="cri" value="${dataMap.pageMaker.cri }"></c:set>
<c:set var="drug" value="${dList.medicineList}"></c:set>
<c:set var="dpageMaker" value="${dList.pageMaker }"></c:set>
<c:set var="dcri" value="${dList.pageMaker.cri }"></c:set>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<%@ include file="header.jsp"%>
<style>
*{
	font-size : 12px;
}
</style>

<div class="container">
	<div class="row">

		<div class="col-md-2">
			<h1 style="color: black; font-weight: bold;">약품 관리</h1>
		</div>
		<div class="col-md-10" style="max-height: 30px; margin-top: 2%;">
			<div class="input-group-append" style="float: right">
				<select name="searchType">
					<option value="m" ${param.searchType eq 'm' ? 'selected' : ''}>약품명</option>
					<option value="c" ${param.searchType eq 'c' ? 'selected' : ''}>약품일련번호</option>
				</select> <input type="text" placeholder="검색어를 입력하세요" name="keyword">
				<button class="btn btn-primary btn-sm" type="button"
					onclick="list_go(1);" style="display: inline-flex;">검색</button>
			</div>
		</div>
	</div>
	<div class="tabs-container">
		<ul class="nav nav-tabs" role="tablist">
			<li><a class="nav-link active" data-toggle="tab" href="#tab-1">약품관리</a></li>
			<li><a class="nav-link" data-toggle="tab" href="#tab-2" id="upD">업데이트
					약품</a></li>
			<li style="margin-left: 598px">
				<span style="margin-top: 4px; margin-right: 16px;"><i class="fa fa-refresh"></i>&nbsp;${date}에 업데이트 했습니다.</span>
				<button class="btn btn-success update_btn" style="max-height: 30px;" onclick="updateGo()">약품정보
					업데이트</button>
		
			</li>
		</ul>
	</div>
	<div class="tab-content">
		<div role="tabpanel" id="tab-1" class="tab-pane active">
			<div class="panel-body"
				style="height: 500px; overflow: hidden; padding: 0px">
				<table class="table table-bordered"
					style="text-align: center; text-align: center; width: 100%;">
					<thead>
						<tr style="border-top: 2px solid;">
							<th style="width: 25%; border-bottom: 1px solid;">약품명</th>
							<th style="border-bottom: 1px solid;">약품일련번호</th>
							<th style="border-bottom: 1px solid;">약품 회사</th>
							<th style="border-bottom: 1px solid;">급여여부</th>
							<th style="border-bottom: 1px solid;">등록일</th>
							<th style="border-bottom: 1px solid;">등록여부</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${medicineList}" var="i">
							<tr>
								<td style="text-align: left; width: 45%">${fn:substring(i.meName,0,18) }
									<input type="hidden" class="meName" value="${ i.meName}">
								</td>
								<td style="width: 9%">${i.meNo }</td>
								<td style="text-align: left">${fn:substring(i.meCompany ,0,10) }</td>
								<td style="width: 7%"><c:if test="${empty i.meInserance }">
							급여
						</c:if></td>
								<td style="width: 8%"><fmt:parseDate
										value="${i.mePermitdate}" var="dateValue" pattern="yyyyMMdd" />
									<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" /></td>
								<td style="width: 7%">
									<div class="form-check abc-checkbox abc-checkbox-success"
										style="padding-left: 0;">
										<c:if test="${i.existYn eq 'Y'}">
											<div class="icheckbox_square-green checked"
												style="position: relative;">
												<input type="checkbox" value="${i.meNo }" checked=""
													style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper" value="${i.meNo }"
													onclick="change(this)"
													style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
											</div>
										</c:if>
										<c:if test="${i.existYn ne 'Y'}">
											<div class="icheckbox_square-green"
												style="position: relative;">
												<input type="checkbox" value="${i.meNo }" checked=""
													style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper" onclick="change(this)"
													style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
											</div>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
		</div>
		<div role="tabpanel" id="tab-2" class="tab-pane"
			style="text-align: center; max-height: 100%">
			<div class="panel-body"
				style="height: 500px; overflow: hidden; padding: 0px">
				<table class="table table-bordered" data-page-size="10"
					data-filter=#filter>
					<thead>
						<tr style="background-color: #F5F5F6; border-top: 2px solid">
							<th style="border-bottom: 1px solid black;">약품명</th>
							<th style="border-bottom: 1px solid black;">약품일련번호</th>
							<th style="border-bottom: 1px solid black;">약품 회사</th>
							<th style="border-bottom: 1px solid black;">급여여부</th>
							<th style="border-bottom: 1px solid black;">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty drug }">
							<c:forEach items="${drug }" var="d">
								<tr>
									<td style="width: 53%; text-align: left;">${d.meName }</td>
									<td style="width: 10%">${d.meCode }</td>
									<td style="width: 20%; text-align: left;">${d.meCompany }</td>
									<td style="width: 7%"><c:if test="${empty d.meInserance }">
										급여
									</c:if></td>
									<td style="width: 10%"><fmt:parseDate
											value="${d.mePermitdate }" pattern="yyyyMMdd" var="per" /> <fmt:formatDate
											value="${per }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
					<%@ include file="/WEB-INF/views/common/paginationUd.jsp"%>
			</div>
		</div>
	</div>
	
	<br>

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


<script
	src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<script></script>
<%-- <c:if test="${from eq 'sucess' }"> --%>
<!-- 	<script> -->
<!-- 	</script> -->
<%-- </c:if> --%>
<script>
	// 	function updateGo(){
	// 		swal({
	// 			title : "약품을 업데이트 하시겠습니까?",
	// 			text : "업데이트하는데 오랜 시간이 소요 될 수 있습니다.",
	// 			type : "warning",
	// 			showCancelButton : true,
	// 			confirmButtonColor : "#DD6855",
	// 			confirmButtonText : "확인",
	// 			closeOnConfirm : false
	// 		},  function (isConfirm) {
	// 	        if (isConfirm) {
	// 	        	location.href='update_medi'
	// 	        	swal({
	// 	    			title : "",
	// 	    			text : "업데이트 중입니다.",
	// 	    			type : "warning",
	// 	    			confirmButtonColor : "#DD6855",
	// 	    			confirmButtonText : "업데이트 취소",
	// 	    			closeOnConfirm : false
	// 	    		},function (isConfirm) {
	// 		    	        if (isConfirm) {
	// 		    	        	location.reload();
	// 		    	        }
	// 		    	        });
	// 	    	        }else{

	// 			}

	//         });
	// 	}

	function deletemedi(no) {
		swal({
			title : "약품을 삭제하시겠습니까?",
			text : "",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6855",
			confirmButtonText : "확인",
			closeOnConfirm : false
		}, function() {
			swal("", "약품이 정상적으로 삭제되었습니다.", "success");
			setTimeout(function() {

			}, 1000);
		});
	}
</script>
<script>
	function change(a) {
		var b = $(a).parent(); //
		var no = $(a).prev().val();
		var dno = {
			"meNo" : no
		}
		if (b.attr("class") == "icheckbox_square-green") {
			swal({
				title : "약품을 추가하시겠습니까?",
				text : "",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6855",
				confirmButtonText : "확인",
				closeOnConfirm : false
			}, function() {
				$.ajax({
					url : "insertDrug",
					type : "POST",
					data : JSON.stringify(dno),
					contentType : "application/json",
					success : function() {
						swal({
							title : "약품이 추가되었습니다",
							text : "",
							type : "success"
						});
						b.attr("class", "icheckbox_square-green checked");
					}
				});
			});
		} else if (b.attr("class") == "icheckbox_square-green checked") {
			swal({
				title : "약품을 삭제하시겠습니까?",
				text : "",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6855",
				confirmButtonText : "확인",
				closeOnConfirm : false
			}, function() {
				$.ajax({
					url : "deleteDrug",
					type : 'post',
					data : JSON.stringify(dno),
					contentType : "application/json",
					success : function() {
						swal({
							title : "약품을 정상적으로 삭제했습니다.",
							text : "",
							type : "success"
						});
						b.attr("class", "icheckbox_square-green");
					}
				});
			});

		}

	}
</script>

<script>
	function list_go(page, url, dId) {
		if (!url)
			url = "med_admin";

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
		location.href = url + "?page=" + page + "&perPageNum=9&searchType="
				+ searchType.val() + "&keyword=" + keyword.val()
				+ "&userFilter=" + userFilter.val() + "&userChoice="
				+ userChoice.val();
	}
function list_go2(page, url){
	if(!url)
		url = "med_admin";
	location.href = url + "?page=" + page + "&perPageNum=9";
}
$("#upD").on("click", function(){
// 	window.location.href = "med_admin";
// 	$(".nav-link").attr("class", "nav-link active")
})
</script>
</body>
</html>

