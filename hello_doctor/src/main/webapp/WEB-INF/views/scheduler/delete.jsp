<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
		<div class="justify-content-center">
			<div class="col-md-13" style="padding : 3px">
				<div class="card card-outline card-info">
				<div class="card-header row" style="margin-right: 0px;">
						<h4 class="col-md-8" style="width: 92%; display: inline-block;">삭제</h4>


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
						<div class="ibox-content">


							<div class="form-group">
								<div class="col-md-6">
									<label for="title" style="margin-left: -18px;">삭제 사유</label>
								</div>
								<div class="col-md-6" style="display: contents;">
									<textarea id="reason" name="title_disease" class="form-control" placeholder="내용을 입력하세요" style="width: 84%; display: inline; margin-left: 70px; height: 100px; margin-top: -26px;"></textarea>
								</div>
							</div>
							<div style="text-align: right; margin-right: 27px;">
								<button type="button" id="delsw" class="btn btn-primary btn-lg">삭제</button>
								<button type="button" id="delsw" class="btn btn-default btn-lg">취소</button>
							</div>



						</div>

					</div>
					<div class="card-footer" style="display:none">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>

    <script type="text/javascript">
	$('#delete').click(function () {
		  re = $('#reason').val();
	       if(re==""){
	    	   alert("삭제 사유를 입력해주세요.");
	    	   return false;
	       }

        swal({
            title: "삭제",
            text: "예약을 삭제하기 위해서는 주치의의 승인이 있어야 합니다.\n주치의에게 승인 요청을 하시겠습니까?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "확인",
            closeOnConfirm: false
        }, function () {
            swal("", "삭제에 성공했습니다.", "success");
            setTimeout(function(){
               	location.href="detailList.do";
            },1000);

        });



    });
	</script>
		<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
</body>
</html>