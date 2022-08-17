<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>협진거절</title>
<style>
.form-text_modal{
 border:1px solid lightgray;
 border-radius: 10px;
 display: block;
 height: 120px;
 overflow:auto;
 padding-left: 3px;
}


</style>
</head>

<body>


	<div class="text-center">
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal5">Large Modal</button>
	</div>

	<div class="modal inmodal fade" id="myModal5" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<h3 class="font-bold" style="padding-left:25px; padding-top: 20px"><i class="fa fa-pencil-square-o"></i>&nbsp;협진거절 사유를 입력해주세요</h3>
				<div class="modal-body">
					<div class="ibox-content">
						<div class="form-text_modal">
							<h4>일정이 너무 많아서 협진거절합니다. 죄송합니다.</h4>
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



</body>

</html>
