<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Sweet Alert -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css"
	rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
body {
	width: 100%;
	margin: 0px auto;
}
.upImg{
	background-repeat: no-repeat;
	background-size:100% 100%;
	margin-right: 5px;
}
h1 {
	font-weight: bold;
	font-size: 20px;
	text-align: center;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.note-editor.note-frame {
	margin-left: 6%;
	margin-right: 6%;
}
</style>

</head>
<body class="gray-bg" style="background-color: white;">

<!-- 	<form role="form" method="post" action="modify" name="modify"> -->
		<div class="ibox-content">
			<div class="row">
				<div class="col-sm-12 filebox" style="display: contents;">
					<input type="text" class="form-control"
						style="width: 65%; margin-left: 7%; margin-bottom: 2%; margin-top: 2%; height: 45px;"
						value="${casevo.disTitle }" name="disTitle" id="disTitle">
				</div>
			</div>
			<div style="margin-left: 6%;">

				<div class="col-sm-3 filebox" style="display: contents;">
					<i class="fa fa-user-circle-o"
						style="margin-right: 4px; font-size: 20px;" aria-hidden="true"></i>
					<h5 style="display: contents;">${casevo.dName }/${casevo.maName }</h5>
				</div>
				<div class="col-sm-3 filebox" style="display: contents;">
					<i class="fa fa-clock-o" style="width: 2%; margin-left: 14px;"></i>
					<h5 style="display: contents;">${casevo.disDate }</h5>
				</div>
				<div class="col-sm-3 filebox" style="display: contents;">
					<i class="fa fa-eye" style="width: 2%; margin-left: 17px;"></i>
					<h5 style="display: contents;">${casevo.disCnt }</h5>
				</div>
				<div class="col-sm-3 filebox" style="display: contents;">
					<div class="col-sm-6 filebox" style="display: contents;">
						<button type="button" class="btn btn-w-m btn-primary"
							style="margin-left: 43%;" onclick="modify_go();">완료</button>
					</div>
					<div class="col-sm-6 filebox" style="display: contents;">
						<button type="button" class="btn btn-w-m btn-primary btn-delete"
							style="background: coral; border-color: coral; margin-left: 2%;">취소</button>
					</div>
				</div>
			</div>

			<hr style="width: 94%;">

			<div style="margin-left: 7.5%; margin-bottom: 3%;">
				<h5 style="font-size: 15px;">환자 정보</h5>
				<div class="row">
					<div class="col-sm-2" style="padding-top: 8px;">
						<p style="font-weight: bold; display: inline;">성별:</p>
						<input hidden="" id="disSex" value="${casevo.disSex }">
						<div class="i-checks" style="display: inline;">
							<label> 남<input type="radio" value="남" name="disSex"
								id="man"></label>
						</div>
						<div class="i-checks" style="display: inline;">
							<label>여<input type="radio" value="여" name="disSex"
								id="woman"></label>
						</div>
					</div>
					<div class="col-sm-3">
						<p style="font-weight: bold; display: inline;">환자 분류:</p>
						<input hidden="" id="disClass" value=${casevo.disClass }>
						<div style="display: inline-block;">
							<select id="status" class="form-control"
								style="width: 100%; margin: 0" name="disClass" id="disClass">
								<option value="성인">성인</option>
								<option value="유아">유아</option>
								<option value="노인">노인</option>
								<option value="임산부">임산부</option>
							</select>
						</div>
					</div>
					<div class="col-sm-7">
						<p style="font-weight: bold; display: inline;">부상병:</p>
						<input type="text" class="form-control"
							style="display: inline; width: 83%;" value="${casevo.subDName }"
							name="subDName" id="subDName">
					</div>
				</div>

				<div class="row" style="margin-top: 2%;">
					<div class="col-sm-12">
						<p style="font-weight: bold; display: inline;">주상병:</p>
						<input type="text" class="form-control" placeholder="질병명 입력"
							style="display: inline; width: 90.5%;"
							value="${casevo.disDName }" name="disDName" id="disDName">
					</div>
				</div>

			</div>

			<input hidden="" name="disNo" value="${casevo.disNo }" id="disNo">
			<div class="form-group">
				<textarea class="textarea" id="content" rows="20"
					style="display: none;" name="disContent">
			 ${casevo.disContent }
			</textarea>
			</div>
			<div style="margin-left: 4%; margin-top: -2%">
				<div class="row" style="">
					<div class="col-sm-12" style="padding-top: 8px;">
						<button class="btn btn-warning" onclick="uploadfile()">파일추가</button>
					</div>
					<div class="col-sm-12"></div>
				</div>

			</div>
		<form action="modify" method="POST" enctype="multipart/form-data" id="dropzoneForm" style=" width: 92%; margin-left: 4%; border: 1px dotted black; height: 150px;">
              <div class="fallback" style="max-height: 150px; max-width: 1000px;  overflow-y:none; display: contents;">
				<c:if test="${!empty list }">
				<c:forEach items="${list }" var="list" varStatus="status">

					<input type="hidden" value="${list.disFileNo }" class="disFileNo">
					<input type="hidden" value="${list.disNo }" class="disNo">
					<div class="upImg" style="float:left;width: 20%; height: 100%; background-image: url('getPic?disNo=${list.disNo}&disFileNo=${list.disFileNo}')">
						<button type="button" class="close" id="${list.disFileName }" onclick="imgClose(this)">x</button>
					</div>
					<input value="${list.disFileName}" type="hidden" class="attach">

				</c:forEach>
			</c:if>
          </div>
          <input type="hidden"  name="disTitle">
          <input type="hidden"  value="${doctorLogin.dId }" name="dId">
          <input type="hidden"  name="maName" value="${doctorLogin.maName }">
          <input type="hidden"   name="disSex">
          <input type="hidden"   name="disClass">
          <input type="hidden"   name="subDName">
          <input type="hidden"   name="disDName">
          <input type="hidden" name="disNo" value="${casevo.disNo }">
          <input type="hidden"   name="disContent">

      </form>
		</div>
<!-- 	</form> -->



	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/summernote/summernote-bs4.js"></script>

		<!-- Sweet alert -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>



	<script type="text/x-handlebars-template" id="fileupload">

<div class="file text{{filenum}}" style="width: 20%; height: 100%;float:left">
                                    <a style="max-width:100%; text-align:center;">
                                        <span class="corner"></span>

                                        <div class="icon" >
                                            <i class="fa fa-file" ></i>
<button type="button" class="close text{{filenum}}" aria-label="Close" style="float: right" onclick="fileremove(this)">
      <span aria-hidden="true" class="closebutton">×</span>
   </button>
                                        </div>
                                        <div class="file-name">
                                           {{filename}}
                                        </div>
                                    </a>

                                </div>


</script>

<script>

filenum = 1;

   function uploadfile(){

      var str = "<input type='file' class='form-control inputfile filenum"+filenum+"' style='display:none' name='file'>";

      $('#dropzoneForm').append(str);
        $('.filenum'+filenum).trigger('click');
   }
 $(document).on("change",".inputfile", function() {

var file = $(this);
console.log(file)
var fileFormat = file.val().substr(file.val().lastIndexOf(".")+1).toUpperCase();
if((fileFormat=="JPG" || fileFormat=="JPEG"  || fileFormat=="PNG")){
    var reader = new FileReader();

     reader.onload = function(e) {
      var result = reader.result
    $(".fallback").append("<div class='upImg uploadimg file"+filenum+"' style='background-image:url("+ result+"); width:20%; height:100%; float:left;' > <button type='button' class='close file"+filenum+"' aria-label='Close'  onclick='fileremove(this)'><span aria-hidden='true' class='closebutton'>×</span></button><div> ");
        filenum = filenum +1 ;
  }
   reader.readAsDataURL(file[0].files[0]);
}else{

    filename = file[0].files[0].name;
   result = {"filename" : filename,
            "filenum":filenum};

   printData(result, $('.fallback'),$('#fileupload'))
     filenum = filenum +1 ;

}


});
 function printData(dataArr,target,templateObject,removeClass){

      var template=Handlebars.compile(templateObject.html());

      var html = template(dataArr);

      $(removeClass).remove();

      target.append(html);

   }

 function fileremove(e){
    remove = $(e);
    console.log(remove)
   className = remove.removeClass('close')
   className = remove.attr("class");

    console.log(className)
      $("."+className).remove();
}

</script>


	<script>
    $(document).ready(function(){

        $('.summernote').summernote();

   });
</script>

	<script type="text/javascript">
function modify_go(){
	$('input[name="disTitle"]').val($('#disTitle').val());
	   $('input[name="disSex"]').val($('input[name="disSex"]:checked').val());
	   $('input[name="disClass"]').val($('#status').val());
	   $('input[name="subDName"]').val($('#subDName').val());
	   $('input[name="disDName"]').val($('#disDName').val());
	   $('input[name="disContent"]').val($('#content').val());
	var form = document.modify;
	var sub = " ";
	if($("input[name='disTitle']").val()==""){
		alert("제목은 필수입니다.");
		return;
	}else if($("input[name='disDName']").val() == ""){
		alert("주상병은 필수입니다.");
		return;
	}else{
		if($("input[name='subDName']").val() == ""){
			$('input[name=subDName]').attr('value','654');
		}
		swal({
			title : "내용을 수정하시겠습니까?",
			text : "",
			type : "info",
			showCancelButton : true,
			confirmButtonColor : "#DD6855",
			confirmButtonText : "확인",
			closeOnConfirm : false
		}, function(){
			swal("", "게시글이 정상적으로 수정되었습니다.", "success");
			setTimeout(function(){
				$("#dropzoneForm").submit();
			}, 1000);
		});


	}
}
</script>
<script type="text/javascript">
function imgClose(a){
	var imgName = $(a).attr("id");
	$("form").append("<input name='disFileName' type='hidden' value=" + imgName+ ">");
	$(a).parent().remove();
	$(a).remove();

}

</script>

	<script>
window.onload = function() {
summernote_go($('#content'), '<%=request.getContextPath()%>');
}

</script>


	<script>
$(document).ready(function () {
    bsCustomFileInput.init()
})

$(document).ready(function(){
	var dis_sex = $("#disSex").val();
	var man = $("#man").val();
	var woman = $("#woman").val();

	if(dis_sex == man){
		$('#man').attr('checked', true);
	}else{
		$('#woman').attr('checked', true);
	}
});

$(document).ready(function(){
	var dis_class = $("#disClass").val();
	$("#status").val(dis_class).prop('selected', true);
});

</script>


	<script>
$('.btn-delete').click(function () {
    swal({
        title: "정말 삭제 하시겠습니까?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "확인",
        closeOnConfirm: false
    }, function () {
        swal("", "삭제 했습니다.", "success");
        setTimeout(function(){
           window.location.reload();
        },1000);

    });

});

</script>


	<script>
window.onload = function() {
summernote_go($('#content'), '<%=request.getContextPath()%>
		');
		}
	</script>

	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});
	</script>

</body>
</html>

