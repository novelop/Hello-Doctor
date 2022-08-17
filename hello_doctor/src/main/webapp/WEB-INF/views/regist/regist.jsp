<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Register</title>
	<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">


<!-- Sweet Alert -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">



<style type="text/css">
body {
   width: 1200px;
   margin: 0 auto;
}

.fa-5x {
    font-size: 10em;
}

.fa-3x {
    font-size: 1.5em;
}

.form-control{

	float: right;
    margin-bottom: 5px;
    width: 311px;
}


.registdiv{
    float: left;

}

.loginscreen.middle-box {
    width: 400px;
}

.logo-name {
  color: #353030;
    font-weight: bold;
    letter-spacing: -10px;
    margin-bottom: 0;
    margin-left: 60px;
}

ul{
left: 488px !important;

}

.dropdown-menu {
 left:86px !important;
margin-top: 14px;


}

::placeholder {

	font-size: 11px;
	  opacity: 1;

}

div{
    font-weight: bold;

}

</style>


</head>



<body class="gray-bg">

		 <button class="btn btn-primary " name="phonecheckbtn" type="button" style="position: absolute;margin-left: 815px;margin-top: 455px;border: 2px solid #0ea6d7;background-color: #0ea6d7;z-index: 1;visibility:hidden; ">
                                            	완료</button>
		 <button class="btn btn-primary " name="emailckbtn" type="button" style="position: absolute;margin-left: 815px;margin-top: 494px;border: 2px solid #0ea6d7;background-color: #0ea6d7;z-index: 1;visibility:hidden; ">
                                         	        완료</button>
<div>
    <div class="middle-box text-center loginscreen   animated fadeInDown">
		<form class="m-t" id="submit" action="regist" enctype="multipart/form-data" method="POST" style="width: 470px;">
				<div>
					<h1 class="logo-name" style="font-size: 50px;">회원가입</h1>
				</div>
				<h3 style="margin-left: 60px;">HELLO DOCTOR</h3>
				<div>
					<div style="margin-left: 274px;position: absolute;margin-top: 7px;">
						<img style="position: absolute;width: 193px;height: 154px;" alt="프로필" id="profilepic" src="/ddit/resources/img/basicprofile.png">
						<label for="inputFile" style="width: 214px;font-size: 1.5em">
						   <i class="fa fa-camera fa-3x" style="margin-left: 136px;margin-top: 123px;color: #1ab394;transform: perspective(10px); cursor: pointer;" onclick="profile()"></i>
						</label>
					</div>
				</div>

				<div>
					<div class="form-group">
						<div class="registdiv" style="margin-left: 53px;padding-top: 8px;">이름</div>
						<input onclick="auto_go();" type="text" class="form-control" required="" name="dName" id="dName" placeholder="eX)홍길동" onkeyup="this.value=this.value.trim();" style="width: 180px;margin-bottom: 10px;float: left;margin-left: 7px;">
					</div>




					<!-- 			<div class="form-group"> -->
					<!-- 				<div class="registdiv" style="padding-top: 16px;">주민등록번호</div> -->
					<!-- 				<input placeholder="주민번호" maxlength="6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" class="form-control" style="width: 36%; float: left; margin-left: 10px;" name="firstRnum" id="firstRnum" -->
					<!-- 					required=""> -->
					<!-- 				<p style="position: absolute; margin-left: 239px; margin-top: 63px;">─</p> -->
					<!-- 				<input maxlength="7" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="password" class="form-control" style="width: 36%; float: left; margin-left: 24px;" name="secondRnum" id="secondRnum" required=""> -->
					<!-- 			</div> -->




					<div class="form-group" style="display: inline-block; margin-top: -6px; margin-bottom: -5px;">
						<div class="registdiv" style="margin-left: -47px;margin-top: 8px;position: absolute;">아이디</div>
						<input  type="text" class="form-control" required="" name="dId" id="dId" placeholder="4~12 영문자  숫자" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');" style="width: 180px;margin-right: 118px;">
						<button class="btn btn-primary" style="position: absolute;margin-left: 143px;margin-top: 1px;width: 37px;" type="button" onclick="idCheck_go();">
							<i class="fa fa-check"></i>
						</button>
					</div>
					<div class="form-group">
						<div class="registdiv" style="margin-left: 27px;margin-top: 8px;">비밀번호</div>
						<input style="width: 180px;float: left;margin-left: 7px;" type="password" class="form-control passcheck" placeholder="4~12 영문자 숫자" required="" name="pwd" id="pwd">
					</div>
					<div class="form-group" style="
