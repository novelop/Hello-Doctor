<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="reserveDetail" value="${reserveDetail}"/>
<c:set var ="selectSub" value="${selectSub}"/>
<c:set var = "tnNo" value="${tnNo}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 등록</title>
<!-- 협진 의료진이 주치의에게 승인을 요청했을 때의 진료 상세창  -->

<style>

h3 {
    font-size: 14px;
}
.navy-bg, .bg-primary {
    background-color: #2a7fbb !important;
    color: #ffffff;
}

.vertical-timeline-block {
    position: relative;
    margin: 0.9em 0;
}

.vertical-timeline-block:first-child {
    margin-top: -20px;
}

element.style {
    display: inline;
    margin-left: 25px;
    margin-bottom: 17px;
    height: 31px;
    width: 151px;
}
.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;

}


/* .title { */
/*     width: 76px; */
/*     margin-left: 10px; */
/*     margin-top: 10px; */
/*     text-align: center; */
/* } */

.title {
 width: 56px;
    margin-left: 10px;
    margin-top: 10px;
    text-align: center;
}

h3{
display: inline-block;
}
#content{
	border: 1px solid black;
    height: 100px;
    width: 460px;
    display: inline-block;
    float: right;
    margin-top:16px;
    padding-top: 3px;
    padding-left: 4px;

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

#coDocInfo {
	display: inline-block;
	max-height: 510px;
	float: right;
	width: 35%;
	padding-left: 0px;
	padding-top: 26px;
	overflow: auto;
	position: relative;
    right: 40px;
}


.vertical-timeline-icon {
    position: absolute;
    top: 0;
    left: 0;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    font-size: 16px;
    border: 3px solid #f1f1f1;
    text-align: center;
}


.pad{

    width: 605px;
    display: inline-block;
    padding-right: 0px;
}
</style>



</head>
 <!-- Sweet Alert -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<body>
	<section style="padding: 0px;" class="content container-fluid">
		<div class="justify-content-center">
			<div class="col-md-13" style="padding: 3px">
				<div class="card card-outline card-info">
					<div class="card-header row" style="margin-right: 0px; margin-left: 0px;" >
						<h4 style="width: 200px;margin-left: 38px;">요청한 예약 상세보기
						</h4>

						<div class="card-tools" style="margin-left: 45%;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-success" id="registBtn"
								onclick="location.href='reserveYes?taNo=${reserveDetail.taNo}';">수 락</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn"
							data-toggle="modal" data-target="#myModal5">거 절</button>
						</div>

					</div>

					<!-- 거절 시 뜨느 모달창 -->
						<div class="modal inmodal fade" id="myModal5" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<h3 class="font-bold" style="padding-left:25px; padding-top: 20px"><i class="fa fa-pencil-square-o"></i>&nbsp;의료행위 반려사유를 기재해주세요</h3>
				<div class="modal-body">
					<div class="ibox-content">
						<div class="form-text_modal">
<!-- 							<h4>본 환자에게 아직 이른 진료입니다. 차후에 차도가 있으면 해당 진료 들어갑시다</h4> -->
									<textarea class="form-control" name="content" id="content" rows="5" placeholder=""></textarea>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<input type = "hidden" value="${tnNo}"/>
					<button onclick="rejectSubmit('${reserveDetail.taNo}','${tnNo}');" type="button" class="btn btn-w-m btn-success">전송</button>
					&nbsp;
					<button type="button" class="btn btn-w-m btn-default" data-dismiss="modal" >취소</button>
				</div>
			</div>
		</div>
	</div>





<div class="cardTotal"
style=    "padding-left: 0px;
    padding-right: 0px;">


					<div class="card-body pad" >


								<div class="form-group">
							<div class="col-md-6" style="display: contents;">
									<label class="title"><strong>예약일:</strong></label>
										<h3 id="title">
									<i class="fa fa-calendar"></i><fmt:formatDate value="${reserveDetail.taDate }" pattern="yyyy-MM-dd HH:mm"/>
									</h3>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label class="title"><strong>의료행위:</strong></label>
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
									<label class="title"><strong>담당자:</strong></label>
										<h3>${reserveDetail.dName}</h3>
								</div>
								<div class="col-md-6" style="display: contents;">

								</div>
							</div>
								<div class="col-md-6" style="display: contents;">
									</div><br>
									<div class="col-md-6" style="display: contents;">
										<div class="input-group-prepend"
											style="display: inline;">
											<label class="title"><strong>환자명:</strong></label><h3>${comedvo.pName }(${comedvo.coDisease})</h3>
									 <input type="hidden"
												value="${comedvo.coNo },${comedvo.coDoc}" id="values">
										</div>
									</div>
							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label class="title"><i class="fa fa-pencil-square-o"></i><strong>내용</strong></label>
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

