<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="drug" value="${dList}"></c:set>
<!-- FooTable -->
<style>
*{
	font-size : 12px;
}
table > tbody > tr > td{
	border: 1px solid #e7eaec;
    line-height: 1.42857;
    padding: 8px;
    vertical-align: top;
}
</style>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<%@ include file="header.jsp"%>
<br>

<div class="container">

	<div class="row">
		<div class="col-md-3">
		<h1 style="color: black; font-weight: bold; margin-top: 0px;">업데이트
			약품</h1>
		</div>
	<div class="col-md-9" style=" max-height: 30px; text-align: end; ">
				<span style="margin-top: 4px; margin-right: 16px;"><i class="fa fa-refresh"></i>&nbsp;${date}에 업데이트 했습니다.</span>
				<button class="btn btn-success update_btn" style="max-height: 30px;" onclick="updateGo()">약품정보
					업데이트</button>
			</div>
	</div>
	<br>
	<div class="">
		<table class="footable table table-stripped" data-page-size="10"
			data-filter=#filter>
			<thead>
				<tr style="background-color: #F5F5F6">
					<th>약품명</th>
					<th>약품일련번호</th>
					<th>약품 회사</th>
					<th>급여여부</th>
					<th>등록일</th>
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
		<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
	</div>
</div>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<!-- FooTable -->
<script
	src="<%=request.getContextPath()%>/resources/js/plugins/footable/footable.all.min.js"></script>
<!-- Page-Level Scripts -->
<script>
	$(document).ready(function() {

		$('.footable').footable();
		$('.footable2').footable();

	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("span").attr("class", "");
		$("tr").attr("class", "");
	});
</script>

<c:if test="${from eq 'sucess' }">
	<script>
	swal("", "${cnt}개의 약품이 업데이트되었습니다.", "success");
	</script>
</c:if>
	<script>

	function updateGo(){
		swal({
			title : "약품을 업데이트 하시겠습니까?",
			text : "업데이트하는데 오랜 시간이 소요 될 수 있습니다.",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6855",
			confirmButtonText : "확인",
			closeOnConfirm : false
		},  function (isConfirm) {
	        if (isConfirm) {
	        	location.href='update_medi'
	        	swal({
	    			title : "",
	    			text : "업데이트 중입니다.",
	    			type : "warning",
	    			confirmButtonColor : "#DD6855",
	    			confirmButtonText : "업데이트 취소",
	    			closeOnConfirm : false
	    		},function (isConfirm) {
		    	        if (isConfirm) {
		    	        	location.reload();
		    	        }
		    	        });
	    	        }else{

			}


        });
	}
</script>


</body>
</html>