">
						<div class="registdiv" style="/* padding-top: 35px; */float: left;margin-top: 34px;position: absolute;">비밀번호 확인</div>
						<input style="width: 180px;margin-right: 204px;" type="password" class="form-control passcheck" placeholder="비밀번호 확인" required="" id="pwdcheck" name="pwdcheck">
						<span id="alert-success" style="display: none; position: absolute; margin-top: 62px; width: 142px; left: 83px;">비밀번호가 일치합니다.</span>
						<span id="alert-danger" style="display: none;color: rgb(217, 39, 66);font-weight: bold;position: absolute;margin-top: 62px;width: 142px;left: 83px;">비밀번호가 틀렸습니다.</span>
					</div>


					<div style="display: inline-block; width: 100%;">
						<div>
							<div class="registdiv" style="text-align: right;display: inline-block;margin-left: 53px;margin-top: 23px;">전공</div>
							<input type="text" placeholder="ex)호흡기내과" class="typeahead_1 form-control" style="margin-bottom: -1px;margin-top: 14px;float: left;margin-left: 7px;width: 384px;" id="maName" name="maName">
						</div>
					</div>

					<div style="display: inline-block; width: 100%;">
						<div>
							<div class="registdiv" style="text-align: right;display: inline-block;margin-left: 27px;margin-top: 8px;">세부전공</div>
							<input type="text" placeholder="ex)만성기침" class="form-control" style="width: 384px;float: left;margin-left: 7px;" id="smName" name="smName">
						</div>
					</div>



				</div>



				<div class="form-group">
					<div class="registdiv" style="padding-top:3px;/* margin-left: 82px; */">주민등록번호</div>
					<input  maxlength="6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" class="form-control" style="width: 38%;float: left;margin-left: 8px;margin-top: -6px;" name="firstRnum" id="firstRnum" required="">
					<p style="position: absolute;margin-left: 271px;margin-top: 3px;">─</p>
					<input  maxlength="7" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="password" class="form-control" style="width: 181px;margin-left: 24px;margin-top: -6px;float: left;" name="secondRnum" id="secondRnum" required="">
				</div>


				<!-- 			<div style="display: inline-block; width: 100%;"> -->
				<!-- 				<div> -->
				<!-- 					<div class="registdiv" style="text-align: right; display: inline-block; margin-left: 54px; margin-top: 7px;">전공</div> -->
				<!-- 					<input type="text" placeholder="과를 입력해 주세요" class="typeahead_1 form-control" style="width: 78%;" id="maName" name="maName"> -->
				<!-- 				</div> -->

				<!-- 			</div> -->


				<div class="form-group">
					<label for="phone" class="col-sm-3 control-label" style="position: absolute;top: 465px;left: 1px;">전화번호</label>
					<div class="" style="display: inline-block; margin-bottom: 36px; margin-left: 8px; float: right;">
						<div class="input-group-sm" style="
">
							<select style="width: 112px;" name="firsttel" id="firsttel" class="form-control float-left">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="018">018</option>
							</select> <label class="float-left" style="padding: 0; text-align: center; margin-top: 6px;">&nbsp;-&nbsp;</label>
							 <input  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" style="width: 100px;" name="secondtel" id="secondtel" type="text" class="form-control float-left">
							  <label class="float-left" style="padding: 0; text-align: center; margin-top: 6px; margin-right: 3px;">&nbsp;-</label>
							  <input  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" style="width: 98px;" name="threetel" id="threetel" type="text" class="form-control float-left">
							<button id="telcheck" class="btn btn-primary " name="phonebtn" type="button" style="">
								인증
							</button>
						</div>
					</div>
				</div>



				<!-- 				<div class="form-group" style="display: inline-block;"> -->
