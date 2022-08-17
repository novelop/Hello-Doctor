<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="replylist" value="${dataMap.replylist }" />
<c:set var="cri" value="${dataMap.pageMaker.command }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="file" value="${map.list }"/>
<c:set var="command" value="${map.command }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.center-orientation .vertical-timeline-icon{
	left : 2%
}
.center-orientation .vertical-timeline-content {
    margin-left: 6%;
    padding: 1.6em;
    width: 94%;
}
</style>

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



<style>
body {
	width: 100%;
	margin: 0px auto;
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

.iradio_square-green.checked {
	margin-left: 5px;
}

.iradio_square-green {
	margin-left: 5px;
}
img{
	width: 50px;
	height: 50px;
}
</style>
<script type="text/javascript">
	if ('${from}' == 'list') {

		url = "/case/detail.do?disNo=${param.disNo}&dId=${param.dId}";
		var renewURL = window.parent.location.href;

		renewURL = renewURL.substring(0, renewURL.indexOf(".do") + 3);

		// 현재 주소 중 .do 뒤 부분이 있다면 날려버린다.

		url = url.replace(/&/g, "amp;");

		renewURL += "?page=" + url;

		// 페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용

		window.parent.history.pushState(url, null, renewURL);
	}
</script>
</head>

<body class="gray-bg" style="background-color: white;">
	<div class="ibox-content" style="">

		<div class="row">
			<div class="col-sm-12 filebox">
				<h3
					style="font-size: 24px; padding: 20px; margin-top: 18px;">${command.disTitle }</h3>
			</div>
		</div>

<!-- 		<div style="padding-left: 20px; padding-right: 20px" class="row"> -->
<!-- 			<div class="col-sm-2" > -->
<%-- 				<img class="rounded-circle" alt="image" src="<%=request.getContextPath()%>/doctor/getPic?dPic=${command.dPic }"> --%>
<%-- 				<h5 style="display: contents;">${command.dName }/${command.maName }</h5> --%>
<!-- 			</div> -->
<!-- 			<div class="col-sm-3" > -->
<!-- 				<i class="fa fa-clock-o" style="width: 2%; margin-left: 14px;"> -->
<%-- 				${command.disDate } --%>

<!-- 				</i> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-3 filebox" > -->
<!-- 				<i class="fa fa-eye" style="width: 2%; margin-left: 17px;"></i> -->
<%-- 				<h5 style="display: contents;">${command.disCnt }</h5> --%>
<!-- 					&nbsp;&nbsp;&nbsp; -->
<!-- 					<button id="heart_btn" class="btn btn-white" onclick="change()" -->
<!-- 						type="button" aria-expanded="false" style="width: 95px;"> -->
<%-- 						<c:if --%>
<%-- 							test="${doctorLogin.dId == recomvo.dId && command.disNo == recomvo.disNo}"> --%>
<!-- 							<i id="heart_change" class="fa fa-heart" -->
<!-- 								style="margin-right: 5%; color: red;"></i>공감 -->
<!-- 						<input type="hidden" value="like" id="like"> -->
<%-- 						</c:if> --%>
<%-- 						<c:if --%>
<%-- 							test="${doctorLogin.dId != recomvo.dId || command.disNo != recomvo.disNo}"> --%>
<!-- 							<i id="heart_change" class="fa fa-heart-o" -->
<!-- 								style="margin-right: 5%; color: red;"></i>공감 -->
<!-- 						<input type="hidden" value="unlike" id="like"> -->
<%-- 						</c:if> --%>


<%-- 						<span id="recomChange">${command.recom }</span> --%>
<!-- 					</button> -->

<!-- 			</div> -->
<%-- 			<c:if test="${doctorLogin.dId == command.dId}"> --%>
<!-- 				<div class="col-sm-3 filebox"> -->
<!-- 					<button class="btn btn-success" onclick="modify_go()" style="margin-left: 43%">수정</button> -->
<!-- 					<button class="btn btn-warning btn-delete">삭제</button> -->
<!-- 				</div> -->
<%-- 			</c:if> --%>
<!-- 		</div> -->
		<div class="row" style="padding-left: 20px; padding-right: 20px;">
			<div class="col-sm-3">
				<img class="rounded-circle" alt="image" src="<%=request.getContextPath()%>/doctor/getPic?dId=${command.dId }">
				&nbsp;<h5 style="display: contents;">${command.dName }/${command.maName }</h5>
			</div>
			<div class="col-sm-5">
				<i class="fa fa-clock-o" style="margin-top: 17px;">
					${command.disDate }
				</i>
				&nbsp;&nbsp;&nbsp;
				<i class="fa fa-eye" style="margin-top: 17px;">
					${command.disCnt }
				</i>
				&nbsp;&nbsp;&nbsp;
				<button id="heart_btn" class="btn btn-white" onclick="change()"
						type="button" aria-expanded="false" style="width: 30%; height: 80%">
						<c:if
							test="${doctorLogin.dId == recomvo.dId && command.disNo == recomvo.disNo}">
							<i id="heart_change" class="fa fa-heart"
								style="margin-right: 5%; color: red;"></i>공감
						<input type="hidden" value="like" id="like">
						</c:if>
						<c:if
							test="${doctorLogin.dId != recomvo.dId || command.disNo != recomvo.disNo}">
							<i id="heart_change" class="fa fa-heart-o"
								style="margin-right: 5%; color: red;"></i>공감
						<input type="hidden" value="unlike" id="like">
						</c:if>


						<span id="recomChange">${command.recom }</span>
					</button>

			</div>
			<div class="col-sm-4" style="padding-top: 7px; text-align: end">
				<c:if test="${doctorLogin.dId == command.dId}">
					<button class="btn btn-success" onclick="modify_go()">수정</button>
					<button class="btn btn-warning btn-delete">삭제</button>
				</c:if>
			</div>
		</div>
		<input type="hidden" value="${command.disNo }" name="disNo" id="disNo">
		<input type="hidden" value="${doctorLogin.dId }" name="dId" id="dId">
		<hr style="width: 94%;">
		<div style="margin-left: 3%; margin-bottom: 3%;">
				<div class="input-group">
			<span style="font-weight: bold; height: 30px;">환자정보</span>
			<c:if test="${!empty file }">
					<div class="col-sm-11 filebox"
						style="padding: 0; text-align: right; height: 30px;">
						첨부파일 <i class="fa fa-file-text" data-toggle="dropdown"
							class="btn btn-white dropdown-toggle" type="button"
							aria-expanded="false" style="font-size: 20px;"></i>
						<ul class="dropdown-menu" x-placement="bottom-start"
							style="position: absolute; top: 35px; left: 63px; will-change: top, left;">
							<c:forEach items="${file }" var="file">

								<li><a href='getFile?disNo=${command.disNo }&disFileNo=${file.disFileNo}'>${file.disFileName}</a></li>
							</c:forEach>
						</ul>
					</div>
			</c:if>
				</div>
			<div class="row">

				<div class="col-sm-2" style="">
					<p style="font-weight: bold; display: inline;">성별:
						${command.disSex }</p>

				</div>
				<div class="col-sm-2">
					<p style="font-weight: bold; display: inline;">환자 분류:
						${command.disClass }</p>
				</div>
				<c:if test="${command.subDName != ' '}">
					<div class="col-sm-8">
						<p style="font-weight: bold; display: inline;">부상병:</p>
						${command.subDName }
					</div>
				</c:if>
			</div>

			<div class="row" style="margin-top: 2%;">
				<div class="col-sm-12">
					<p style="font-weight: bold; display: inline;">주상병:</p>
					${command.disDName }
				</div>
			</div>

		</div>


		<div class="form-group">
			<div style="margin: 0px auto; width: 94%; margin-left: 3%; margin-right: 3%">
				<p style="font-weight: bold; display: inline;"></p>
				<p>${command.disContent }</p>
			</div>

			<div class="col-sm-12" style="padding-left: 86%;">
<!-- 				<div class="input-group-prepend"> -->
<!-- 					<button id="heart_btn" class="btn btn-white" onclick="change()" -->
<!-- 						type="button" aria-expanded="false" style="width: 100px;"> -->
<%-- 						<c:if --%>
<%-- 							test="${doctorLogin.dId == recomvo.dId && command.disNo == recomvo.disNo}"> --%>
<!-- 							<i id="heart_change" class="fa fa-heart" -->
<!-- 								style="margin-right: 5%; color: red;"></i>공감 -->
<!-- 						<input type="hidden" value="like" id="like"> -->
<%-- 						</c:if> --%>
<%-- 						<c:if --%>
<%-- 							test="${doctorLogin.dId != recomvo.dId || command.disNo != recomvo.disNo}"> --%>
<!-- 							<i id="heart_change" class="fa fa-heart-o" -->
<!-- 								style="margin-right: 5%; color: red;"></i>공감 -->
<!-- 						<input type="hidden" value="unlike" id="like"> -->
<%-- 						</c:if> --%>


<%-- 						<h5 style="display: contents;" id="recomChange">${command.recom }</h5> --%>
<!-- 					</button> -->

<!-- 				</div> -->

			</div>
		</div>


	</div>

	<div>
		<br>
	</div>




	<div class="ibox-content" id="ibox-content"
		style="">
		<div class="row" style="padding-top: 1%;">
			<div class="col-sm-6">
				<h5 style="font-size: 20px; margin-left: 2%;">의견</h5>
			</div>
			<div class="col-sm-6 filter">
				<select class="form-control" name="userFilter" style="width: 20%; float: right;" onchange="list_goo(1)">
					<option value="f" ${cri.userFilter eq 'f' ? 'selected' : ''  }>최신순</option>
					<option value="b" ${cri.userFilter eq 'b' ? 'selected' : '' }>추천순</option>
				</select>
			</div>
		</div>


<!-- 		<div class="vertical-timeline-content" -->
<!-- 			style="margin: 5%; margin-top: 35px;"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-sm-6"> -->
<%-- 					<img class="rounded-circle" alt="image" src="<%=request.getContextPath()%>/doctor/getPic?dPic=${doctorLogin.dPic }"> --%>

<%-- 					<h3 style="display: contents; font-size: 14px;">${doctorLogin.dName }/${doctorLogin.maName }</h3> --%>
<!-- 				</div> -->
<!-- 				<div class="col-sm-6"> -->
<!-- 					<button type="button" class="btn btn-primary" id="registBtn" -->
<!-- 						onclick="reply()">등 록</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<form role="form" method="post" action="replyRegist" -->
<!-- 				name="replyRegist"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-sm-12"> -->
<%-- 						<input type="hidden" value="${doctorLogin.dId }" name="dId"> --%>
<%-- 						<input type="hidden" value="${command.disNo }" name="disNo"> --%>
<!-- 						<textarea id="title_disease" name='disContent' -->
<!-- 							class="form-control" placeholder="내용을 입력하세요" -->
<!-- 							style="height: 100px; margin-top: 10px;"></textarea> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</form> -->
<!-- 		</div> -->



		<div id="vertical-timeline repliesDiv"
			class="vertical-container dark-timeline center-orientation">
			<c:if test="${!empty replylist }">
				<c:forEach items="${replylist }" var="rlist" varStatus="status">
					<div class="vertical-timeline-block row">
						<input type="hidden" value="${rlist.dId }" class="rdId">
						<div class="col-sm-1">
							<img class="rounded-circle" alt="image" src="<%=request.getContextPath()%>/doctor/getPic?dId=${rlist.dId }">
						</div>
						<div class="vertical-timeline-content col-sm-11" style="margin:0; ">
							<div class="col-sm-4 filebox" style="float: left; width: 176px;">
								<h4 style="display: contents;">${rlist.dName }/${rlist.maName }</h4>
							</div>
							<div class="col-sm-4 filebox"
								style="float: left; margin-left: -20px; margin-right: 34%">
								<h5 style="display: contents; vertical-align: -7px;">
									<fmt:formatDate value="${rlist.disDate }" pattern="yyyy-MM-dd" />
								</h5>
							</div>
							<div class="col-sm-4"
								style="float: left; display: contents; margin-left: 50%;">
								<c:if test="${rlist.dId eq doctorLogin.dId }">
									<i class="fa fa-pencil"
										style="font-size: 17px; width: 3%; margin-left: %; vertical-align: 3px;"
										onclick="replyModify(this)"></i>
									<i class="fa fa-trash-o"
										style="font-size: 17px; margin-right: 1%; vertical-align: 3px;"
										onclick="deleteReply(this)"></i>
								</c:if>
								<c:if test="${rlist.myClick eq 'N'}">
									<i id="ch${status.count }" class="fa fa-thumbs-o-up"
										onclick="replyLike(this)"
										style="font-size: 20px; width: 11%; margin-bottom: 1%; margin-left:; display: inherit;">
										<h5 style="display: contents; font-size: 16px;">${rlist.recom }</h5>
										<input hidden="" value="${rlist.disRplyNo }">
									</i>
								</c:if>
								<c:if test="${rlist.myClick eq 'Y'}">
									<i id="ch${status.count }" class="fa fa-thumbs-up"
										onclick="replyLike(this)"
										style="font-size: 20px; width: 11%; margin-bottom: 1%; margin-left:; display: inherit;">
										<h5 style="display: contents; font-size: 16px;">${rlist.recom }</h5>
										<input hidden="" value="${rlist.disRplyNo }">
									</i>
								</c:if>
							</div>
							<div class="row">
								<div class="col-sm-12 filebox replyCon">
									<p style="margin-left: 15px;">${rlist.disContent }</p>

									<input hidden="" value="${rlist.disRplyNo }" class="rplyNo">
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>
		<div class="vertical-timeline-content"
			style="margin: 5%; margin-top: 35px;">
			<div class="row">
				<div class="col-sm-6">
					<img class="rounded-circle" alt="image" src="<%=request.getContextPath()%>/doctor/getPic?dId=${doctorLogin.dId }">

					<h3 style="display: contents; font-size: 14px;">${doctorLogin.dName }/${doctorLogin.maName }</h3>
				</div>
				<div class="col-sm-6">
					<button type="button" class="btn btn-primary" id="registBtn"
						onclick="reply()">등 록</button>
				</div>
			</div>
			<form role="form" method="post" action="replyRegist"
				name="replyRegist">
				<div class="row">
					<div class="col-sm-12">
						<input type="hidden" value="${doctorLogin.dId }" name="dId">
						<input type="hidden" value="${command.disNo }" name="disNo">
						<textarea id="title_disease" name='disContent'
							class="form-control" placeholder="내용을 입력하세요"
							style="height: 100px; margin-top: 10px;"></textarea>
					</div>
				</div>
			</form>
		</div>
		<br>
		<%@ include file="/WEB-INF/views/common/replypage.jsp"%>
	</div>

	<form role="form">
		<input type="hidden" name="disNo" value="${command.disNo}">
	</form>




	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>



	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>



	<!-- Peity -->
	<script
		src="<%=request.getContextPath()%>/resources/js/demo/peity-demo.js"></script>


	<!-- BS custom file -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/bs-custom-file/bs-custom-file-input.min.js"></script>

	<!-- Sweet alert -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>



	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>

	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});
	</script>
	<script type="text/javascript">
		function list_goo(page, url) {

			var no = '${command.disNo}';
			var did = '${doctorLogin.dId}';
			if (!url)
				url = "/case/detail.do?disNo=" + no + "&dId=" + did;

			var jobForm = $('#jobForm');
			jobForm.find("[name='page']").val(page);
			var userFilter = jobForm.find("[name='userFilter']")
			.val($('select[name="userFilter"]').val());
			subgoPage(url + "&page=" + page + "&perPageNum=9&userFilter=" + userFilter.val());
		}
	</script>
	<script type="text/javascript">
		function replyModify(a) {
			var reply = $(a).parent($(".col-sm-4"));
			var next = reply.next("div");
			var nextin = next.find('p');
			var con = nextin.text();
			var no = next.find('input').val();
			nextin.remove();
			next.find($(".filebox")).append(
					'<textarea row="10" col="50" style="width: 100%">' + con
							+ '</textarea>');
			$(a).attr("onclick", "confirm(this)");
		}
		function confirm(b) {
			var reply = $(b).parent($(".col-sm-4"));
			var next = reply.next("div");
			var nextin = next.find('textarea');
			var con = nextin.val(); // 게시글 내용
			if (con == "") {
				alert("댓글 내용을 입력해주세요");
				return;
			}
			var no = next.find('input').val(); // 게시글 번호
			var re = {
				"disRplyNo" : no,
				"disContent" : con
			}
			$.ajax({
				url : "updateReply",
				type : "POST",
				data : JSON.stringify(re),
				contentType : 'application/json',
				success : function() {
					alert("수정성공.");
					nextin.replaceWith("<p style='margin-left: 15px;'>" + con
							+ "</p>");
					$(b).attr("onclick", "replyModify(this)");
				}
			})
		}
	</script>
	<script type="text/javascript">
		function deleteReply(a) {
			var reply = $(a).parent($(".col-sm-4"));
			var next = reply.next("div");
			var disRplyNo = next.find('input').val(); // 게시글 번호
			var no = {
				"disRplyNo" : disRplyNo
			}
			swal({
				title : "댓글을 삭제하시겠습니까?",
				text : "삭제시 복구 불가합니다.",
				type : "warning",
				showCancelButton: true,
			    confirmButtonColor: "#DD6B55",
			    confirmButtonText: "확인",
			    closeOnConfirm: false
			}, function(){
				$.ajax({
					url : "deleteReply",
					type : "post",
					data : JSON.stringify(no),
					contentType : 'application/json',
					success : function() {
						var er = reply.parent($(".vertical-timeline-content"));
						var e = er.parent($(".vertical-timeline-block"));
						var ern = er.prev("div");
						e.remove();
						er.remove();
						ern.remove();
						swal({
							title : "댓글이 정상적으로 삭제되었습니다.",
							type : "success"
						});
					}
				});

			});
		}
	</script>


	<script type="text/javascript">
		function reply() {
			if ($("textarea[name='disContent']").val() == "") {
				swal({
					title : "댓글 내용을 입력해주세요!",
					text : "",
					type : "info"
				})
				return;
			}
			$("form[name='replyRegist']").submit();
			window.reload();
		}
	</script>
	<script type="text/javascript">

	// 		var disNo = $("#disNo").val();
