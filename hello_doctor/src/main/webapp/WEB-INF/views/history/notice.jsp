<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
</head>
<h2>공지사항</h2>
<hr style="background-color:black; ">

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
			</div>
			<div class="col-sm-6" style="text-align: right;">
				<select id="status" class="form-control" style="width: 105px; height: 100%; margin: 0; display: inline-block; " name="dis_class">
                                <option value="최신순" selected="">최신순</option>
                                <option value="등록일순">등록일순</option>
                 </select>
			<input type="text" style="height: 100%;">
			<button class="btn btn-primary" style="height: 100%; margin-bottom: 2px;">검색</button>
			</div>
		</div>
		<br>
		<table class="table table-bordered" style="text-align: center; font-size: 1.0em; width: 100%">
			<thead>
				<tr>
					<th style="width: 8%;">공지번호</th>
					<th style="width: 50%;">공지제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 20%">공지일시</th>
				</tr>
			</thead>
			<tbody>

					<c:forEach items="${NotcieBoard}" var="NotcieBoard">

						<tr onclick="notice_read('${NotcieBoard.nNo}',this)">
						<td>
						${NotcieBoard.nNo}
						</td>
						<td>
						<c:if test="${NotcieBoard.noticeYn eq '1'}">
								<img alt="프로필" src="<%=request.getContextPath()%>/resources/img/red.png" style="width: 8px; height: 8px;">
						</c:if>
						${NotcieBoard.nTitle}
						</td>
						<td>
						<c:if test="${NotcieBoard.adminId eq 'admin'}">
							관리자
						</c:if>
						</td>
						<td>
						${NotcieBoard.nDate}
						</td>
						</tr>
					</c:forEach>

			</tbody>
		</table>
		<div>
			<ul class="pagination " style="justify-content: center;">
				<li class="footable-page-arrow"><a data-page="first"
					href="#first">«</a></li>
				<li class="footable-page-arrow"><a data-page="prev"
					href="#prev">‹</a></li>
				<li class="footable-page"><a data-page="0" href="#">1</a></li>
				<li class="footable-page"><a data-page="1" href="#">2</a></li>
				<li class="footable-page"><a data-page="2" href="#">3</a></li>
				<li class="footable-page active"><a data-page="3" href="#">4</a></li>
				<li class="footable-page"><a data-page="4" href="#">5</a></li>
				<li class="footable-page-arrow"><a data-page="next"
					href="#next">›</a></li>
				<li class="footable-page-arrow"><a data-page="last"
					href="#last">»</a></li>
			</ul>

		</div>
	</div>
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script>
	function notice_read(nNo,img){
		console.log(nNo);
		var dId = '${doctorLogin.dId}'
		console.log(dId);

		var data = {
				"dId":dId,
				"nNo":nNo,
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/notice/noticeRead",
					type : 'post',
					data : JSON.stringify(data),
					contentType : 'application/json',
					success : function(data) {

							$(img).find("img").remove();
							window.open('notice_detail.do?nNo='+nNo,'','width=600, height=550');

					},
					error : function(error) {
						alert('실패했습니다.');
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});

			}


	</script>

</body>

</html>