<!-- 					<div class="registdiv" style="padding-top: 7px; margin-left: 45px;">전화번호</div> -->
<!-- 					<input maxlength="11" type="text" class="form-control" placeholder="ex)01012345678" required="" name="tel" id="tel" style="margin-left: 12px;">	 -->
<!-- 					<button id="telcheck" class="btn btn-primary " name="phonebtn" type="button" style="margin-left: 325px; margin-top: -67px; visibility: visible;"> -->
<!-- 						<i class="fa fa-check"></i>&nbsp;인증요청 -->
<!-- 					</button> -->
<!-- 				</div> -->
				<div class="form-group" style="display: inline-block; margin-bottom: 0px;">
					<div class="registdiv" style="margin-left: 38px;position: absolute;margin-top: -30px;">이메일</div>
					<input type="email" class="form-control" placeholder="ex)ample@naver.com" name="email" id="email" style="margin-top: -36px;margin-left: 86px;float: left;width: 81%;">
					<button id="mailcheck" class="btn btn-primary " name="mailcheck" type="button" style="margin-left: 418px;margin-top: -67px;visibility: visible;">
						인증
					</button>

				</div>
				<div class="form-group" style="display: inline-block; margin-bottom: 0px;">
					<div class="registdiv" style="margin-left: 47px;margin-top: -13px;">OTP</div>
					<input readonly="readonly" type="text" class="form-control" placeholder="http://chart.apis...." required="" name="otpQr" id="otpQr" style="margin-top: -21px;float: left;margin-left: 12px;width: 384px;">


					<button class="btn btn-primary " type="button" style="margin-left: 389px;margin-top: -66px;" name="otpbtn" id="otpbtn" onclick="otp_go();">
						OTP생성
					</button>

					<button class="btn btn-primary " type="button" style="position: absolute; margin-left: -72px; margin-top: -39px; border: 2px solid #0ea6d7; background-color: #0ea6d7;
					        visibility: hidden;  width: 72px; height: 33px;" name="otpcopybtn" id="otpcopybtn">
						QR&nbsp;<i class="fa fa-external-link"></i>
					</button>
				</div>

				<div class="form-group" style="display: none;" id="keyform">
					<div class="registdiv" style="margin-left: 48px;margin-top: -13px;">KEY</div>
					<input readonly="readonly" type="text" class="form-control" placeholder="ex) ABCDEF" required="" name="otpCo" id="otpCo" style="margin-top: -20px;float: left;margin-left: 12px;width: 385px;">
				</div>



				<button type="button" class="btn btn-primary block full-width m-b" onclick="regist_go();" style="margin-top: -16px;">회원가입</button>
				<br>
<!-- 				<button type="button" class="btn btn-primary block full-width m-b" onclick="auto_go();" style="margin-top: -16px;">자동완성</button> -->
				<input type="file" style="display: none;" id="inputFile" name="file">
			</form>
		</div>
</div>

    <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
<script
		src="<%=request.getContextPath()%>/resources/js/plugins/typehead/bootstrap3-typeahead.min.js"></script>
    <!-- openWindow -->
    <script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

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
</script>


<script>
// 아이디 중복 체크
var checkedID = "";
let flag = false;
let mailflag = false;


function idCheck_go(){
	//alert('id check btn click');
var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);

	var input_ID = $('input[name="dId"]');

	 //아이디 유효성검사
	  if(!getCheck.test($("#dId").val())){
	        alert("형식에 맞게 입력해주세요");
	        $("#dId").val("");
	        $("#dId").focus();
	        return false;
	   }


	if(!input_ID.val()){
		alert("아이디를 입력하시오");
		input_ID.focus();
		return;
	}

	$.ajax({
		url : "<%=request.getContextPath()%>/doctor/idCheck.do?dId=" + input_ID.val().trim(),
		method : "get",
		success : function(result){
			if(result.toUpperCase() == "DUPLICATED"){
					swal({
						title : "중복된 아이디입니다.",
						type : "warning"
					});
				$('input[name="dId"]').focus();
			}else{
				 swal("", "사용가능한 아이디 입니다.", "success");
					setTimeout(function(){
					}, 1000);
				checkedID = input_ID.val().trim();
				$('input[name="dId"]').val(input_ID.val().trim());
			}
		},
		error : function(error){
// 			alert("시스템 장애로 가입이 불가합니다");
			swal({
				title : "시스템 장애로 가입이 불가합니다",
				type : "warning"
			});
		}
	})
}

