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
<style type="text/css">
div {
	margin: 0 auto;
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
}
table{
	border-collapse: separate;
    border-spacing: 0 10px;
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
							${fn:substring(doctorvo.dId,0,5) }**
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
					<c:if test="${!empty iplist}">
						<c:forEach items="${iplist }" var="ipNo" varStatus="status">
							<tr>
								<td class="td">
								 	<span>사용IP</span>
								</td>
								<td>
									${ipNo.ipNo }
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
					<c:if test="${empty iplist}">
						<div style="text-align: center">
						<span style="text-align: center;">ip를 등록해주세요</span>
						</div>
					</c:if>
				<hr>
				<div style="text-align: center;">
					<button class="btn btn-success" onclick="location.href='modifyIpForm?dId=${doctorvo.dId}'">IP수정</button>
					<button class="btn btn-warning" onclick="window.close()">취소</button>
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
	<script type="text/javascript">

	var num = 1;
	var b_class;

	function plus() {
		num++;
		console.log(num);
		$(".ip")
				.append(
						"<label class='col-sm-4'>추가 IP</label><input type='text'class='form_div addIp' name='input_ip"+num+"' onclick='sibal(this)'><a class='ip_a ip_minus' onclick='min(this)'>-</a>");
	}

	function sibal(a){
		b_class = $(a).attr('name');

	}
		function ip_list(a) {

			var db_list_ip = $(a).text();
			var no_ip = $('.input_ip');
			if(no_ip != null){
				plus();

// 				$('input[name=' + b_class + ']').attr('value', db_list_ip);
				$('input[name=input_ip'+num+']').attr('value', db_list_ip);
			}
		}

		function min(a) {
			$(a).prev().prev().remove();
			$(a).prev().remove();
			$(a).remove();
		};

		$(document).ready(function() {

			var db_ip = $(".db_list_ip").text();
			var dbIp = $(".db_list_ip");
			$(".btn-success").on("click", function() {
				var ip_val = $('.addIp');
				var docIp = $(".input_ip");
				var ipNo = [];
				//ip추가 중복 제거
				for(var j = 0; j < ip_val.length; j++){
					ipNo.push(ip_val.eq(j).val());
					if(ipNo.includes(docIp.eq(j).val())){
						swal({
							title : "IP추가 오류",
							text : "중복되는 IP가 있습니다.",
							type : "warning"
						});
						return;
					}
				}
				var ip = {
						"no" : ipNo,
						"dId" : "${doctorvo.dId}"
				}
				for(q = 0; q < docIp.length; q++){
					if(docIp.eq(q).val() == ipNo){
						swal({
							title : "IP가 겹칩니다.",
							text : "IP를 다시 설정해주세요.",
							type : "warning"
						});
						return;
					}
				}
// 				for(r = 0; r < dbIp.length; r++){
// 					if(dbIp.text() != docIp.eq(r).val()){
// 						swal({
// 							title : "존재하지 않는 IP입니다.",
// 							text : "IP를 다시 설정해주세요.",
// 							type : "warning"
// 						});
// 						return;
// 					}
// 				}
				// 추가
						$.ajax({
							url : "ip_add",
							type : "post",
							data : JSON.stringify(ip),
							contentType : "application/json",
							success : function(){

								for(var k = 0; k < ip_val.length; k++){
									var o = $(".addIp").eq(k).val();
									$("#appendIp").prepend('<label class="col-sm-4">사용중인 IP</label><input style="" type="text" class="form_div input_ip" name="ipDoc" onclick="sibal(this)" value=' + o + ' readonly="readonly"><a style="font-weight: bold; font-size: 2.0em; color: red;" onclick="del(this)">x</a>');
								}
								$(".addIp").attr("value","");
								$(".addIp:not(#first)").remove();
								$(".ip_minus").remove();
							}
						});
			});

		});

		function ok() {
			swal({
				title : "IP를 추가하시겠습니까?",
				text : "이름 : 강현수",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "확인",
				closeOnConfirm : false
			}, function() {
				swal("", "IP추가 완료했습니다.", "success");
				setTimeout(function() {
					window.location.reload();
				}, 1000);

			});
		}
		function no() {
			swal({
				title : "사용불가한 IP가 있습니다.",
				text : "사용불가IP : 81.65.35.12",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "확인",
				closeOnConfirm : false
			});
		}
	</script>
	<script type="text/javascript">
	function del(a){
		var ip = $(a).prev().val();
		var no = {
				"ipNo" : ip,
				"dId" : "${doctorvo.dId}"
		}
		$.ajax({
			url : "deleteIp",
			type : "post",
			data : JSON.stringify(no),
			contentType : "application/json",
			success : function(){
				$(a).prev().prev().remove();
				$(a).prev().remove();
				$(a).remove();
			}
		});
	}
	</script>


	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<%-- 	<%@ include file="./reply_js.jsp" %> --%>
</body>
</html>