// 		var no = {
// 			"disNo" : disNo
// 		}
// 		$(".btn-delete").on("click", function() {
// 			swal({
// 				title : "정말로 삭제하시겠습니까?",
// 				text : "삭제시 복구 불가합니다.",
// 				type : "warning",
// 				showCancelButton : true,
// 				confirmButtonColor : "#DD6B55",
// 				confirmButtonText : "확인",
// 				closeOnConfirm : false
// 			}, function(){
// 				$.ajax({
// 					url : "delete",
// 					type : "POST",
// 					data : JSON.stringify(no),
// 					contentType : 'application/json',
// 					success : function() {
// 						swal("", "게시글이 정상적으로 삭제되었습니다.", "success");
// 						setTimeout(function(){

// 						}, 1000);
// 					}
// 				});
// 			});

// 		});

		$(".btn-delete").on("click", function(){
			swal({
				title : "정말로 삭제하시겠습니까?",
				text : "삭제시 복구 불가합니다.",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6855",
				confirmButtonText : "확인",
				closeOnConfirm : false
			}, function(){
				swal("", "게시글이 정상적으로 삭제되었습니다.", "success");
				setTimeout(function(){
					location.href = "delete?disNo=${command.disNo}";
				}, 1000);
			});
		});
	</script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#radioButton').click(function() {
				// getter
				var radioVal = $('input[name="radioTxt"]:checked').val();

			});

			$('#radioButton2').click(function() {
				// setter
				// 선택한 부분을 세팅할 수 있다.
				$('input[name="radioTxt"]').val([ 'Banana' ]);
			});
		});
	</script>


	<script>
		$(document).ready(function() {

			// Local script for demo purpose only
			$('#lightVersion').click(function(event) {
				event.preventDefault()
				$('#ibox-content').removeClass('ibox-content');
				$('#vertical-timeline').removeClass('dark-timeline');
				$('#vertical-timeline').addClass('light-timeline');
			});

			$('#darkVersion').click(function(event) {
				event.preventDefault()
				$('#ibox-content').addClass('ibox-content');
				$('#vertical-timeline').removeClass('light-timeline');
				$('#vertical-timeline').addClass('dark-timeline');
			});

			$('#leftVersion').click(function(event) {
				event.preventDefault()
				$('#vertical-timeline').toggleClass('center-orientation');
			});

		});
	</script>
	<script type="text/javascript">
		function replyLike(a) {
			var disRplyNo = $(a).find('input').val();
			var num = parseInt($(a).find("h5").text());
			var minus = num - 1;
			var plus = num + 1;

			var no = {
				"disRplyNo" : disRplyNo
			}
			if ($(a).attr("class") == "fa fa-thumbs-o-up") {
				$.ajax({
					url : "replyLikeUp",
					type : "post",
					data : JSON.stringify(no),
					contentType : 'application/json',
					success : function() {
						$(a).attr("class", "fa fa-thumbs-up");
						$(a).find("h5").text(plus);
					}
				});
			}
			if ($(a).attr("class") == "fa fa-thumbs-up") {
				$.ajax({
					url : "replyLikeDown",
					type : "post",
					data : JSON.stringify(no),
					contentType : 'application/json',
					success : function() {
						$(a).attr("class", "fa fa-thumbs-o-up");
						$(a).find("h5").text(minus);
					}
				});
			}
		}
	</script>
	<script type="text/javascript">
		var disNo = $("#disNo").val();
		var dId = $("#dId").val();
		var recomvo = {
			"disNo" : disNo,
			"dId" : dId
		}

		function change() {
			var like = $("#like").val();
			var recomChange = parseInt($("#recomChange").text());
			var minus = recomChange - 1;
			var plus = recomChange + 1;
			if (like == "unlike") {
				$.ajax({
					url : 'likeUp',
					type : 'POST',
					data : JSON.stringify(recomvo),
					contentType : 'application/json',
					success : function() {
						$("#heart_btn #heart_change").attr("class",
								"fa fa-heart").css("color", "red");
						$("#like").attr("value", "like");
						$("#recomChange").text(plus);
					}
				});
			}
			if (like == "like") {
				$.ajax({
					url : 'likeDown',
					type : 'POST',
					data : JSON.stringify(recomvo),
					contentType : 'application/json',
					success : function() {
						$("#heart_btn #heart_change").attr("class",
								"fa fa-heart-o");
						$("#like").attr("value", "unlike");
						$("#recomChange").text(minus);
					}
				});
			}

		}
	</script>




	<script>
		$(document).ready(function() {
			bsCustomFileInput.init()
		});
	</script>

	<script>
		function modify_go() {
			var formObj = $("form[role='form']");
			formObj.attr({
				'action' : 'modifyForm.do',
				'method' : 'post'
			});

			// HTML5지원브라우저에서 사용가능

			if (typeof (history.pushState) == "function") {

				// 현재 주소를 가져온다.

				var renewURL = window.parent.location.href;

				renewURL = renewURL.substring(0, renewURL.indexOf(".do") + 3);

				// 현재 주소 중 .do 뒤 부분이 있다면 날려버린다.

				url = "/case/modifyForm.do?disNo=${command.disNo }";

				renewURL += "?page=" + url;

				// 페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용

				window.parent.history.pushState(url, null, renewURL);

			}
			formObj.submit();
		}
	</script>



</body>
</html>