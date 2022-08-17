<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세</title>

<style>



</style>

</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
		<div class="justify-content-center">
			<div class="col-md-13" style="padding : 3px">
				<div class="card card-outline card-info">
				<div class="card-header row" style="margin-right: 0px;">
						<h4 class="col-md-8" style="width: 88%; display: inline-block;">예약 상세</h4>

						<div class="filebox"
							style="margin-left: 13px; display: inline; width: 2%;">
							<i class="fa fa-cog" data-toggle="dropdown" type="button"
								aria-expanded="false" style="font-size: 23px; vertical-align: -9px;"></i>
							<ul class="dropdown-menu" x-placement="bottom-start"
								style="position: absolute; top: 131px; left: 929px; will-change: top, left; min-width: 6rem;">
								<li><a href="modify.do">수정</a></li>
								<li><a href="delete.do">삭제</a></li>
							</ul>
						</div>
						<div class="card-tools" style="display: inline-block;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button"
								style="border: none;background: none;"
								onclick="window.close();">
								<i class="fa fa-times-rectangle" aria-hidden="true" style="color: #3E5476;
    font-size: 23px;
    vertical-align: -8px;"></i>
							</button>

						</div>
					</div><!--end card-header  -->
					<div class="card-body pad" style="height: 584px;">
						<form role="form" method="post" action="regist.do" name="registForm">

							<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
										for="date"></label> <input class="datepicker form-control"
										type="text" placeholder="2022 - 07 - 09" id="title"
										name="title"
										style="display: inline; width: 20%; margin-left: 25px;"
										disabled="disabled">
								</div>
							</div>

								<div class="form-group">
								<div class="col-md-6" style="display: contents;">
									<label for="title">담당의</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<input class=" form-control" type="text" id="title" name="title" value="노혜지 / 흉부외과" style="display: inline; width: 48%; margin-left: 25px;" disabled="disabled">
								</div>
							</div>



							<div class="form-group"
								style="display: inline-block; width: 69%;">
								<div class="col-md-6" style="display: contents;">
									<label for="title">협진명</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<input class=" form-control" type="text"
										placeholder="YYYY - mm - dd" id="title" name="title"
										value="이정규(간이식)"
										style="display: inline; width: 70%; margin-left: 25px;"
										disabled="disabled">
								</div>
							</div>


							<div class="form-group"
								style="width: 35%; margin-left: -51px; display: inline-block;">
								<div class="col-md-6" style="display: contents;">
									<label for="title">의료행위</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<input class="form-control" type="text"
										placeholder="YYYY - mm - dd" id="title" name="title"
										value="외래진료"
										style="display: inline; width: 56%; margin-left: 12px;"
										disabled="disabled">
								</div>
							</div>





							<div class="form-group">
								<div class="col-md-6"><label for="title">내용</label></div>
								<div class="col-md-6" style="display: contents;"><textarea type="text" id="title" name="title_disease" class="form-control" placeholder="내용을 입력하세요" style="width: 84%; display: inline; margin-left: 67px; height: 100px;margin-top: -26px;" disabled="disabled">아토피 증상</textarea>
								</div>
	                       </div>
						   <div class="form-group">
								<div class="col-md-6"><label style="margin-left: -23px;" for="title">하위업무</label></div>
								<div class="col-md-6" style="display: contents;">
									<table class="table" style="width: 79%; margin: 0 auto; border-bottom: 1px solid #e7eaec;text-align: center; ">
										<tbody>
											<tr>
												<td>혈액검사</td>
												<td>2022-07-1</td>
												<td></td>
											</tr>
											<tr>
												<td>약물검사</td>
												<td>2022-07-1</td>
												<td></td>
											</tr>
											<tr>
												<td>간수치검사</td>
												<td>2022-07-1</td>
												<td></td>
											</tr>
											<tr>
												<td>간수치검사</td>
												<td>2022-07-1</td>
												<td></td>
											</tr>
											<tr>
												<td>간수치검사</td>
												<td>2022-07-1</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
	                       </div>


						</form>

					</div>
					<div class="card-footer" style="display:none">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>

        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>

</body>
</html>