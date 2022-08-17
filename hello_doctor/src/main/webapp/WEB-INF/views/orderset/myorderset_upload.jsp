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
						<h4 class="col-md-8" style="width: 89%;display: inline-block;">My오더세트 업로드</h4>
						
						<div class="card-tools" style="display: inline-block;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" style="border: none;background: none;" onclick="window.close();">
								<i class="fa fa-times-rectangle" aria-hidden="true" style="color: #3E5476;
    font-size: 23px;
    vertical-align: -8px;"></i>
							</button>

						</div>
					</div><!--end card-header  -->

					<form role="form" method="post" action="myorderset_upload" name="upload">
						<div class="card-body pad" style="height: 584px;">
							<p>업로드 전 주의사항을 입력해주세요.</p>



							<div class="col-md-10" style="margin: 0 auto;">
								<textarea id="reason" name="oCaution" class="form-control"
									placeholder="주의사항을 입력하세요"
									style="width: 96%; margin: 0 auto; height: 142px;"></textarea>
							</div>

							<div style="text-align: center; margin-top: 26px;">
								<button type="button" id="delsw" class="btn btn-primary btn-lg" >업로드</button>
							</div>

						</div>
						 <input type="hidden" name="moNo" value="${param.moNo}">
					</form>
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div>
		</div><!-- end row -->
    </section>
    
    <script type="text/javascript">
	$('#delsw').click(function () {
		  re = $('#reason').val();
	       if(re==""){
	    	   alert("주의사항을 입력해주세요.");
	    	   return false;
	       }
	       
        swal({
            title: "",
            text: "해당 My오더세트를 업로드 하시겠습니까? \n업로드한 오더세트는 공유 오더세트에서 볼수있습니다.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "확인",
            closeOnConfirm: false,
            closeOnCancel : true
        }, function (isConfirm) {
	        if (isConfirm) {
	        	//swal("", "업로드에 성공했습니다.", "success");
	            setTimeout(function(){

	            	window.opener.name = "parentPage"; // 부모창의 이름 설정
	            	    document.upload.target = "parentPage"; // 타켓을 부모창으로 설정
	            	    document.upload.submit();
	            	    self.close();

	            },1000);
			}else{
				
			}

        });
      
        
    });
	</script>
		<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
</body>
</html>