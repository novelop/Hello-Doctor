<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
    
<style>



</style>

</head>
<body class="gray-bg">
  <div>	
	<div class="header" style="margin: 5%;">
		<div class="row">
	 		<div class="col-sm-12"><i class="fa fa-user-circle-o" aria-hidden="true" style="font-size: 20px;margin-right: 20px;"></i>
	 			<h3 style="display: contents;font-size: 20px;">사용자</h3>
	 		</div>
	 	</div>
	</div>
 </div>
 <hr>
 <div class="body" style="margin: 5%;">
	<div class="row">
 		<div class="col-sm-12">
 			<h5 style="display: contents;">의견</h5>
 		</div>
 		<div class="col-sm-12">
 			<textarea id="title"name='title_disease' class="form-control" placeholder="내용을 입력하세요"
								style="width: 80%;height: 100px;margin-top: 10px;"></textarea>
 		</div>
 	</div>
 </div>
 
   <div class ="card-tools" style="margin-left: 5%;">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">등 록</button>
  </div>





    
      <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
    
    <!-- openWindow -->
    <script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
    
    
    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    	</script>
   
   
   	
	
	
	
</body>
</html>