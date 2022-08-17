<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- Sweet Alert -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
   <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
     <link href="<%=request.getContextPath()%>/resources/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/dropzone/dropzone.css" rel="stylesheet">
   <link href="<%=request.getContextPath() %>/resources/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="<%=request.getContextPath() %>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

    <script src="<%=request.getContextPath() %>/resources/js/jquery-3.1.1.min.js"></script>

   <!-- icheck -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<style>
body {


   overflow: scroll;
}
.upImg{
	background-repeat: no-repeat;
	background-size: 100% 100%;
	margin-right: 5px;
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
    border: 1px solid gray;
    margin-right: 4%;
    margin-left: 4%;
    width: 92%;
}

.fallback{
    height: 130px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="gray-bg">
   <div style= "text-align: center;" class="row">
      <div class="col-sm-4"><h2 style="float: left; margin-left: 20px;">CaseDiscussion</h2></div>
      <div class="col-sm-4">

      </div>
      <div class="col-sm-4" style="text-align: center; ">
         <button type="button" style="width: 20%; margin:0 auto; margin-top: 7%" class="btn btn-w-m btn-primary" onclick="regist_go()" >등록</button>
         <button type="button" class="btn btn-w-m btn-primary" style="background: #dc5c5c; border-color: #dc5c5c; width: 20%; margin-top: 7%" onclick="history.go(-1)">취소</button>
      </div>
       <div style="width: 150px; display: contents;"></div>
       <div style="width: 150px; display: contents;"></div>
    </div>
    <hr>
    <!-- ------------------------------------------------------------------------------------------------ -->
    <!-- ------------------------------------------------------------------------------------------------ -->
    <!-- ------------------------------------------------------------------------------------------------ -->
   <div class="row-main" style="padding-top: 3%;">
       <div class="col-sm-6" style="display: table-cell; float: left;">
       <label style="width: auto;text-align: end;margin-top: 1%;margin-left: 6%;font-weight: bold;">제목:</label>
       <input type="text" class="form-control" style="float: right; width: 85%;margin-right: 1%;" id="disTitle">
<!--        <input type="text" class="form-control" hidden="hidden" name="dis_date" id="dis_date" value="">  -->
       </div>
       <div class="col-sm-6" style="display: table-cell; float: right;">
       <label class="col-sm-2 col-form-label" style=" display: inline-block; width: 61px; margin-left: 36%;font-weight: bold;">전공:</label>
       <input type="text" class="form-control" readonly  id="sort" style=" float: right; width: 46% ;margin-right: 6%;text-align: center;" value="${doctorLogin.maName }">
       </div>
    </div>

   <div style="margin-left: 4%;margin-top: 4%;">
      <div class="row" style="">
         <div class="col-sm-4" style="padding-top: 8px;"><p style="font-weight: bold;display: inline;">환자성별: </p>
         <div class="i-checks" style="display: inline;"><label class=""> 남<div class="iradio_square-green" style="position: relative;"><input type="radio" value="남" style="position: absolute; opacity: 0;" name="radioTxt"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div></label></div>
               <div class="i-checks" style="display: inline;"><label>여<div class="iradio_square-green" style="position: relative;"><input type="radio" checked="" value="여" style="position: absolute; opacity: 0;" name="radioTxt"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div></label></div>
            </div>
         <div class="col-sm-4"><p style="font-weight: bold;display: inline-block;">환자 분류: </p>
            <div style="display: inline-block;">
<!--                   <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" aria-expanded="false">유아 </button> -->
<!--                   <ul class="dropdown-menu" x-placement="bottom-start" style="position: absolute; top: 35px; left: 0px; will-change: top, left;"> -->
<!--                       <li><a href="#">성인</a></li> -->
<!--                       <li><a href="#">노인</a></li> -->
<!--                       <li><a href="#">임산부</a></li> -->
<!--                   </ul> -->
                  <select id="status" class="form-control" style="width: 180px; margin: 0">
                                <option value="성인" selected="">성인</option>
                                <option value="유아">유아</option>
                                <option value="노인">노인</option>
                                <option value="임산부">임산부</option>
                   </select>
              </div>
         </div>
         <div class="col-sm-4"><p style="font-weight: bold;display: inline;" >부상병: &nbsp;&nbsp;</p>
            <input type="text" class="form-control" placeholder="질병명 입력" style="display: inline;width: 71%;" id="subDName">
         </div>
      </div>

      <div class="row" style="margin-top: 2%;">
            <div class="col-sm-12">
               <p style="font-weight: bold;display: inline;">주상병: </p>
               <input type="text" class="form-control" placeholder="질병명 입력" style="display: inline;width: 91.5%;" id="disDName">
            </div>
         </div>
   </div>
   <div class="form-group" style="margin-bottom: 4%;">
      <label for="content" style="margin-left: 4%; padding-top: 4%;">내 용</label>
      <textarea class="textarea form-control" id="content" rows="20"
         placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
   </div>

<div style="margin-left: 4%; margin-top: -2%">
      <div class="row" style="">
         <div class="col-sm-12" style="padding-top: 8px;">
            <button class="btn btn-success" onclick="uploadfile()">파일추가</button>
         </div>
         <div class="col-sm-12">
         </div>
      </div>

   </div>


   <form action="regist" method="POST" enctype="multipart/form-data" id="dropzoneForm" style=" width: 92%; margin-left: 4%; border: 1px dotted black;">
              <div class="fallback" style="max-height: 150px; max-width: 1000px; overflow-x: scroll; overflow-y:none; display: block;">

          </div>
          <input type="hidden"  name="disTitle">
          <input type="hidden"  value="${doctorLogin.dId }" name="dId">
          <input type="hidden"  name="maName" value="${doctorLogin.maName }">
          <input type="hidden"   name="disSex">
          <input type="hidden"   name="disClass">
          <input type="hidden"   name="subDName">
          <input type="hidden"   name="disDName">
          <input type="hidden"   name="disContent">
      </form>
   <!-- ------------------------------------------------------------------------------------------------ -->
    <!-- ------------------------------------------------------------------------------------------------ -->
    <!-- ------------------------------------------------------------------------------------------------ -->
   <br><br><br><br>



		<!-- Sweet alert -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
   <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

    <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

    <!-- openWindow -->
    <script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

    <script src="<%=request.getContextPath()%>/resources/js/plugins/summernote/summernote-bs4.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/plugins/bs-custom-file/bs-custom-file-input.min.js"></script>
    <!-- DROPZONE -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/dropzone/dropzone.js"></script>


    <script>
        Dropzone.options.dropzoneForm = {
            paramName: "file", // The name that will be used to transfer the file
            maxFilesize: 2, // MB
            addRemoveLinks: true,
            dictDefaultMessage: "<strong>Drop files here or click to upload. </strong></br> (This is just a demo dropzone. Selected files are not actually uploaded.)"
        };

        $(document).ready(function () {
             bsCustomFileInput.init()
           })
    </script>


<script>
$(document).ready(function(){
     $('.i-checks').iCheck({
         checkboxClass: 'icheckbox_square-green',
         radioClass: 'iradio_square-green',
     });
 });


window.onload = function() {
summernote_go($('#content'), '<%=request.getContextPath()%>');
}


function regist_go(){

   $('input[name="disTitle"]').val($('#disTitle').val());
   $('input[name="disSex"]').val($('input[name="radioTxt"]:checked').val());
   $('input[name="disClass"]').val($('#status').val());
   $('input[name="subDName"]').val($('#subDName').val());
   $('input[name="disDName"]').val($('#disDName').val());
   $('input[name="disContent"]').val($('#content').val());

   var form = document.regist;
   var sub = " ";
   if($("input[name='disTitle']").val()==""){
	   swal({
			title : "제목은 필수입니다.",
			text : "",
			type : "info"
		});
      return;
   }else if($("input[name='disDName']").val() == ""){
	   swal({
			title : "주상병은 필수입니다.",
			text : "",
			type : "info"
		});
      return;
   }else if($("input[name='disContent']").val() == ""){
	   swal({
			title : "내용은 필수입니다.",
			text : "",
			type : "info"
		});
      return;
   }else{
      if($("input[name='subDName']").val() == ""){
         $('input[name=subDName]').attr('value',sub);
      }
      swal({
    	  title : "의견을 공유하시겠습니까?",
    	  text : "",
    	  type : "info",
    	  showCancelButton : true,
		  confirmButtonColor : "#DD6855",
		  confirmButtonText : "확인",
		  closeOnConfirm : false
      }, function(){
    	  swal("", "게시글이 정상적으로 등록되었습니다.", "success");
    	  setTimeout(function(){
		   $("#dropzoneForm").submit();
    	  }, 1000);
      });
   }
}
</script>



<script>
  $(document).ready(function(){
      $('.i-checks').iCheck({
          checkboxClass: 'icheckbox_square-green',
          radioClass: 'iradio_square-green',
      });
  });

  $("#file").on('change',function(){
     var fileName = $("#file").val();
     $(".upload-name").val(fileName);
   });


</script>
<script
src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>


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




</body>
</html>