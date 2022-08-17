<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.datetimepicker.css" />
<link href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

<!-- Sweet Alert -->
<link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
<style>
#registInfo{
	width :550px;
    display: inline-block;
     padding-right : 0px;
      float: left;
}
#coDocInfo{
	display: inline-block;
	max-height: 582px;
    float: right;
    width: 35%;
    padding-left : 0px;
    overflow : auto;
}
.form-group{
    margin-right: 14px;
}
</style>

</head>
<body >
	<section style="padding: 0px;">
		<div >
			<div  style="padding: 3px">
				<div class="card card-outline card-info" style="width:850px">
				<div class="card-header row" style="margin-right: 0px; margin-left: 0px;">
			<h3 class="col-md-8" style="width: 72%; text-align:center;">예약 요청</h3>
						<div class="card-tools" style="float: right;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-success" onclick="regist()">
								예약 요청
							</button>
							<button class="btn btn-warning"type="button"  onclick="window.close();">
								닫기
							</button>
						</div>
					</div>
					<!--end card-header  -->
					<div id="divForm">
					<div class="card-body" id ="registInfo"style="min-height: 582px; height: auto;">
				<h4 class="col-md-8" style="width: 72%;">예약 내용</h4>

						<form role="form" method="post" action="<%=request.getContextPath() %>/cooperation/reserveRegist.do" name="registForm">
									<div style="display: none;" id="coInfoDiv">

									</div>
							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label for="date"></label> <input class="datetimepicker form-control"  value="${date }"type="text" placeholder="YYYY - mm - dd" id="title" name="taDate"
										style="display: inline; width: 30%; margin-left: 28px;">
								</div>
							</div>
							<div class="form-group" style="display: inline-block; width: 44%;">
								<div class="col-md-6" style="display: contents;">
									<label for="title" style="margin-left: 4px;">협진명</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<div class="input-group-prepend" style="display: inline; margin-left: 2%;">
										<input type="text" disabled="disabled" readonly="readonly" value="${comedvo.pName }(${fn:substring(comedvo.coDisease,0,8) })"
										 id="searhlist" class="form-control" style="height: 33px; width: 69%; text-align: center; font-size: 1em; display: inline-block; margin-left: 17px;" name="searhlist">
										<input type="hidden" value="${comedvo.coNo },${comedvo.coDoc}" id="values">
									</div>
								</div>
							</div>
							<div class="form-group" style="display: inline-block; width: 50%;">
								<div class="col-md-6" style="display: contents;">
									<label for="title" style="margin-left: -3px;">의료행위</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<div class="input-group-prepend" style="display: inline; margin-left: 2%;">
										<select class="form-control" style="height: 33px; width: 151px; text-align: center; font-size: 1em; display: inline-block; margin-left: 14px;" name="taName">
											<option disabled="" selected="">선택</option>
											<option value="외래진료">외래 진료</option>
											<option value="입원치료">입원 치료</option>
											<option value="수술">수술</option>
										</select>
									</div>
								</div>
							</div>




							<div class="form-group">
								<div class="col-md-6">
									<label for="title" style="">내용</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<textarea id="title" name="taContent" class="form-control" placeholder="내용을 입력하세요" style="width: 84%; display: inline; margin-left: 70px; height: 100px; margin-top: -26px;"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-6" style="display: contents; width: 9%;">
									<label style="margin-left: -3px; display: inline-block;" for="title">하위업무</label>
								</div>
								<input type="text" placeholder="하위업무 등록 +" id="worktitle" name="title" class="form-control" style="display: inline; width: 40%; margin-left: 7px; margin-left: 18px;""> <i class="fa fa-calendar" style="margin-left: 2.5%;"></i> <input
									class="datetimepicker form-control" type="text" placeholder="YYYY - mm - dd" id="workdate" name="title" style="display: inline; width: 30%; margin-left: 18px;"> <a id="append_a" onclick="apendtr()"
									style="display: inline; margin-left: 11px; font-size: 23px; vertical-align: -4px;"><i class="fa fa-plus"></i></a>
								<table id="worklist" class="table" style="width: 79%; margin: 0 auto; border-bottom: 1px solid #e7eaec; text-align: center; margin-top: 20px;">
									<tbody>
									</tbody>
								</table>
							</div>
	<div id="hiddendiv" style="display: none"></div>
						</form>


					</div>
					<div class="card-body" id="coDocInfo" >
					<h4 class="col-md-12" >예약 조회</h4>

	<div id="vertical-timeline" class="vertical-container dark-timeline" >

					</div>
					<div id="checkScheduler"></div>
					</div>
					</div>
					<!--end body -->

					<div class="card-footer" style="display: none"></div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</section>
	<!-- datepicker 날짜만 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- datetimepicker 날짜시간-->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.datetimepicker.full.min.js"></script>
	    <!-- Sweet alert -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>

