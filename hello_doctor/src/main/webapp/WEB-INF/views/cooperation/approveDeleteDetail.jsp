<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 등록</title>
<!-- 협진 의료진이 주치의에게 승인을 요청했을 때의 진료 상세창  -->

<style>

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

</style>

</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
		<div class="justify-content-center">
			<div class="col-md-13" style="padding: 3px">
				<div class="card card-outline card-info">
					<div class="card-header row" style="margin-right: 0px; margin-left: 0px;" >
						<h4 style="width: 200px;" class="col-md-8">예약 삭제 상세보기
						<i class="fa fa-clock-o" style="float: left;margin-top: 6px;margin-bottom: -10px;">2022-06-29 09:00pm</i>
						</h4>

						<div class="card-tools" style="margin-left: 45%;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" id="registBtn"
								onclick="regist_go();">수 락</button>
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
				<h3 class="font-bold" style="padding-left:25px; padding-top: 20px"><i class="fa fa-pencil-square-o"></i>&nbsp;의료행위 삭제 반려사유를 기재해주세요</h3>
				<div class="modal-body">
					<div class="ibox-content">
						<div class="form-text_modal">
							<h4>본 환자에게 아직 이른 진료입니다. 차후에 차도가 있으면 해당 진료 들어갑시다</h4>
							<!-- 			<textarea class="form-control" name="content" id="content" rows="5" placeholder=""></textarea>						 -->
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-w-m btn-success">전송</button>
					&nbsp;
					<button type="button" class="btn btn-w-m btn-default" data-dismiss="modal" >취소</button>
				</div>
			</div>
		</div>
	</div>














					<!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do"
							name="registForm">


							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label for="title" style="margin-left: 3px;">요청의료진</label>
									<input type="text" class="form-control"  readonly disabled placeholder="       박태정"   style="    width: 151px;
    display: inline;
    margin-left: 4px;"/>
								</div>
								<div class="col-md-6" style="display: contents;">

								</div>
							</div>


<div class="form-group" style="display:inline;">
								<div class="col-md-6" style="display: contents;">
									<label for="title" style="margin-left: 3px;">의료행위</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<div class="input-group-prepend"
										style="display: inline; margin-left: 2%;">

										<input type="text" class="form-control" disabled placeholder="       외래진료"   style="width: 151px;
    display: inline;
    margin-left: 3px;"/>

									</div>
								</div>
							</div>




							<div class="col-md-6" style="display: inline;
    margin-left: -19px;">
								<div class="form-group" style="width: 300px; display: contents;">
									<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
										for="date"></label>
										<input readonly disabled type="text"  placeholder="       2022-07-05" id="title" name="title" class="form-control"
									style="display: inline;
    margin-left: 10px;
    margin-bottom: 17px;
    height: 31px;
    width: 151px;">
								</div>
							</div>




							<div class="form-group" style="margin-left: 4px;">
								<div class="col-md-6">
									<label for="title" style="">내용</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<textarea  id="title" name="title_disease" readonly disabled
										class="form-control" placeholder="해당 환자 기흉 이력 다수, 흉관삽입술 필요"
										style="width: 84%; display: inline; margin-left: 70px;height: 100px;margin-top: -26px;"></textarea>

								</div>
							</div>
							<div class="form-group" style="margin-bottom: 5px;
    margin-left: 11px;">
								<div class="col-md-6" style="display: inline-block; width: 9%;">
									<label style="margin-left: -23px; display: inline-block;"
										for="title">하위업무</label>
								</div>

								<input readonly disabled type="text" placeholder="CHEST-PA" id="title" name="title" class="form-control"
									style="display: inline; width: 40%; margin-left: -2px;">
								<i class="fa fa-calendar" style="margin-left: 2.5%;"></i>
								<input class="datepicker" readonly disabled type="text" placeholder="   2022-07-02" id="title" name="title" class="form-control"
									style="display: inline; height: 31px;width: 184px; margin-left: 18px;"><a href="#"
									style="display: inline; margin-left: 11px; font-size: 23px; vertical-align: -4px;">  </a>
							</div>

						<div class="form-group" style="margin-bottom: 5px;
    margin-left: 11px;">
								<div class="col-md-6" style="display: inline-block; width: 9%;">

								</div>
								<input type="text" readonly disabled placeholder="CHEST-PA" id="title" name="title" class="form-control"
									style="display: inline; width: 40%; margin-left: -2px;">
								<i class="fa fa-calendar" style="margin-left: 2.5%;"></i>
								<input class="datepicker"  readonly disabled type="text" placeholder="   2022-07-04" id="title" name="title" class="form-control"
									style="display: inline; height: 31px;width: 184px; margin-left: 18px;"><a href="#"
									style="display: inline; margin-left: 11px; font-size: 23px; vertical-align: -4px;">  </a>
							</div>

						    <div class="form-group" style="margin-bottom: 5px;
    margin-left: 11px;">
								<div class="col-md-6" style="display: inline-block; width: 9%;">

								</div>
								<input type="text" readonly disabled placeholder="CHEST-PA" id="title" name="title" class="form-control"
									style="display: inline; width: 40%; margin-left: -2px;">
								<i class="fa fa-calendar" style="margin-left: 2.5%;"></i>
								<input readonly disabled class="datepicker" type="text" placeholder="   2022-07-02" id="title" name="title" class="form-control"
									style="display: inline; height: 31px;width: 184px; margin-left: 18px;"> <a href="#"
									style="display: inline; margin-left: 11px; font-size: 23px; vertical-align: -4px;"></a>
							</div>


							<div class="form-group">
								<div class="col-md-6">
									<label for="title" style="margin-left: -15px;">삭제 사유</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<textarea  id="title" name="title_disease" readonly disabled
										class="form-control" placeholder="완치되어 진료 삭제원합니다"
										style="width: 84%; display: inline; margin-left: 70px; height: 100px; margin-top: -26px;"></textarea>

								</div>
							</div>






						</form>


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