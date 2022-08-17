<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- icheck -->
   <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">

<!-- Sweet Alert -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">

<style>

[data-tooltip]{position:relative;}
[data-tooltip]:before,
[data-tooltip]:after{visibility:hidden;opacity:0;position:absolute;left:50%;transform:translateX(-50%);white-space:nowrap;transition:all .2s ease;font-size:11px;font-family:dotum;letter-spacing:-1px;}
[data-tooltip]:before{content:attr(data-tooltip);height:22px;position:absolute;top:-20px;padding:5px 10px;border-radius:5px;color:#fff;background:#025272;box-shadow:0 3px 8px rgba(165, 165, 165, 0.5);}
[data-tooltip]:after{content: '';border-left:5px solid transparent;top:2px;border-right:5px solid transparent;border-top:5px solid #025272;}
[data-tooltip]:not([data-tooltip=""]):hover:before{visibility:visible;opacity:1;top:-30px}
[data-tooltip]:not([data-tooltip=""]):hover:after{visibility:visible;opacity:1;top:-8px}


</style>



</head>
<body>
	<div class="col-sm-12 row">
		<div class="col-sm-4">
		<h2>내 정보 </h2>
		</div>
		<div class="col-sm-8" style="margin-top: 25px;">
			<button type="button" class="btn btn-w-m btn-danger" onclick="window.close()" style="float: right; margin-left: 30px;">취소</button>
			<button type="button" onclick="fakebtn()" class="btn btn-w-m btn-primary" style="float: right;">수정 완료</button>
		</div>
	</div>
	<hr style="background-color:black;">
			<div class="col-lg-12">
				<div class="contact-box">
		<form class="m-t" id="submit" action="modify" enctype="multipart/form-data" method="POST">
					<div class="row">
						<div class="col-4" style="">
							<div class="text-center">
								<img style=" width: 150px; height: 150px;"
								id="profilepic"  alt="image" class="rounded-circle m-t-xs img-fluid" src="<%=request.getContextPath()%>/doctor/getPic?dId=${doctorLogin.dId}" />
							<label for="inputFile" style="width: 214px;font-size: 10px">
						   <i class="fa fa-camera fa-3x" style="margin-left: 187px;color: #1ab394;transform: perspective(10px);" onclick="profile()"></i>
						</label>
							</div>
						</div>
						 <input class="form-control" type="hidden" name="dId" value="${param.dId}">
						<div class="col-8">
							<div class="col-sm-12">
								<h4>
									<label>이름
									 <input class="form-control" type="text" value="${doctorLogin.dName}"
									 name="dName" id="dName"  style="height: 30px;">
									</label>
								</h4>
							</div>
							<div class="col-sm-12">
								<h4>
									<label>세부 전공
									 <input class="form-control" type="text"  value="${doctorLogin.smName}"
									 name="smName" id="smName" style="height: 30px;">
									</label>
								</h4>
							</div>
							<div class="col-sm-12">
								<h4>
									<label>이메일
									 <input class="form-control" type="text"  value="${doctorLogin.email}"
									  name="email" id="email" style="height: 30px;">
									</label>
								</h4>
							</div>

<!-- 							<div class="col-sm-12"> -->
<!-- 								<h4 style="margin-bottom: 0px;"> -->
<!-- 									<label>비밀번호 -->
<!--    									<input style="height: 30px;" type="password" class="form-control passcheck" -->
<!--    									placeholder="4~12 영문자 숫자" name="pwd" id="pwd"> -->
<!-- 									</label> -->
<!-- 									<label>비밀번호 확인 -->
<!-- 			       					<input style="height: 30px;" type="password" class="form-control passcheck" -->
<!-- 			       					placeholder="비밀번호 확인"  id="docpasscheck"> -->
<!-- 									</label> -->
<!-- 								</h4> -->
<!-- 							</div> -->
<!-- 							<div class="col-sm-12" > -->
<!-- 								<span id="alert-success" style="display: none; font-weight: bold; ">비밀번호가 일치합니다.</span> -->
<!-- 								<span id="alert-danger" style="display: none;color: red;font-weight: bold;">비밀번호가 틀렸습니다.</span> -->
<!-- 							</div> -->

<!-- 							<div class="col-sm-12" style="height: 61px;"> -->
<!-- 								<h4> -->
<!-- 									<label style=" padding-left: 0px; margin-bottom: 0px;" -->
<!-- 									for="phone" class="col-sm-3 control-label" style="">전화번호</label> -->
<!-- 								</h4> -->
<!-- 									<div class="input-group-sm" style=""> -->
<!-- 											<select style="width: 112px;" name="firsttel" id="firsttel" class="form-control float-left"> -->
<!-- 												<option value="010">010</option> -->
<!-- 												<option value="011">011</option> -->
<!-- 												<option value="017">017</option> -->
<!-- 												<option value="018">018</option> -->
<!-- 											</select> -->
<!-- 											<label class="float-left" style="padding: 0; text-align: center; margin-top: 6px;">&nbsp;-&nbsp;</label> -->
<!-- 											 <input  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" style="width: 100px;" -->
<!-- 											  name="secondtel" id="secondtel" type="text" class="form-control float-left"> -->
<!-- 											  <label class="float-left" style="padding: 0; text-align: center; margin-top: 6px; margin-right: 3px;">&nbsp;-</label> -->
<!-- 											  <input  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" style="width: 98px;" -->
<!-- 											  name="threetel" id="threetel" type="text" class="form-control float-left"> -->
<!-- 									</div> -->
<!-- 								<h4> -->
<!-- 									<label>전화번호 -->
<%-- 									 <input class="form-control" type="text"  value=${doctorLogin.tel } --%>
<!-- 									  name="doctel" id="doctel" style="height: 30px;"> -->
<!-- 									</label> -->
<!-- 								</h4> -->
<!-- 							</div> -->

<!-- 							<div class="col-sm-12"> -->
<!-- 								<h4> -->
<!-- 									<label>OTP 인증 -->
<!-- 									<div class="i-checks" style="display: inline;"> -->
<!-- 										<label style="margin-left: 20px;"> -->
<!-- 											<div class="iradio_square-green" style="position: relative;"> -->
<!-- 												<input type="radio" value="2" style="position: absolute; opacity: 0;" name="otpCheck"> -->
<!-- 												<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins> -->
<!-- 											</div>활성화 -->
<!-- 										</label> -->
<!-- 									</div> -->
<!--                						<div class="i-checks" style="display: inline;"> -->
<!--                							<label style="margin-left: 20px;"> -->
<!--                								<div class="iradio_square-green" style="position: relative;"> -->
<!--                									<input type="radio" checked="" value="1" style="position: absolute; opacity: 0;" name="otpCheck"> -->
<!--                										<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins> -->
<!--                								</div>비활성화 -->
<!--                								</label> -->
<!--                							</div> -->
<!-- 									</label> -->
<!-- 								</h4> -->
<!-- 							</div> -->
						</div>
					</div>
				<input type="file" style="display: none;" id="inputFile" name="file">
				<button type="button" onclick="docinfomodify()" style="display: none"></button>
			</form>
				<div class="contact-box" style="border-radius: 20px; border: 1px solid #1ab394; padding-bottom: 5px;">
					<div class="col-sm-12" style="padding-left: 0px;">
						<h4 style="color: gray;">인증 보안 설정<span data-tooltip="비밀번호와 전화번호, 로그인 보안설정을 할 수 있습니다. ">
						<i class="fa fa-info-circle" style="font-size: 15px"></i></span> </h4>
					</div>
					<div class="col-sm-12" style="border-bottom: 1px solid #cdcdcd;">
						<h3 style=" display: inline-block;"><i class="fa fa-lock" style="color: gray;margin-right: 8px;"></i>비밀번호 </h3>
						<button type="button" onclick="" class="btn btn-primary"  data-toggle="modal" data-target="#pwdmodifyModal"
						style="float: right; background-color: #e9e9e9;border-style: none;height: 22px;padding-top: 2px;color: #747474;">수정 </button>
						<div class="modal inmodal" id="pwdmodifyModal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content animated fadeIn">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                            <img alt="" src="<%=request.getContextPath()%>/resources/img/modifykey.png" style="margin-left: 35px">
                                            <h4 class="modal-title">비밀번호 변경</h4>
                                        </div>
                                        <div class="modal-body">
				                            <div class="col-sm-12">
												<h4 style="margin-bottom: 0px; ">
													<label style="display: inline;margin-left: 49px;">비밀번호
				   									<input style="height: 30px; width: 50%;  display: inline; margin-left: 15px;  margin-bottom: 15px;"
				   									 type="password" class="form-control "
				   									placeholder="4~12 영문자 숫자" name="pwd" id="pwd">
													</label >
													<br>
													<label style="display: inline;margin-left: 31px;" >새 비밀번호
							       					<input style="height: 30px; width: 50%;  display: inline; margin-left: 15px; margin-bottom: 15px;"
							       					type="password" class="form-control passcheck"
							       				    id="newpwd" name="newpwd">
													</label>
													<br>
													<label style="display: inline;" >새 비밀번호 확인
							       					<input style="height: 30px; width: 50%;  display: inline; margin-left: 15px;"
							       					type="password" class="form-control passcheck"
							       				    id="newpwdcheck" name="newpwdcheck">
													</label>
												</h4>
											</div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
                                            <button type="button" class="btn btn-primary" onclick="passmodify()">완료</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


					</div>
					<div class="col-sm-12" style="border-bottom: 1px solid #cdcdcd; margin-top: 12px;">
						<h3 style=" display: inline-block;"><i class="fa fa-phone-square" style="color: gray;margin-right: 8px;"></i>전화번호 </h3>
						<button type="button" onclick="" class="btn btn-primary" data-toggle="modal" data-target="#telmodifyModal"
						style="float: right; background-color: #e9e9e9;border-style: none;height: 22px;padding-top: 2px;color: #747474;">수정 </button>
							<div class="modal inmodal" id="telmodifyModal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content animated fadeIn">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                            <img alt="" src="<%=request.getContextPath()%>/resources/img/tellmodify.png" style="  width: 100px; margin-left: 35px;">
                                            <h4 class="modal-title">전화번호 변경</h4>
                                        </div>
                                        <div class="modal-body" style="padding-right: 10px;">
				                            <div class="col-sm-12">
												<h4 style="margin-bottom: 0px; display: inline; ">
													<label style="float: left; margin-right: 10px;margin-top: 8px;">새 전화번호
													</label >
												</h4>
												<div class="input-group-sm" style="display: inline;">
														<select style="width: 112px;" name="firsttel" id="firsttel" class="form-control float-left">
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="017">017</option>
															<option value="018">018</option>
														</select>
														<label class="float-left" style="padding: 0; text-align: center; margin-top: 6px;">&nbsp;-&nbsp;</label>
														 <input  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" style="width: 100px;"
														  name="secondtel" id="secondtel" type="text" class="form-control float-left">
														  <label class="float-left" style="padding: 0; text-align: center; margin-top: 6px; margin-right: 3px;">&nbsp;-</label>
														  <input  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" style="width: 98px;"
														  name="threetel" id="threetel" type="text" class="form-control float-left">
												</div>
											</div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
                                            <button type="button" class="btn btn-primary" onclick="telmodify()">완료</button>
                                        </div>
                                    </div>
                                </div>
                            </div>





					</div>
					<div class="col-sm-12" style=" margin-top: 12px;" >
						<h3 style=" display: inline-block;"><i class="fa fa-mobile" style="color: gray;margin-right: 8px; font-size: 20px;"></i>
						<i class="fa fa-bell" style=" position: absolute; font-size: 10px;left: 18px;"></i>로그인 보안 </h3>
						<button type="button" onclick="" class="btn btn-primary"  data-toggle="modal" data-target="#otpmodifyModal"
						style="float: right; background-color: #e9e9e9;border-style: none;height: 22px;padding-top: 2px;color: #747474;">설정 </button>
							<div class="modal inmodal" id="otpmodifyModal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content animated fadeIn">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                            <img alt="" src="<%=request.getContextPath()%>/resources/img/otplogo.png"
                                            style="width: 100px;margin-left: 92px;">
                                            <h4 class="modal-title">로그인 보안 설정</h4>
                                        </div>
                                        <div class="modal-body">
				                            <div id="otpinput" class="col-sm-12" style="display: inline-block;">
												<h4 style="margin-bottom: 0px; ">
													<label style="display: inline;margin-left: 49px;">OTP 입력
				   									<input style="height: 30px; width: 50%;  display: inline; margin-left: 15px;  margin-bottom: 15px;"
				   									 type="text" class="form-control " name="user_code" id="user_code"
				   								    >
				   								     <input id="encodedKey" name="encodedKey" type="hidden" readonly="readonly" value="${doctorLogin.otpCo}">
													</label >
													 <button type="button" class="btn btn-primary" onclick="otpcheckclick()"
													 style="display: inline-block;height: 30px;margin-bottom: 2px;padding-top: 3px;background-color: #1e81ce;border-color: #1e81ce;">
													   확인</button>

												</h4>
											</div>
											<div id="hiddenotpcheck" class="col-sm-12" style="display: none;">
												<h4>
													<label style="margin-left: 49px; display: inline;">OTP 인증
													<div class="i-checks" style="display: inline;">
														<label style="margin-left: 20px;">
															<c:choose>
																<c:when test="${doctorLogin.otpCheck eq '2'}">
																	<div class="iradio_square-green" style="position: relative;">
																	<input  checked="checked"  type="radio" value="2" style="position: absolute; opacity: 0;" name="otpCheck" >
																	<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
																	</div>활성화
																</c:when>
																<c:otherwise>
																		<div class="iradio_square-green" style="position: relative;">
																			<input  type="radio" value="2" style="position: absolute; opacity: 0;" name="otpCheck" >
																			<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
																		</div>활성화
																</c:otherwise>
															</c:choose>
														</label>
													</div>
				               						<div class="i-checks" style="display: inline;">
				               							<label style="margin-left: 20px;">
				               								<c:choose>
					               								<c:when test="${doctorLogin.otpCheck eq '1' }">
					               								<div class="iradio_square-green" style="position: relative;" >
					               									<input type="radio" checked="checked" value="1" style="position: absolute; opacity: 0;" name="otpCheck" id="otpCheck1">
					               										<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
					               								</div>비활성화
					               								</c:when>
					               								<c:otherwise>
					               								<div class="iradio_square-green" style="position: relative;" >
					               									<input type="radio"  value="1" style="position: absolute; opacity: 0;" name="otpCheck" id="otpCheck1">
					               										<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
					               								</div>비활성화
				               									</c:otherwise>
				               								</c:choose>
				               								</label>
				               							</div>
													</label>
												</h4>
											</div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
                                            <button id="otphiddenbten" type="button" class="btn btn-primary" onclick="otpmodify()" style="display: none;">완료</button>
                                        </div>
                                    </div>
                                </div>
                            </div>






					</div>

				</div>
			</div>

			</div>







 <!-- Mainly scripts -->


<!-- iCheck -->
<script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

<!-- Sweet alert -->
<script
	src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>




<script type="text/javascript">
	// 프로필 사진 등록
	$(document).on(
					"change",
					"#inputFile",
					function profile() {

						var picture = $(this);
						console.log(picture)

						var fileFormat = picture.val().substr(
								picture.val().lastIndexOf(".") + 1)
								.toUpperCase();
						if (!(fileFormat == "JPG" || fileFormat == "JPEG" || fileFormat == "PNG")) {
							alert("이미지는 jpg/jpeg 형식만 가능합니다.");
							return;
						}

						//이미지 파일 용량 체크
						if (picture[0].files[0].size > 1024 * 1024 * 5) {
							alert("사진 용량은 5MB 이하만 가능합니다.");
							return;
						}
						;
						var reader = new FileReader();
						reader.onload = function(e) {
							var result = reader.result
							$('#profilepic').attr('src', result);
						}
						reader.readAsDataURL(picture[0].files[0]);

					});
</script>


<script>
 $(document).ready(function(){
     $('.i-checks').iCheck({
         checkboxClass: 'icheckbox_square-green',
         radioClass: 'iradio_square-green',
     });
 });


// 비밀번호 확인
$('.passcheck').focusout(function () {
	    var pwd1 = $("#newpwd").val();
	    var pwd2 = $("#docpasscheck").val();

	    if ( pwd1 != '' && pwd2 == '' ) {
	        null;
	    } else if (pwd1 != "" || pwd2 != "") {
	        if (pwd1 == pwd2) {
	            $("#alert-success").css('display', 'inline-block');
	            $("#alert-danger").css('display', 'none');
	        } else {
	            $("#alert-success").css('display', 'none');
	            $("#alert-danger").css('display', 'inline-block');

	        }
	    }
});



</script>




<script>


function namemodify(){

	var txt = $('#docname').val();

//  	alert("버튼 수정 클릭"+txt)


}

function fakebtn(){

	docinfomodify();

}

function docinfomodify(){
// 	alert("숨겨진 버튼 실행!")


	var form = $('#submit');

	form.submit();



}


function passmodify(){

// 	alert("비밀번호 수정완료 클릭")

	var pwd  = $('#pwd').val()
	var newpwd  = $('#newpwd').val()
	var newpwdcheck  = $('#newpwdcheck').val()


	console.log(pwd)
	console.log(newpwd)
	console.log(newpwdcheck)

	data = {

		"pwd" : pwd,
		"newpwd" : newpwd,
		"newpwdcheck" : newpwdcheck

	}

	if(newpwd==''){
		swal({
			title : "변경할 비밀번호를 입력해주세요",
			type : "warning"
		});
	}else if(newpwd != ""){




	$.ajax({

		url:"<%=request.getContextPath()%>/myinfo/passmodify",
		type : "POST",
		data: JSON.stringify(data),
		contentType:'application/json',
		success:function(res){
// 				alert("성공"+res)
				if(res.toUpperCase() == "PWDFAIL"){
					 swal("", "기존 비밀번호를 잘못 입력하셨습니다.", "warning");
						setTimeout(function(){
						}, 1000);
					 $('#pwdmodifyModal').modal('hide');
				}else if(res.toUpperCase() == "PWDSAME"){
					swal("", "기존 비밀번호와 새비밀번호가 동일합니다. 다시 수정해주세요.", "warning");
					setTimeout(function(){
					}, 1000);
					 $('#pwdmodifyModal').modal('hide');
				}else if(res.toUpperCase() == "NEWPWDFAIL"){
					swal("", "새비밀번호가 동일하지 않습니다. 다시 수정해주세요.", "warning");
					setTimeout(function(){
					}, 1000);
					$('#pwdmodifyModal').modal('hide');
				}else {
					 swal("", "비밀번호가 변경되었습니다.", "success");
						setTimeout(function(){
						}, 1000);
					 $('#pwdmodifyModal').modal('hide');

				}

		},
		error:function(xhr){
			alert("오류:"+xhr)

		}


	})

}


}


function otpcheckclick(){

	var user_code = $('#user_code').val();
	var encodedKey = $('#encodedKey').val();

	console.log(user_code);
	console.log(encodedKey);

	data = {

			"user_code" : user_code,
			"encodedKey" : encodedKey
		}

	if(user_code==''){
		swal({
			title : "OTP를 입력해주세요",
			type : "warning"
		});
	}else if(user_code != ""){



	$.ajax({

		url:"<%=request.getContextPath()%>/otpcheck/modifyotp",
		type : "POST",
		data: JSON.stringify(data),
		contentType:'application/json',
		success:function(res){

				if(res.toUpperCase() == "TRUE"){
// 					alert("otp 일치!")
					$('#otpinput').css('display','none');
					$('#hiddenotpcheck').css('display','inline-block');
					$('#otphiddenbten').css('display','inline-block');
				}else{
// 					alert("otp 실패!")
					swal({
						title : "OTP가 일치하지 않습니다!",
						type : "warning"
					});
				}


		},
		error:function(xhr){
			alert("오류:"+xhr)

		}


		})

	}

}


function otpmodify(){

	var logincheck = $('input[name=otpCheck]:checked').val();

	console.log(logincheck);

	data = {

			"logincheck" : logincheck
		}


	$.ajax({

		url:"<%=request.getContextPath()%>/myinfo/otpmodify",
		type : "POST",
		data: JSON.stringify(data),
		contentType:'application/json',
		success:function(res){
// 				alert("성공"+res)

				if(res.toUpperCase() == "OTPDISABLED"){
					 swal("", "OTP가 비활성화 되었습니다!", "success");
					 $('#otpCheck1').attr('checked','checked')
					setTimeout(function(){
					}, 1000);
				 $('#otpmodifyModal').modal('hide');


				}else{
					 swal("", "OTP가 활성화 되었습니다!", "success");
					 $('#otpCheck2').attr('checked','checked')
					setTimeout(function(){
					}, 1000);
				 $('#otpmodifyModal').modal('hide');
				}


		},
		error:function(xhr){
			alert("오류:"+xhr)

		}

	})

}



function telmodify(){

	var firsttel = document.getElementById('firsttel')
	var secondtel = $('#secondtel').val();
	var threetel = $('#threetel').val();

	console.log(firsttel.options[firsttel.selectedIndex].value);
	console.log(secondtel);
	console.log(threetel);


	if(threetel=='' || secondtel==''){
		swal({
			title : "변경할 전화번호를 입력해주세요",
			type : "warning"
		});
	}else if(threetel != ""){


	data = {

			"firsttel" : firsttel.options[firsttel.selectedIndex].value,
			"secondtel" : secondtel,
			"threetel" : threetel,

		}


	$.ajax({

		url:"<%=request.getContextPath()%>/myinfo/telmodify",
		type : "POST",
		data: JSON.stringify(data),
		contentType:'application/json',
		success:function(res){

			if(res.toUpperCase() == "TELMODIFY"){
				 swal("", "전화번호가 수정 되었습니다.", "success");
				setTimeout(function(){
				}, 1000);
			 $('#telmodifyModal').modal('hide');


			}



		},
		error:function(xhr){
			alert("오류:"+xhr)

		}

		})

	}


}

</script>

<c:if test="${modify eq 'success'}" >
   <script>
      swal("", "정보가 수정되었습니다.", "success");
		setTimeout(function(){
			 window.close();
		     window.opener.location.reload();
		}, 1000);

   </script>
</c:if>



</body>
</html>