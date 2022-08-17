<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 등록</title>

<style>
</style>

</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
		<div class="justify-content-center">
			<div class="col-md-13" style="padding: 3px">
				<div class="card card-outline card-info">
					<div class="card-header row" style="margin-right: 0px; margin-left: 0px;" >
						<h4 class="col-md-8">예약</h4>
<div class="card-tools" style="margin-left: 13%;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" id="registBtn"
								onclick="regist_go();">예 약</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn"
								onclick="window.close();">취 소</button>
						</div>
					</div>
					<!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do"
							name="registForm">

							<div class="col-md-6" style="display: contents;">
								<div class="form-group" style="width: 300px; display: contents;">
									<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
										for="date"></label>
										<input class="datepicker" type="text" placeholder="   YYYY - mm - dd" id="title" name="title" class="form-control"
									style="display: inline;margin-left: 25px;margin-bottom: 17px;height: 31px;width: 151px;">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label for="title" style="margin-left: 3px;">의료행위</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<div class="input-group-prepend"
										style="display: inline; margin-left: 2%;">
										<select class="form-control"
											style="margin-left: -3px;height: 31px; width: 151px; text-align: center; font-size: 1em; display: inline-block;"
											name="searhlist">
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
									<textarea  id="title" name="title_disease"
										class="form-control" placeholder="내용을 입력하세요"
										style="width: 84%; display: inline; margin-left: 70px; height: 200px; margin-top: -26px;"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-6" style="display: inline-block; width: 9%;">
									<label style="margin-left: -23px; display: inline-block;"
										for="title">하위업무</label>
								</div>
								<input type="text" placeholder="하위업무 등록 +" id="title" name="title" class="form-control"
									style="display: inline; width: 40%; margin-left: -2px;">
								<i class="fa fa-calendar" style="margin-left: 2.5%;"></i>
								<input class="datepicker" type="text" placeholder="   YYYY - mm - dd" id="title" name="title" class="form-control"
									style="display: inline; height: 31px;width: 184px; margin-left: 18px;"> <a href="#"
									style="display: inline; margin-left: 11px; font-size: 23px; vertical-align: -4px;"><i class="fa fa-minus" style="color: red"></i></a>
							</div>

		<div class="form-group">
								<div class="col-md-6" style="display: inline-block; width: 9%;">
									<label style="margin-left: -23px; display: inline-block;"
										for="title">하위업무</label>
								</div>
								<input type="text" placeholder="하위업무 등록 +" id="title" name="title" class="form-control"
									style="display: inline; width: 40%; margin-left: -2px;">
								<i class="fa fa-calendar" style="margin-left: 2.5%;"></i>
								<input class="datepicker" type="text" placeholder="   YYYY - mm - dd" id="title" name="title" class="form-control"
									style="display: inline; height: 31px;width: 184px; margin-left: 18px;"> <a href="#"
									style="display: inline; margin-left: 11px; font-size: 23px; vertical-align: -4px;"><i
									class="fa fa-plus"></i></a>
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