<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Forgot password</title>
	<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="<%=request.getContextPath() %>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">



</head>

<body class="gray-bg">

    <div class="passwordBox animated fadeInDown">
        <div class="row">

            <div class="col-md-12">
                <div class="ibox-content">

                    <h2 class="font-bold">비밀번호 재설정</h2>

                    <p>비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력해 주세요.</p>

                    <div class="row">

                        <div class="col-lg-12">
                            <form class="m-t" role="form" id="submit"action="index.html">
                                <div class="form-group ">
                                    <input type="password" class="form-control passcheck" placeholder="새 비밀번호" style="margin-bottom: 20px;" name="newpass" id="newpass" >
                                    <input type="password" class="form-control passcheck" placeholder="비밀번호 확인" style="margin-bottom: 30px;" name="newpasscheck" id="newpasscheck"  >
                              		<span id="alert-success" style="display: none; position: absolute;margin-top:-25px;">비밀번호가 일치합니다.</span>
    								<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; position: absolute;margin-top:-25px;">비밀번호가 일치하지 않습니다.</span>
                                </div>

                                <button type="button" class="btn btn-primary block full-width m-b" onclick="passmodify()">비밀번호 수정</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr/>
    </div>

 <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>



<script>


//비밀번호 확인
$('.passcheck').focusout(function () {
    var pwd1 = $("#newpass").val();
    var pwd2 = $("#newpasscheck").val();


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


function passmodify(){
     var pass = $('#newpass').val();
     var passId = '${param.dId}'


   var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);

   //비밀번호 공백 확인
   if($("#newpass").val() == ""){
     alert("패스워드에 공백이 있습니다.");
     $("#newpass").focus();
     return false;
   }
   //비밀번호 유효성검사
   if(!getCheck.test($("#newpass").val())){
     alert("비밀번호 형식에 맞게 입력해주세요");
     $("#newpass").val("");
     $("#newpass").focus();
     return false;
   }



    data = {
    		"pass": pass,
    		"passId" :passId
    	}

    	$.ajax({
    		url:"<%=request.getContextPath()%>/mail/passmodify",
    		type:"POST",
    		data :JSON.stringify(data),
    		contentType :'application/json',
    		success :function(res){
    				alert("비밀번호가 수정되었습니다. 로그인 페이지로 이동합니다.");
    				location.href = "<%=request.getContextPath()%>/login/loginForm";
    			},

    		error:function(xhr){
//     				window.close();
    				alert("비밀번호 수정의 오류가 발생했습니다.");
    		}

    	})


}

</script>


</body>

</html>