<c:if test="${empty selectSub }">
<tr>
<td colspan="5" style="text-align: center;margin-top:3px;">검사내역이없습니다</td>
<tr>
</c:if>
								<c:forEach items="${selectSub}" var="i">

									<tr>
										<td class="checkclass"> 검사 종류 :</td>
										<td class="checkname">${i.subName}</h3></td>
										<td><i class="fa fa-calendar"></i></td>
										<td class="subdate">
										<fmt:formatDate value="${i.subDate}" pattern="yyyy-MM-dd HH:mm"/>
										</td>

									</tr>
									</c:forEach>


<%-- 									<c:if test="${empty selectSub }"> --%>
<!-- <tr> -->
<!-- <p style="text-align: center;"><h4>검사내역이 없습니다</h4></p> -->
<!-- </tr> -->


									</tbody>
								</table>




					</div>

					<div class="card-footer" style="display: none">



					</div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
			</div>
				<div class="card-body" id="coDocInfo">
							<h4 class="col-md-12">예약 조회</h4>
							<div id="vertical-timeline"
								class="vertical-container dark-timeline"></div>
							<div id="checkScheduler"></div>
						</div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script
		src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>

	<script type="text/x-handlebars-template" id="coScheduler">
{{#each.}}
					<div class="vertical-timeline-block" style="">
						<div class="vertical-timeline-icon">



<img alt="프로필" class="rounded-circle" src="<%=request.getContextPath()%>/doctor/getPic?dId={{dId}}" style="width: 40px; height: 40px; text-align: left; vertical-align: -3px;">




						</div>

						<div class="vertical-timeline-content" style="height: 130px;">

								<h5 style="margin-bottom: -5px;font-weight: bold; text-align:center">
										{{starttime}}
								</h5>

							<h4
								style="margin: 5px;font-size: 13px;text-align: center;">{{dName}}({{maName}})</h4>


							<div class="col-sm-6" style="display: inline; padding-left: 0px;">
								<p style="margin-bottom: -8px;"><label style="font-weight: bold; width: 40px"> 구 분 :</label> {{taName}}</p>
								<p style="margin: 0px"><label style="font-weight: bold; width: 40px"> 내  용 :</label>{{taContent}}</p>
							</div>

						</div>

					</div>
    {{/each}}






</script>


<!-- Sweet alert -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>


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



function rejectSubmit(taNo,tnNo){
      var tnNoti= $('textarea[name=content]').val();
    //  alert("taNo"+taNo);
    //  alert("tnNo"+tnNo);
    //  alert("tnNoti"+tnNoti);

data = {
		"taNo" :taNo,
		"tnNoti":tnNoti,
		"tnNo":tnNo
		}

 	 $.ajax({
         url :"<%=request.getContextPath()%>/cooperation/rejectSubmit",
			type : "POST",
			data : JSON.stringify(data)// 검색 키워드
			,contentType : 'application/json',
			success : function(res) { // 성공

				alert("거절성공!");
				window.close();
				opener.document.getElementById(taNo).remove();


// 				swal("거절성공!","","success");

// 				  setTimeout(function(){
// 				  		$('#myModal5').modal('hide');
// 				  		window.close();
// 						opener.document.getElementById(taNo).remove();
// 				       },1000);


			},error : function(){
				swal("거절실패!","","error");
			}
		})





      }




	</script>
<script type="text/javascript">

$(document).ready(function(){
	var coNo = $('#values').val().split(',')[0];
	var coDoc = $('#values').val().split(',')[1];
		var text = {"coNo" : coNo}
		str = "<input type='hidden' name ='coNo' value='"+coNo+"'/>";
		 str +="<input type='hidden' name ='coDoc' value='"+coDoc+"'/>";
		$('#coInfoDiv').html(str);
		$.ajax({
			type: 'post'
			,data: JSON.stringify(text)
			,contentType : 'application/json'
			,url : "<%=request.getContextPath()%>/scheduler/CoScheduler",
							success : function(data) {
								if (data.length == 0) {
									$('#vertical-timeline')
											.html("");
									$('#checkScheduler')
											.html(
													"<h4>조회된 예약이 없습니다.</h4>");
								} else {
									var template = Handlebars
											.compile($(
													'#coScheduler')
													.html());
									var html = template(data);
									$('#checkScheduler').html("");
									$('#vertical-timeline').html(
											html);

								}

							}

						})

			})


</script>



</body>
</html>