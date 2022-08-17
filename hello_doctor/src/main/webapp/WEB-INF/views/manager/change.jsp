<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<style type="text/css">
body {
	padding: 10px;
}

h1 {
	text-align: center;
	font-weight: bold;
}
</style>
<title></title>
</head>
<body>
	<h1 style="color: black; margin-top: 10px;">의료진 상태 변경</h1>

	<hr>
	<div style="text-align: center; color:black;">
		<table style="margin: 0 auto">
			<tr>
				<td><span>성명(전공) : </span></td>
				<td><span id="doctor_name">${doctorvo.dName }(${doctorvo.maName })</span></td>
			</tr>
			<tr>
				<td style="text-align:left;"><span>생년월일 :</span></td>
				<c:set var="res" value="${doctorvo.residentNum }"/>
				<td style="float:left;"><span>${fn:substring(res,0,6)}</span></td>
			</tr>
		</table>
		<div>
			<input hidden="" id="as" value="${doctorvo.accountStatus }" style="margin-bottom:5px;" />
			<!-- 		 checked="checked" -->
			<div class="i-checks i1" style=" padding-top: 10px;">
				<label> <input type="radio" name="a" id="i1"> <i></i>
					재직
				</label>
			</div>
			<div class="i-checks i">
				<label> <input type="radio" name="a" id="jung"> <i></i>
					정직
				</label>
				<table id="input_table" style="margin: 0 auto">
					<tr id="s_date">

					</tr>
					<tr id="e_date">

					</tr>
				</table>
			</div>
			<div class="i-checks i2">
				<label> <input type="radio" name="a" id="a"> <i></i>
					퇴직
				</label>
				<table id="input_table1" style="margin: 0 auto">
					<tr id="s_date1">

					</tr>
					<tr id="e_date1">

					</tr>
				</table>
			</div>
		</div>
		<div>

		<hr>
			<button class="btn btn-success" onclick="go()">상태변경</button>
			<button class="btn btn-info" onclick="CloseWindow()">취소</button>

		</div>
	</div>
	<!-- Mainly scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/hs.js"></script>
	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

	<!-- Data picker -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',

			});

		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			var as = $("#as").val();

			if (as == 1) {
				$(".i1").iCheck('check');
			} else if (as == 2) {
				$(".i").iCheck('check');
				$("#end_date").attr("value", '<fmt:formatDate pattern = "yyyy-MM-dd" value="${doctorvo.susEndDate }"/>');
				$("#start_date").attr("value", '<fmt:formatDate pattern = "yyyy-MM-dd" value="${doctorvo.susStartDate }"/>');
			} else {
				$(".i2").iCheck('check');
				$("#fin_date").attr("value", '<fmt:formatDate pattern = "yyyy-MM-dd" value="${doctorvo.retireDate }"/>');
			}
		})
	</script>
	<script type="text/javascript">
		// 재직
		function go() {
			var d = {
				"dId" : "${doctorvo.dId}"
			}
			swal({
				title : "상태를 재직으로 변경하시겠습니까?",
				text : "",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "확인",
				closeOnConfirm : false
			}, function() {
				$.ajax({
					url : 'work',
					type : "post",
					data : JSON.stringify(d),
					contentType : "application/json",
					success : function() {
						swal("", "재직으로 변경하였습니다.", "success");
						setTimeout(function() {
							window.opener.location.reload();
							window.close();
						}, 1000);
					}
				});
			});
		}

		function calcDate1() {
			var start_date = document.querySelector("#start_date");
			var end_date = document.querySelector("#end_date");
			var no = {
				"susStartDate" : start_date.value,
				"susEndDate" : end_date.value,
				"dId" : "${doctorvo.dId}"
			}
			if (start_date.value > end_date.value) {
				err_date();
			} else if (start_date.value == "" || end_date.value == "") {
				null_date();
			} else {
				swal({
					title : "상태를 정직으로 변경하시겠습니까?",
					text : "",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "확인",
					closeOnConfirm : false
				}, function() {
					$.ajax({
						url : "sus",
						type : "post",
						data : JSON.stringify(no),
						contentType : 'application/json',
						success : function() {
							swal("", "정직으로 변경하였습니다.", "success");
							setTimeout(function() {
								window.opener.location.reload();
								window.close();
							}, 1000);
						}
					});
				});
			}

		}




		function calcDate2() {
			var fin_date = document.querySelector("#fin_date");
			var re = {
				"dId" : "${doctorvo.dId}",
				"retireDate" : fin_date.value
			}
			if (fin_date.value == "") {
				err_date();
			} else {

				swal({
					title : "상태를 퇴직으로 변경하시겠습니까?",
					text : "",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "확인",
					closeOnConfirm : false
				}, function() {
					$.ajax({
						url : "retire",
						type : "post",
						data : JSON.stringify(re),
						contentType : "application/json",
						success : function() {
							swal("", "퇴직으로 변경하였습니다.", "success");
							setTimeout(function() {
								window.opener.location.reload();
								window.close();
							}, 1000);
						}
					});
				});

			}

		}





		function err_date() {
			swal({
				title : "날짜 설정실패",
				text : "종료일은 시작일 이후여야합니다.",
				type : "warning"
			});
		}

		function null_date() {
			swal({
				title : "날짜 설정실패",
				text : "날짜를 설정해주세요.",
				type : "warning"
			});
		}
		function err_date() {
			swal({
				title : "날짜 설정실패",
				text : "퇴직일을 지정해주세요.",
				type : "warning"
			});
		}
	</script>
	<script type="text/javascript">
	$(".i").on("ifChecked", function () { // 정직
	    $("#s_date1").empty();
	    $("#s_date").append("<td>정직 시작일</td><td><div><input type='date' id='start_date' placeholder='07/01/2022'></div></td>");
	    $("#e_date1").empty();
	    $(".c").empty();
	    $("#e_date").append("<td>정직 종료일</td><td><div><input type='date' id='end_date'></div></td>");
	    // $("#input_table").append("<input class='btn btn-success p' type='submit' value='상태변경' onclick='calcDate1()'>");
	    $(".btn-success").removeAttr("onclick");
	    $(".btn-success").attr("onclick", "calcDate1()");
	});
	$(".i1").on("ifChecked", function () { // 재직
	    $("#s_date1").empty();
	    $("#s_date").empty();
	    $("#e_date1").empty();
	    $("#e_date").empty();
	    $(".btn-success").attr("onclick", "go()");
	});
	$(".i2").on("ifChecked", function () { // 퇴직
	    $("#s_date").empty();
	    $("#e_date").empty();
	    $(".p").empty();
	    $("#s_date1").append("<td>퇴직일</td><td><div><input type='date' id='fin_date' placeholder='07/01/2022'></div></td>");
	    $(".btn-success").removeAttr("onclick");
	    $(".btn-success").attr("onclick", "calcDate2()");
	    // $("#input_table").append("<input class='btn btn-success c' type='submit' value='상태변경' onclick='calcDate2()'>");
	});
	</script>

	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
</body>
</html>