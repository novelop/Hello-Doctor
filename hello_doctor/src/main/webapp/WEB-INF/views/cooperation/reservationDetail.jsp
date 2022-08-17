<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 보기</title>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">



<link
	href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

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
.titlelabel{
	font-size: 16px;
	font-weight: bold;
}
.filebox{
	display: inline-block;
	float: right;
}
</style>

</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
				<div class="card card-outline card-info">
					<div class="card-header" style="margin-right: 5px; margin-left: 0px;" >
						<span class="titlelabel">예약 상세보기</span>
						<div class="filebox dropleft" style="float: right">
	<c:if test="${dName eq  doctorLogin.dName }">
						<button type="button"  class="btn btn-success"onclick="modify_go('${param.taNo}')">수정</button>
						<button type="button"  class="btn btn-danger"onclick="delete_go('${param.taNo}')">삭제</button>
	</c:if>
						<button type="button" class="btn btn-warning" onclick="window.close()">닫기</button>
				</div>
					</div>
					<!--end card-header  -->
					<div class="card-body pad">


								<div class="form-group">
							<div class="col-md-6" style="display: contents;">
									<label class="title">예약일</label>
										<h3 id="title">
									<i class="fa fa-calendar"></i>	<fmt:formatDate value="${coTask.taDate}" pattern="yyyy-MM-dd"/>
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
										<h3>${coTask.taName}</h3>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label class="title">담당자</label>
										<h3>${dName}</h3>
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

										${coTask.taContent }</div>

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

								<c:forEach items="${subCoTask}" var="i">

<!-- 									<tr> -->
<!-- 										<td class="checkclass"> 검사 종류 :</td> -->
<%-- 										<td class="checkname">${i.subName}</h3></td> --%>
<!-- 										<td><i class="fa fa-calendar"></i></td> -->
<%-- 										<c:if test="${}"> --%>
<%-- 										<td class="subdate"><fmt:formatDate value="${i.subDate}" pattern="yyyy-MM-dd"/></td> --%>
<!-- 										<td ><i class="fa fa-check-circle"></i>완료</td> -->
<%-- 										</c:if> --%>
<%-- 										<c:if test="${empty i.endDay}"> --%>
<!-- 										<td  class="subdate"></td> -->
<!-- 										<td ><i class="fa fa-circle"></i>미완료</td> -->
<%-- 										</c:if> --%>
<!-- 									</tr> -->

<tr>
										<td class="checkclass"> 검사 종류 :</td>
										<td class="checkname">${i.subName}</h3></td>
										<td><i class="fa fa-calendar"></i></td>
										<td class="subdate"><fmt:formatDate value="${i.subDate}" pattern="yyyy-MM-dd HH:mm"/></td>

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
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>



	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>

	<!-- Peity -->
	<script
		src="<%=request.getContextPath()%>/resources/js/demo/peity-demo.js"></script>


	<!-- BS custom file -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/bs-custom-file/bs-custom-file-input.min.js"></script>

	<!-- Sweet alert -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>



	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

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
		function modify_go(taNo){
			  OpenWindow("<%=request.getContextPath()%>/cooperation/reservationModify.do?taNo="+taNo,"예약 수정",850,700)
  			   window.close();

		  }
		function delete_go(taNo){
			var coDoc = '${coTask.coDoc}';
			var dId = '${doctorLogin.dId}';
			console.log(coDoc);
			console.log(dId);
			if(coDoc == dId){
				location.href ="<%=request.getContextPath()%>/cooperation/reservationDelete.do?taNo="+taNo+"&coDoc=coDoc";
			}else{
			  swal({
                  title: "",
                  text: "예약 삭제 하기위해서는 주치의의 승인이 필요합니다. 주치의에게 승인요청하시겠습니까?",
                  type: "warning",
                  showCancelButton: true,
                  confirmButtonColor: "#DD6B55",
                  confirmButtonText: "승인요청완료",
                  cancelButtonText: "승인요청취소",
                  closeOnConfirm: false,
                  closeOnCancel: false },
              function (isConfirm) {
                  if (isConfirm) {
                      swal("승인요청완료!", "", "success");
               		//3초뒤 자동으로 닫히기
                      setTimeout(function() {
                     	  window.close();
                     	}, 3000);
				location.href ="<%=request.getContextPath()%>/cooperation/reservationDelete.do?taNo="+taNo;

                  } else {
                      swal("취소", "", "error");
                  }
              });
	 }
		}



		$(document).ready(function(){
		if('${param.from}' == 'delete'){
		    swal({
		        title: "예약 삭제 성공",
		        type: "success",
		    },function(){

		    	window.opener.location.reload();
		    	window.close();
		    }
		    );
		}

		})

	</script>

</body>
</html>