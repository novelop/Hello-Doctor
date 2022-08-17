<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ip" value="${dataMap.list }"></c:set>
<c:set var="pageMaker" value="${dataMap.pageMaker }"></c:set>
<c:set var="cri" value="${dataMap.pageMaker.ipCommand }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<title>IP등록</title>
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
	href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<!-- Sweet Alert -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<style type="text/css">
div {
	margin: 0 auto;
}
.inputIp{
	background-color: #FFFFFF;
    background-image: none;
    border: 1px solid #e5e6e7;
    border-radius: 1px;
    color: inherit;
    padding: 6px 12px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
    width: 50%;
}
input[type='text'], .sel, .form_div{
	background-color: #FFFFFF;
	background-image: none;
	border: 1px solid #e5e6e7;
	border-radius: 1px;
	color: inherit;
	padding: 6px 12px;
	transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s
		ease-in-out 0s;
}


.ip_a {
	font-size: 2.0em;
	font-weight: bold;
	margin-left: 5px;
	text-align: center;
}
.ip_table_div{
	border-right: 1px solid gray;
}
.td{
	text-align: center;
	width: 100px;
}
.span{
	font-weight: bold;
	font-size: 1.5em;
	cursor: pointer;
}
table{
	border-collapse: separate;
    border-spacing: 0 10px;
}
.btn-danger, .btn-info, .btn-warning, .btn-success{
	width: 40px;
    padding: 3px;
    width: 60px
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>IP manager</h2>
				<hr>
				<table style="width: 100%">
					<tr>
						<td class="td">
						 	<span>이름</span>
						</td>
						<td>
							${doctorvo.dName }
						</td>
					</tr>
					<tr>
						<td class="td">
						 	<span>아이디</span>
						</td>
						<td>
							${doctorvo.dId }
						</td>
					</tr>
					<tr>
						<td class="td">
						 	<span>TEL</span>
						</td>
						<td>
							${fn:substring(doctorvo.tel,0,9) }XXXX
						</td>
					</tr>
					<tr>
						<td class="td">
						 	<span>연구실</span>
						</td>
						<td>
							${doctorvo.dOffice }
						</td>
					</tr>
					<tr>
						<td class="td">
						 	<span>진료실</span>
						</td>
						<td>
							${doctorvo.dExam }
						</td>
					</tr>
					<c:choose>
						<c:when test="${!empty iplist }">
							<c:forEach items="${iplist }" var="iplist" varStatus="status">
								<tr class="trlength d">
									<td class="td">
										<span>IP</span>
									</td>
									<td>
										<input value="${iplist.ipNo }" name="i${status.count }" class="inputIp">
<!-- 										<span style="font-weight: bold; color: red; cursor: pointer;" onclick="deleteIp(this)">X</span> -->
										<button onclick='deleteIp(this)' class='btn btn-danger' style='width: 40px; padding: 6px'>삭제</button>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="d noneIp">
								<td class="td">
									<span>IP</span>
								</td>
								<td class="plus">
									<input name="i1" class="inputIp">
<!-- 									<span style="font-weight: bold; color:black; font-size: 1.5em; cursor: pointer;" onclick="plus()" class="plus">+</span> -->
									<button onclick='plus()' class='plus btn btn-info' style='width: 40px; padding: 6px'>추가</button>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
				<form action="modifyIp" method="post" id="modifyIp">
					<input type="hidden" name="ipNo2" id="ipNo1">
					<input type="hidden" name="ipNo2" id="ipNo2">
					<input type="hidden" name="dId" value="${doctorvo.dId }">
				</form>
				<hr>
				<div style="text-align: center;">
					<button class="btn btn-success" onclick="regist_go()">등록</button>
					<button class="btn btn-warning" onclick="window.close()" >취소</button>
				</div>
			</div>

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

	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
		<!-- Sweet alert -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		if($(".trlength").length == 1){
// 			$("input[name='i1']").after("<span class='span plus' onclick='plus()'> +</span>");
			$("input[name='i1']").after("<button onclick='plus()' class='plus btn btn-info' style='width: 40px; padding: 6px'>추가</button>");
			$(".btn-success").attr("onclick", "registOne()");
// 			$("#modifyIp").attr("action", "modifyOne");
			$("#modifyIp").find("#ipNo2").remove();
		}
		if($('.noneIp').length == 1){
			$(".btn-success").attr("onclick", "registOne()");
// 			$("#modifyIp").attr("action", "modifyOne");
			$("#modifyIp").find("#ipNo2").remove();
		}

// 		if($(".trlength").length == 1){

// 		}
	});

	function deleteIp(d){
		var dip = $(d).siblings(".inputIp").val();
			var no = {"ipNo" : dip,
 				"dId" : "${doctorvo.dId}"

		}
		swal({
			title : "IP를 삭제하시겠습니까?",
			text : "",
			type : "warning",
			showCancelButton: true,
		    confirmButtonColor: "#DD6B55",
		    confirmButtonText: "확인",
		    closeOnConfirm: false
		}, function(){
			$.ajax({
				url : "deleteIp",
				type : "post",
				data : JSON.stringify(no),
				contentType : 'application/json',
				success : function(){
					swal("", "IP가 삭제되었습니다.", "success");
					if($(".inputIp").length == 2){
						$(d).parents(".d").remove();
// 						$(".inputIp").after("<span class='span plus' onclick='plus()'> +</span>");
						$(".inputIp").after("<button onclick='plus()' class='plus btn btn-info' style='width: 40px; padding: 6px'>추가</button>");
					}else if($(".inputIp").length == 1){
						$(d).siblings(".inputIp").attr("value", "");
					}
				}
			});
		});

	}

	function plusAlert(){
		swal({
			title : "IP추가 불가",
			text : "최대 2개까지 가능합니다.",
			type : "warning"
		});
	}
	function plus(){
		
// 		$(".d").after("<tr class='plustr'><td class='td'><span>IP</span></td><td><input name='i2' class='inputIp'><span class='span' onclick='minus()'> -</span></td></tr>")
		$(".d").after("<tr class='plustr'><td class='td'><span>IP</span></td><td><input name='i2' class='inputIp'><button class='btn btn-warning' onclick='minus()' style='width: 40px; padding: 6px'>제거</button></td></tr>")
		setTimeout(function(){

			$(".plus").attr("onclick", "plusAlert()");
			$(".btn-success").attr("onclick", "regist_go()");
// 			$("#modifyIp").attr("action", "modifyIp");
			$("#ipNo1").after("<input type='hidden' name='ipNo2' id='ipNo2'>");

		}, 1);

	}
	function minus(){
		$(".plustr").empty();
		$(".plus").attr("onclick", "plus()");
		$(".btn-success").attr("onclick", "registOne()");
// 		$("#modifyIp").attr("action", "modifyOne");
		$("#modifyIp").find("#ipNo2").remove();

	}
	</script>

	<script type="text/javascript">
		var dbIp = [];
		var dbId = [];
		var ipCheck =  /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
		<c:if test="${!empty overIp }">
		<c:forEach items="${overIp }" var="oIp">
			dbIp.push("${oIp.ipNo}");
			dbId.push("${oIp.dId}");
		</c:forEach>
		</c:if>

	function registOne(){
		var ipOne = $("input[name=i1]").val();
		if(!ipCheck.test(ipOne)){
			swal({
				title : ipOne,
				text : "IP형식 오류 입니다.",
				type : "warning"
			});
			return;
		}else if(ipCheck.test(ipOne)){

			for(var i = 0; i < dbIp.length; i++){
				if(dbIp[i] == ipOne){
					swal({
						title : ipOne,
						text: "중복IP입니다.",
						type : "warning"
					});
					return;
				}
			}

			swal({
				title : "IP를 등록하시겠습니까?",
				text : "",
				type : 'info',
				showCancelButton : true,
				confirmButtonColor : "#DD6855",
				confirmButtonText : "확인",
				closeOnConfirm : false
			}, function(){
				var i = $("#modifyIp").find("#ipNo1").val(ipOne);
				$("#modifyIp").submit();

			});
		}
	}

	function regist_go(){
		var ip1 = $("input[name=i1]").val();
		var ip2 = $("input[name=i2]").val();

		if(!ipCheck.test(ip1)){
			swal({
				title : ip1,
				text : "IP형식 오류 입니다.",
				type : "warning"
			});
			return;
		}else if(!ipCheck.test(ip2)){
			swal({
				title : ip2,
				text : "IP형식 오류 입니다.",
				type : "warning"
			});
			return;
		}else if(ip1 == ip2){
			swal({
				title : "IP중복 등록",
				text : "같은 IP를 등록할 수 없습니다.",
				type : "warning"
			});
		}else if(ipCheck.test(ip1) && ipCheck.test(ip2)){
			for(var i = 0; i < dbIp.length; i++){
				if(dbIp[i] == ip1){
					swal({
						title : ip1,
						text: "중복IP입니다.",
						type : "warning"
					});
					return;
				}else if(dbIp[i] == ip2){
					swal({
						title : ip2,
						text: "중복IP입니다.",
						type : "warning"
					});
				return;
				}
			}
			swal({
				title : "IP를 등록하시겠습니까?",
				text : "",
				type : 'info',
				showCancelButton : true,
				confirmButtonColor : "#DD6855",
				confirmButtonText : "확인",
				closeOnConfirm : false
			}, function(){
				var i = $("#modifyIp").find("#ipNo1").val(ip1);
				var i1 = $("#modifyIp").find("#ipNo2").val(ip2);
				$("#modifyIp").submit();
			});
		}
	}


	</script>

	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<%-- 	<%@ include file="./reply_js.jsp" %> --%>
</body>
</html>