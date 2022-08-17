<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 등록</title>

<style>
.title{
	width: 76px;
	margin-left: 20px;
	margin-top: 10px;
	text-align: center;

}
h3{
display: inline-block;
}
#content{
	border: 1px solid black;
    height: 100px;
    width: 470px;
    display: inline-block;
    float: right;
    margin-top:16px;
}
.subname{
    margin-left: 100px;
    border: 1px solid black;
    width: 200px;
    display: inline-block;
}
table{
margin-left: 50px;
margin-top:30px;
    width: 500px;
}
th{
	text-align: center;
	border-bottom: 1px solid;
	font-size: 1.2em;
	font-weight: bold;
	padding-bottom: 25px;
}
tr{
}
.checkclass{
	width:65px;


}
.checkname{
    padding-left: 10px;
}
.fa-check-circle::before{
	color: blue;
	font-size: 1.5em;
}
.fa-circle::before{
	font-size: 1.5em;
}
.subdate{
	width:130px;
}
.form-group{
	display: inline-block;
}
</style>

</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
				<div class="card card-outline card-info">
					<div class="card-header row" style="margin-right: 0px; margin-left: 0px;" >
						<h4 class="col-md-8">예약 상세보기</h4>
<div class="card-tools" style="margin-left: 13%;">
							&nbsp;&nbsp;&nbsp;&nbsp;

						</div>
					</div>
					<!--end card-header  -->
					<div class="card-body pad" style="padding-left:0px;">


								<div class="form-group">
							<div class="col-md-6" style="display: contents;">
									<label class="title">예약일</label>
										<h3 id="title">
									<i class="fa fa-calendar"></i>${reserveDetail.taDate}
									</h3>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label class="title">의료행위</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<div class="input-group-prepend"
										style="display: inline;">
										<h3>${reserveDetail.taName}</h3>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label class="title">담당자</label>
										<h3>${reserveDetail.dName}</h3>
								</div>
								<div class="col-md-6" style="display: contents;">

								</div>
							</div>

							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label class="title"><i class="fa fa-pencil-square-o"></i>내용</label>
								</div>
								<div class="col-md-6" style="display: contents;">

									<div  id="content">

										${reserveDetail.taContent}</div>

								</div>
							</div>
							<div class="form-group">
								<div class="col-md-6" >
								<table>
									<thead>
									<tr>
									<th colspan="5">검사 내역</th>
									</tr>
									</thead>
									<tbody>

								<c:forEach items="${selectSub}" var="i">

									<tr>
										<td class="checkclass"> 검사 종류 :</td>
										<td class="checkname">${i.subName}</h3></td>
										<td><i class="fa fa-calendar"></i></td>
										<td class="subdate">
<%--<fmt:formatDate value="	${i.subDate}" pattern="yyyy-MM-dd"/> --%>
										${i.subDate}
										</td>

									<c:if test="${i.completeYn eq 'Y' }">
										<td ><i class="fa fa-check-circle"></i>완료</td>
									</c:if>


										<c:if test="${i.completeYn eq 'N' }">
										<td ><i class="fa fa-circle"></i>미완료</td>
										</c:if>

									</tr>
									</c:forEach>
									</tbody>
								</table>




					</div>
					<div class="card-footer" style="display: none"></div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</section>
	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});

		  $(function(){
		    $('.datepicker').datepicker();
		  })


	</script>

</body>
</html>