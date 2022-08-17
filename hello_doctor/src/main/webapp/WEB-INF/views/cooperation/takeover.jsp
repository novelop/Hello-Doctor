<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="coTaskList" value="${coTaskList}"/>
<c:set var ="dId" value="${dId}"/>
<c:set var ="coNo" value="${coNo}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>진료 등록</title>

 <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- FooTable -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">

<!-- icheck -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">

 <!-- Sweet Alert -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body>


<style>
.footable {
    width: 80%;
    margin-left: 88px;
}

.swal2-popup {
  font-size: 1.6rem !important;
  font-family: Georgia, serif;
}

</style>
	<div class="" style="margin-right: 0px; margin-left: 0px;" >






                                </div>

           <div class="row">
                <div class="col-lg-12">




                            <div class="user-button row" style="margin-top: 10px;margin-left: 211px;margin-bottom: 10px;">

                                        <div class="col-md-3" >
                                            <button  type="button" style="background-color: #FF6B1A;color: white;"class="btn btn-default btn-sm btn-block demo3"><i class="fa fa-handshake-o" aria-hidden="true"></i> 인수인계하기</button>
                                        </div>
                                        <div class="col-md-3">
                                        <button type="button" class="btn btn-default btn-sm btn-block" id="cancelBtn"
								onclick="window.close();">닫 기</button>
                                        </div>

                                    </div>

                        <div class="ibox-content">
    <h4 style="margin-left: 210px;">${dName}님에게 인계할 의료를 선택해주세요</h4>

                          <form action = "takeoverRegist.do" role="takeoverRegist" name="takeoverRegist" >
						<input type= "hidden" name="dId" value= "${dId}"/>
                        <input type= "hidden" name="coNo" value= "${coNo}"/>
                            <table class="footable table table-stripped toggle-arrow-tiny">
                                <thead>
                                <tr>

                                    <th data-toggle="true">날짜</th>
                                    <th>진료명</th>
                                    <th data-type="numeric" >인계여부</th>
                                    <th data-hide="all">설명</th>
                                    <th data-hide="all">검사항목</th>


                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${coTaskList}" var="task">
								<tr>
                                    <td>${task.taDate}</td>
                                    <td>${task.taName}</td>
                                    <td style="padding-left: 30px;">
                                    <input value="${task.taNo}" type="checkbox"  class="i-checks" name="taNo" >
                                    </td>
                                    <td>${task.taContent}</td>
                                    <c:if test="${!empty task.subTaskList}">
<td>
<br>
<div style="margin-left: -62px;">
								<c:forEach items="${task.subTaskList}" var="subTask">
                                  <label>검사명:</label>&nbsp;&nbsp;${subTask.subName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <label>검사날짜:</label>&nbsp;&nbsp;${subTask.subDate}
                                    <br>
									</c:forEach>
</div>
</td>
								</c:if>
                                </tr>
                                </c:forEach>

                                </tbody>

                            </table>
</form>
                        </div>

                </div>
            </div>




 <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- FooTable -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/footable/footable.all.min.js"></script>

   <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
  <!-- Sweet alert -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            $('.footable2').footable();

        });

        $(document).ready(function(){
        	console.log("아이체크 되는건가?");
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });

        $('.demo2').click(function(){
            swal({
                title: "Good job!",
                text: "You clicked the button!",
                type: "success"
            });
        });


        $('.demo3').click(function () {
        	swal({
        		title: "선택하신 의료행위를 인계하시겠습니까?" ,
        		text: "다시 되돌릴 수 없습니다!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "인계하기",
                closeOnConfirm: false
        	}, function(){
        		var form = $('form[role=takeoverRegist]');
            	form.submit();

        	});
        });


        window.onload=function(){
        	if('${from}'=='success'){
                swal("인계완료!","","success");
           		setTimeout(function(){
   				self.close();
           		},2000);
               	}
        }






//         function submitForm(){
//         	var form = $('form[role=takeoverRegist]');
//         	form.submit();
//         }



 </script>




</body>
</html>