<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
	 <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<%@ include file="header.jsp" %>

</head>
<body>
	<section>
		<div class="ibox-content" style="padding: 0%;">
			<div>
				<div class="card card-outline card-info">
					<div class="card-header">
						<div class ="row">
							<div class="col-sm-2">
								<span style="font-size: 1.5em; margin: 0 auto">공지등록</span>
							</div>
							<div class="col-sm-10" style="text-align: end">
								<button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">등 록</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-warning" id="cancelBtn" onclick="history.go(-1);" >취 소</button>

							</div>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form action="regist_notice" id="regist" method="post">
							<input type="hidden" value="${admin}" name="adminId">
							<div class="form-group row">
								<div class="col-sm-1" style="text-align: center">
									<label for="title" style="margin-top: 6px">제 목</label>
								</div>

								<div class="col-sm-11">
									<input type="text" id="nTitle"
										name='nTitle' class="form-control" placeholder="">
								</div>
							</div>
							<div class="form-gruop">
							    <div class="row">
							    	<div class="col-sm-1">
								        <span>공지고정</span>
							    	</div>
							        <div class="i-checks col-sm-11" style="display: inline;">
							            <label class="">&nbsp;&nbsp;&nbsp;설정
							                <div class="icheckbox_square-green" style="position: relative;">
							                    <input type="checkbox" value="N" name="pickYn" style="position: absolute; opacity: 0;">
							                        <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
						                    </div>
						                </label>
						                &nbsp;&nbsp;&nbsp;
										<span style="opacity: 0.6">※공지글이 등록되면 최상단에 등록됩니다.</span>
						            </div>
						        </div>
						    </div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-1">
										<span>팝업노출</span>
									</div>
									<div class="i-checks pop col-sm-11" style="display: inline;">
										<label>&nbsp;&nbsp;&nbsp;설정
										<div class="icheckbox_square-green" id="pop" style="position: relative;">
											<input type="checkbox" value="N" name="popYn" style="position: absolute; opacity: 0;">
											<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">
											</ins>
										</div>
										</label>
									<div id="d" style="display: contents">

									</div>
									</div>

								</div>
							</div>
							<hr>
							<div class="form-group">
								<textarea class="textarea" id="content" rows="40" name="nContent"
									cols="90" placeholder="1000자 내외로 작성하세요." ></textarea>
							</div>



						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
     <script src="<%=request.getContextPath() %>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/hs.js"></script>
    <script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
		    <script src="<%=request.getContextPath()%>/resources/js/plugins/summernote/summernote-bs4.js"></script>
	 <script src="<%=request.getContextPath() %>/resources/js/inspinia.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/plugins/pace/pace.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

	<script type="text/javascript">
	window.onload = function() {
		summernote_go($('#content'), '<%=request.getContextPath()%>');

		var contextPath = "";

		function summernote_go(target, context) {
			contextPath = context;
			target.summernote({
				placeholder:'여기에 내용을 적으세요.',
				lang:'ko-KR',
				height:250,
				disableResizeEditor: true,
				callbacks:{
					onImageUpload : function(files, editor, welEditable) {
						for(var file of files){
							//alert(file.name);

							if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
								alert("JPG 이미지형식만 가능합니다.");
								return;
							}
							console.log(file.size)
							if(file.size > 1024*1024*5){
								alert("이미지는 5MB 미만입니다.");
								return;
							}

						}


						for (var file of files) {
							console.log(this);
							sendFile(file,this);
						}
					},
					onMediaDelete : function(target) {
						//alert(target[0].src);
						deleteFile(target[0].src);
					}
				}
			});
		}

		function sendFile(file, el) {
			var form_data = new FormData();
			form_data.append("file", file);
			$.ajax({
				url: '<%=request.getContextPath()%>/uploadImg.do',
		    	data: form_data,
		    	type: "POST",
		    	contentType: false,
		    	entype: 'mutipart/form-data',
		    	processData: false,
		    	success: function(img_url) {
		    		 var image = $('<img>').attr({  src: img_url,
		    			  							style: "width : 50%;"});
	                 $(el).summernote("insertNode", image[0]);

		    	},
		    	error:function(){

		    		alert(file.name+" 업로드에 실패했습니다.");
		    	}
			});
		}

		function deleteFile(src){
			var splitSrc = src.split("=");
			var fileName = splitSrc[splitSrc.length - 1];

			var fileData = {fileName:fileName};

			$.ajax({
				url: '<%=request.getContextPath()%>/deleteImg.do',
				data: JSON.stringify(fileData),
				type: "post",
				contentType:"application/json",
		    	success: function(res) {
		    		cosole.log(res);
		    	},
		    	error:function(){
		    		alert("이미지 삭제가 불가합니다.");
		    	}
			});
		}



	}
	</script>

	<script type="text/javascript">
	function regist_go(){
		var regist = $("#regist");
		var nTitle = $("input[name=nTitle]").val();
		var nContent = $("textarea[name=nContent]").val();
		var popYn = $("input[name=popYn]").val();
		var pickYn = $("input[name=pickYn]").val();

		if(nTitle == ""){
			blank_title();
			return;
		}else if(nContent == ""){
			blank_content();
			return;
		}else if($("input[name=popPeriodStart]").val() == "" || $("input[name=popPeriodEnd]").val() == ""){
				blank_date();
				return;
		}else if($("input[name=popPeriodStart]").val() > $("input[name=popPeriodEnd]").val()){
			swal({
				title : "팝업게시일은 종료일 이후로 설정하여야 합니다.",
				type : "warning"
			});
		}else{
			Nregist();
		}

	}
	function blank_title(){
		swal({
            title: "제목은 필수 사항입니다.",
            text: "",
            type: "warning"
        });
	}
	function blank_content(){
		swal({
            title: "내용은 필수 사항입니다.",
            text: "",
            type: "warning"
        });

	}

	function blank_date(){
		if($("input[name=popPeriodStart]").val() == ""){
			swal({
				title : "팝업 시작일을 설정해주세요",
				type : "warning"
			});
		}else if($("input[name=popPeriodEnd]").val() == ""){
			swal({
				title : "팝업 종료일을 설정해주세요",
				type : "warning"
			});
		}
	}



	function Nregist(){
		var popYn = $("input[name=popYn]").val();
		var pickYn = $("input[name=pickYn]").val();
		var pop = "";
		var pick = "";
		if(popYn == "Y"){
			var s = $("input[name=popPeriodStart]").val();
			var e = $("input[name=popPeriodEnd]").val();
			pop = '팝업 설정\n ' + s + '~'+ e;
		}else if(popYn == 'N'){
			pop = "팝업 설정 안함";
		}
		if(pickYn == "Y"){
			pick = "\n공지사항 고정";
		}else if(pickYn == "N"){
			pick = "\n공지사항 고정 안함";
		}
		swal({
			title : "공지사항을 등록하시겠습니까?",
			text : pop + pick,
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "확인",
			closeOnConfirm : false
		}, function(){
			swal("", "공지사항 등록 완료", "success");
			setTimeout(function(){
				$("#regist").submit();
			}, 1000);
		});

	}
	</script>
	    <script type="text/javascript">
    $(document).ready(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
    </script>
    <script type="text/javascript">

	$(".pop").on("ifChecked", function(){
			$("#d").append(
					"<input id='popUpDate' name='popPeriodStart' style='margin-left:10px;' type='date'> ~ <input name='popPeriodEnd' type='date'>");
			$("input[name=popYn]").attr("value", "Y");
	});
	$(".pop").on("ifUnchecked", function(){
		$("#d").empty();
		$("input[name=popYn]").attr("value", "N");
	})
    </script>
    <script type="text/javascript">
    $("input[name=pickYn]").on("ifChecked", function(){
    	$("input[name=pickYn]").attr("value", 'Y');
    });
    $("input[name=pickYn]").on("ifUnchecked", function(){
    	$("input[name=pickYn]").attr("value", 'N');
    });
    </script>

</body>
</html>