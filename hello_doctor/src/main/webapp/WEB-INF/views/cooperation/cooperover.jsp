<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<link href="<%=request.getContextPath()%>/resources/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/dropzone/dropzone.css" rel="stylesheet">

<style>
</style>

</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
		<div class="justify-content-center">
			<div class="col-md-13" style="padding: 3px">
				<div class="card card-outline card-info">
				<div class="card-header row" style="margin-right: 0px; margin-left: 0px;">
						<h4 class="col-md-8" style="width: 72%;">협진종료</h4>
						<div class="card-tools" style="margin-top: -7px; position:absolute; right:10px;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-outline btn-danger  dim " type="button"  data-toggle="modal" data-target="#myModal4">협진 종료</button>


							<button class="btn btn-outline btn-warning  dim" type="button">취 소</button>
						</div>
					</div>
					<!--end card-header  -->



					<div class="card-body pad" style="min-height: 436px;height: auto;">
						<form role="form" method="post" action="regist.do" name="registForm">



							<div class="form-group" style="display: inline-block; width: 44%;">
								<div class="col-md-6" style="display: contents;">
									<label for="title" style="margin-left: 4px;">종료사유</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<div class="input-group-prepend" style="display: inline; margin-left: 2%;">
										<select required class="form-control" style="height: 33px;width: 58%;text-align: center;font-size: 1em;display: inline-block;margin-left: 7px;" name="searhlist">
											<option disabled="" selected="">선택</option>
											<option value="외래진료">완치</option>
											<option value="입원치료">치료중단</option>
											<option value="수술">사망</option>
											<option value="수술">기타</option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group" style="display: inline-block; width: 50%;">


							</div>




							<div class="form-group">
								<div class="col-md-6">
									<label for="title" style="">내용</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<textarea id="title" name="title_disease" class="form-control" placeholder="내용을 입력하세요" style="width: 84%; display: inline; margin-left: 70px; height: 100px; margin-top: -26px;"></textarea>
								</div>
							</div>


						</form>
						<div class="col-md-6">
									<label for="" style="">파일 업로드</label>
								</div>



<form action="#" class="dropzone dz-clickable" id="dropzoneForm" style=" width: 85%;
    margin-left: 11%;
    border: 1px dotted #1ab394;">

		<div class="dz-default dz-message col-md-12">
			<span ><strong><i class="fa fa-file-text"></i>클릭 및 드래그를 이용하여 파일을 첨부해 주세요.</strong></span>
		</div>
	</form>



                            <!-- 협진 탈퇴 시 업무 남아있을 경우 모달창 -->
                              <div class="modal inmodal" id="myModal4" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content animated fadeIn">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <i class="fa fa-clock-o modal-icon"></i>
                                            <h5 class="modal-title" style="color:red;"></h5>
                                            <small style="font-size: 1.1em;">아래의 진료들이 남아있습니다.<br>협진 종료를 진행하시겠습니까?</small>
                                        </div>
                                        <div class="modal-body">
                                           <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>날짜</th>
                                    <th>의료행위</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>2022-07-06 09:10</td>
                                    <td>입원치료</td>

                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>2022-07-08 11:15</td>
                                    <td>외래진료</td>
                                </tr>
                                <tr>
                                   <td>3</td>
                                    <td>2022-07-010 14:20</td>
                                    <td>외래진료</td>
                                </tr>
                                </tbody>
                            </table>
                                        </div>
                                        <div class="modal-footer">
                                          <button class="btn btn-danger dim demo3" type="button">협진 종료하기</button>

<button class="btn btn-warning  dim" data-dismiss="modal" type="button">닫 기</button>
                                        </div>
                                    </div>
                                </div>
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

    <!-- DROPZONE -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/dropzone/dropzone.js"></script>

  <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

	<script>

	 $("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
		});




		$(document).ready(function() {

			  $('.demo3').click(function () {

		            swal({
		                title: "",
		                text: "협진 종료 시 현재 협진에 참여 중인 의료진과의 협진이 종료됩니다.정말로 협진을 종료하시겠습니까?",
		                type: "warning",
		                showCancelButton: true,
		                confirmButtonColor: "#DD6B55",
		                confirmButtonText: "동의",
		                closeOnConfirm: false
		            }, function () {
		                swal("종료 완료", ".", "success");
		            });
		        });




		});


		 if($('#worklist >tbody tr').length == 0 ){
			 $('#worklist').append("<tr id='deftr'><td>항목을 추가하세요.</td></tr>")

		 }

		  $('.datetimepicker').datetimepicker();
		  function apendtr() {
				var wt = $('#worktitle').val();
				var date = $('#workdate').val();

				var deftr = document.getElementById("deftr");

				if(deftr!=null && deftr){
		  			deftr.remove();
		  		}

				$('#worklist')
						.append(
								"<tr id='append_tr'><td>"
										+ wt
										+ "</td><td>"
										+ date
										+ "</td><td onclick='removetr(this)'><a><i style='font-size: 22px;' class='fa fa-minus'></i></a></td></tr>")


			}


			function removetr(aa) {
				$(aa).parents("tr").remove();
				if($('#worklist >tbody tr').length == 0 ){
	 				 $('#worklist').append("<tr id='deftr'><td>항목을 추가하세요.</td></tr>")

	 			 }
			}


	</script>

</body>
</html>