//전화번호 인증 성공시 style 바꿈
function parent_function(){
	$('button[name=phonecheckbtn]').css("visibility","visible")
	$('#firsttel').attr('readonly','readonly')
	$('#secondtel').attr('readonly','readonly')
	$('#threetel').attr('readonly','readonly')
	$('#telcheck').css("visibility","hidden")
	flag = true;

}

//이메일 인증 성공시 style 바꿈
function parent_emailfunction(){
	$('button[name=emailckbtn]').css("visibility","visible")
	$('#email').attr('readonly','readonly')
	$('#mailcheck').css("visibility","hidden")
	mailflag = true;

}

// 전화번호 인증
$('#telcheck').on('click',function(){
// 	 var txt = {"tel" : $('#tel').val()};
var tel1 = $('#firsttel').val()
var tel2 = $('#secondtel').val()
var tel3 = $('#threetel').val()

var telnum = tel1 + tel2 + tel3 ;

console.log(telnum);


<%-- 	 OpenWindow('<%=request.getContextPath()%>/regist/phonecheck?number='+$('#tel').val(), 'PopupWin',470,400); --%>
	 OpenWindow('<%=request.getContextPath()%>/regist/phonecheck?number='+telnum, 'PopupWin',470,400);


});


// 메일 인증
$('#mailcheck').on('click',function(){

	OpenWindow('<%=request.getContextPath()%>/regist/emailcheck?email='+$('#email').val(), 'PopupWin',470,400);

})


function auto_go(){
// 	alert("자동완성 클럭")

	$('#dName').attr('value','전우치')
	$('#dId').attr('value','12doc199')
	$('#pwd').attr('value','0000')
	$('#pwdcheck').attr('value','0000')
	$('#maName').attr('value','호흡기내과')
	$('#smName').attr('value','만성기침')
	$('#firstRnum').attr('value','990208')
	$('#secondRnum').attr('value','1212451')
	$('#secondtel').attr('value','7114')
	$('#threetel').attr('value','4823')
	$('#email').attr('value','dldmlcks007@naver.com')


}