<script type="text/x-handlebars-template" id="coScheduler">
{{#each.}}
					<div class="vertical-timeline-block" style="">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-user-md"></i>
						</div>

						<div class="vertical-timeline-content">

								<h5 style="margin-bottom: -5px;font-weight: bold; text-align:center">
										{{starttime}}
								</h5>

							<h2	style="margin: 5px; font-size: 15px; text-align: center;">{{dName}}</h2>
<p style="margin: 0px; text-align: center">({{maName}})</p>

							<div class="col-sm-6" style="display: inline; padding-left: 0px;">
														<p style="margin-bottom: 5px"><label style="font-weight: bold; width: 40px"> 구 분 :</label> {{taName}}</p>
								<p style="margin: 0px"><label style="font-weight: bold; width: 40px"> 내  용 :</label>{{taContent}}</p>
							</div>

						</div>

					</div>
    {{/each}}
</script>



	<script>

function regist(){
	makeSubname();
	var coDoc = $('input[name=coDoc]').val();
	var dId = '${doctorLogin.dId}';
	console.log(coDoc);
	console.log(dId);
	if(coDoc == dId){
		  $('form[role=form]').submit();
	}else{
		request ();
	}


}
	 function request () {

	var taDate =  $('input[name=taDate]').val();  //값이 ""일 수 있음!
	var taDate = taDate.replaceAll('/','-');
	console.log("달력 선택한값 ==>"+taDate);

	var taName = $(".form-control[name=taName] option:selected").val();
	console.log("option==>"+taName);
	var taContent = $('textarea[name=taContent]').val();
	console.log("설명==>"+taContent);

	var wt = $('#worktitle').val(); //하위업무 제목
	var subDate = $('#workdate').val(); //하위업무 날짜

   if(taDate==""){
	   alert("날짜를 선택해주세요!");
	   return;
   }
   if(taName=="선택"){
	   alert("의료행위를 선택해주세요");
	   return;
   }

         swal({
                     title: "",
                     text: "예약을 하기위해서는 주치의의 승인이 필요합니다. 주치의에게 승인요청하시겠습니까?",
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

                         $('form[role=form]').submit();
                     } else {
                         swal("취소", "", "error");
                     }
                 });
	 }

		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});


		 if($('#worklist >tbody tr').length == 0 ){
			 $('#worklist').append("<tr id='deftr'><td>항목을 추가하세요.</td></tr>")

		 }

		  $('.datetimepicker').datetimepicker();


		  //항목추가하기를 눌렀을 때!
		  function apendtr() {
				var wt = $('#worktitle').val();
				var date = $('#workdate').val();
				var date = date.replaceAll('/','-');

				var deftr = document.getElementById("deftr");

				console.log("wt==>"+wt);
				console.log("date==>"+date);
				console.log("deftr==>"+deftr);

				if(wt ==""){
				alert("하위업무를 입력해주세요!");
					return;
				}
				if(date == ""){
				alert("날짜와 시간을 선택해주세요!");
				return;
				}
				if(wt ==null && date==null){
					alert("업무와 날짜를 선택해주세요");
					return;
				}

				if(deftr!=null && deftr){
		  			deftr.remove();
		  		}

				$('#worklist').append(
								"<tr id='append_tr'><td id='wt'>"
										+ wt
										+ "</td><td id='date'>"
										+ date
										+ "</td><td onclick='removetr(this)'><a><i style='font-size: 22px;' class='fa fa-minus'></i></a></td></tr>"
									)

									//form에 hidden으로 input tag 심어주기

									//전에 입력한 값초기화 하기
										$('#worktitle').val("");
										$('#workdate').val("");
			}

		  function makeSubname(){

				arr = $('#worklist').find('tr');
				console.log(arr)
				$.each(arr, function (index, el) {
					var subname= $(el).find('#wt').text();
	 				var subdate= $(el).find('#date').text();

				$('#hiddendiv').append("<input type='hidden' name='subName' value='"+subname+"'>"  +  "<input type='hidden' name='subDate' value='"+subdate+"'>")
					});

			}
			function removetr(aa) {
				$(aa).parents("tr").remove();
				if($('#worklist >tbody tr').length == 0 ){
	 				 $('#worklist').append("<tr id='deftr'><td>항목을 추가하세요.</td></tr>")

	 			 }
			}
			$(document).ready(function(){
				console.log()
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
						,url : "<%=request.getContextPath()%>/scheduler/CoScheduler"
						,success: function(data){



							if(data.length == 0){
								$('#vertical-timeline').html("");
								$('#checkScheduler').html("<h4>조회된 예약이 없습니다.</h4>");
							}else{
								var template = Handlebars.compile($('#coScheduler').html());
								var html = template(data);
								$('#checkScheduler').html("");
								$('#vertical-timeline').html(html);
							}
						}
					})

		})
	</script>

</body>
</html>