//비밀번호 확인
$('.passcheck').focusout(function () {
    var pwd1 = $("#pwd").val();
    var pwd2 = $("#pwdcheck").val();

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

// 전공 자동완성
$('.typeahead_1').typeahead({
	 autoSelect: true,
    minLength: 2,
    delay: 0,
	source : function(word, process) { //source: 입력시 보일 목록
		var text = {"word": word};
	     $.ajax({
	           url :"<%=request.getContextPath()%>/regist/major"
	         , type : "POST"
	         , dataType: "JSON"
	         , data : 	JSON.stringify(text)// 검색 키워드
	         , contentType : 'application/json'
	         , success : function(response){ 	// 성공
	        	return process(response);
	         }
	         ,error : function(){ //실패
	             alert("자동완성 실패");
	         }
	     });
	 }

});
// var num = 60 * 3;
// var myVar;   
// function time(){
// 	   myVar = setInterval(alertFunc, 1000);     
// 	}   
//     time();
// 	function alertFunc() {
// 		var min = num / 60;
// 		    min = Math.floor(min);
// 		var sec = num - (60 * min);
// 		      console.log(min)
// 		      console.log(sec)  
// 	    var $input = $('.input').val(min + '분' + sec + '초'); 

// 	   if(num == 0){
// 		   clearInterval(myVar)
// 	   }
// 	   num--;

// 	}


// otp 버튼 클릭시 키값, url 값 가져옴
function otp_go(){

	$.ajax({
		type:"POST",
		url:"<%=request.getContextPath()%>/otp/",
		success: function(res){
// 			alert("res.rul"+res.url);
// 			alert("res.encodedKey"+res.encodedKey);
			// OtpController에서 QR 주소를 가져옴
			$('input[name=otpQr]').attr('value',res.url);
			$('button[name=otpbtn]').css('visibility','hidden');
			$('button[name=otpcopybtn]').css('visibility','visible').attr('onclick', 'OpenWindow('+"'"+res.url+"'"+')');
			$('input[name=otpCo]').attr('value',res.encodedKey);
			$('#keyform').css('display','block')
		},
		error: function(xhr){
			alert("오류:"+xhr);
		}
	})

}

function regist_go(){
	//alert("regist btn click");

     var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
     var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
     var buf = new Array(13); //주민등록번호 배열


	if(!$('input[name="dId"]').val()){
		swal({
			title : "아이디는 필수입니다.",
			text : "",
			type : "warning"
		})
		return;
	}

// 	if($('input[name="dId"]').val()!= checkedID){
// 		swal({
// 			title : "아이디 중복체크는 필수입니다.",
// 			text : "",
// 			type : "warning"
// 		})
// 		return;
// 	}

	if(!$('input[name="pwd"]').val()){
		swal({
			title : "패스워드는 필수입니다.",
			text : "",
			type : "warning"
		})
		return;
	}

	//비밀번호 공백 확인
    if($("#pwd").val() == ""){
      alert("패스워드 입력바람");
      $("#pwd").focus();
      return false;
    }

    //비밀번호 유효성검사
    if(!getCheck.test($("#pwd").val())){
      alert("비밀번호 형식에 맞게 입력해주세요");
      $("#pwd").val("");
      $("#pwd").focus();
      return false;
    }

	if(!$('input[name="dName"]').val()){
		alert("이름은 필수입니다.")
		return;
	}

	if(!$('input[name="firstRnum"]').val()){
		alert("주민등록번호는 필수입니다.")
		return;
	}

	if(!$('input[name="secondRnum"]').val()){
		alert("주민등록번호는 필수입니다.")
		return;
	}

//   	주민 유효성
// 	if(check_jumin() ==false){
//         return false;
//       }

	if(!$('input[name="email"]').val()){
		alert("이메일은 필수입니다.")
		return;
	}

	if(!$('input[name="maName"]').val()){
		alert("전공은 필수입니다.")
		return;
	}
	if(!$('input[name="smName"]').val()){
		alert("세부전공은 필수입니다.")
		return;
	}

	if(!$('input[name="otpQr"]').val()){
		swal({
			title : "OTP는 필수입니다.",
			text : "",
			type : "warning"
		})

		return;
	}

// 	 if(!flag){
// 		alert("전화번호 인증은 필수입니다.")
// 		return;
// 	}

// 	 if(!mailflag){
// 		alert("메일 인증은 필수입니다.")
// 		return;
// 	}



	var form = $('#submit');

	form.submit();

}

// 주민번호 유효성 체크
// function check_jumin(){
//     var jumins3 = $("#firstRnum").val() + $("#secondRnum").val();
//     //주민등록번호 생년월일 전달

//     var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
//     var buf = new Array(13);

//     //주민번호 유효성 검사
//     if (!fmt.test(jumins3)) {
//       alert("주민등록번호 형식에 맞게 입력해주세요");
//       $("#firstRnum").focus();
//       return false;
//     }

//     //주민번호 존재 검사
//     for (var i = 0; i < buf.length; i++){
//       buf[i] = parseInt(jumins3.charAt(i));
//     }

//     var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들
//     var sum = 0;

//     for (var i = 0; i < 12; i++){
//     sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서
//   }

//   if ((11 - (sum % 11)) % 10 != buf[12]) {
//     alert("잘못된 주민등록번호 입니다.");
//     $("#firstRnum").focus();
//     return false;
//   }

//   var birthYear = (jumins3.charAt(6) <= "2") ? "19" : "20";
//   birthYear += $("#firstRnum").val().substr(0, 2);
//   var birthMonth = $("#firstRnum").val().substr(2, 2);
//   var birthDate = $("#firstRnum").val().substr(4, 2);
//   var birth = new Date(birthYear, birthMonth, birthDate);


//   $("#year").val(birthYear);
//   $("#month").val(birthMonth);
//   $("#date").val(birthDate);
// }


</script>


</body>

</html>
