<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="coopermainList" value="${dataMap.coopermainList}" />


<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
<style>
.col-8 {
	max-width: 100%;
}

.img-responsive {
	width: 20px;
	height: 20px;
	object-fit: cover;
}

#pagediv {
	position: absolute;
	margin: -150px 0px 0px -200px;
	top: 108%;
	left: 57%;
	padding: 3px;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

.contact-box {
	width: 295px;
	padding: 13px;
    margin-bottom: 13px;
}


h3{
	color:black;
}
p {
	color:black;
	font-size: 12px;
	margin-top: 0;
	margin-bottom: 0.5rem;
}
strong{
	font-size:14px;
}
</style>

</head>

<body>
	<h2 style="color:black;">전체협진</h2>
	<hr style="background-color:black;">

<div class="col-sm-12" style="margin-bottom: -30px;">
	<input style="display: inline; white-space: nowrap; zoom: 1.3; vertical-align: text-top;" type="checkbox" id="chk_select"> <label for="chk_select" style="font-size: 1.1em;">내 전공</label>&emsp;
	<input
					style="display: inline; white-space: nowrap; zoom: 1.3; vertical-align: -2px; font-size: 1.3em;"
					type="checkbox" id="mineCheck" value="Y"
					${cri.mineCheck eq 'Y' ? 'checked' : ''}> <label for="a"
					style="font-size: 1.1em;">참여중인 협진</label>

	<a onclick="goPage_1()" class="atag" style="font-size: 1.1em;margin-left:565px;">진행중</a>&nbsp;&nbsp;|
	<a onclick="goPage_2()" class="atag" style="font-size: 1.1em; ">완료</a>&nbsp;&nbsp;

	<select class="form-control" name="searchType" style="height: 31px; width: 95px; text-align: center; font-size: 1em; display: inline-block;" name="searhlist" id="searchType">
		<!-- 		<option disabled selected>검색</option> -->
		<option value="cwt" ${cri.searchType eq 'cwt' ? 'selected':'' }>검색</option>
		<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>진단명</option>
		<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>주치의</option>
		<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>환자명</option>
	</select>


	<input class="form-control"  name="keyword" style="display: inline-block; height: 31px; width: 170px;" type="text" name="keyword" value="${param.keyword }" /> &nbsp;&nbsp;
	<i style="font-size: 1.5em;" class="fa fa-search" onclick="coworklist_go(1)"></i>
</div>
	<br>
	<br>

	<div id="all-wrapper">
		<div id="inner-wrapper">
			<div class="row">
				<c:forEach items="${coopermainList}" var="coopermain">
					<div class="col-lg-3" style="padding-left: 0px;">
						<div class="contact-box demo3" style="box-shadow: 1px 1px 1px 1px darkkhaki; height: 165px;" onclick="cooperationDetail('${coopermain.coopermain.coRelease}','${coopermain.coopermain.coNo}')">
							<div class="col-8">
								<div class="col-sm-10" style="float:left; margin-left: -15px;">
									<h3>
										<strong>협진시작일&nbsp;&nbsp;${coopermain.coopermain.coStartDate}</strong><br>
										<c:if test="${coopermain.coopermain.coIngStatus eq '2'}">
										<strong>협진종료일&nbsp;&nbsp;${coopermain.coopermain.endDate}</strong>
										</c:if>
									</h3>
								</div>


								<div class="col-sm-2" style="float:right; max-width: 21%; padding-left:35px; height: 54px;">
									<h3 style="height: 46px;">
											<c:if test="${coopermain.coopermain.coRelease eq '비공개'}">
												<i style="font-size: 1.8em; color: rgb(26, 179, 148); " class="fa fa-lock"></i>
											</c:if>
											<c:if test="${coopermain.coopermain.coRelease eq '공개'}">
												<i style="font-size: 1.8em; color: rgb(26, 179, 148);" class="fa fa-unlock"></i>
											</c:if>
									</h3>
								</div>

								<div>
								<p>환자명 &emsp;${coopermain.coopermain.pName}</p>
								<p>주상병 &emsp;${coopermain.coopermain.coDisease}</p>
								<p>주치의 &emsp; ${coopermain.coopermain.dName} ${coopermain.coopermain.maName}
								<img alt="프로필" class="rounded-circle" src="<%=request.getContextPath()%>/doctor/getPic?dId=${coopermain.coopermain.dId}" style="display: inline-block; margin-left:10px;width: 35px; height: 35px; text-align: left; vertical-align: -21px;">
								</p>
<!-- 								<p>의료진 &emsp;</p> -->
<!-- 								<div class="doctors"> -->
<%-- 									<c:forEach items="${coopermain.doctors}" var="doctors"> --%>
<%-- 									 ${doctors.dName} | ${doctors.maName}&emsp; --%>
<%-- 								</c:forEach> --%>
<!-- 								</div> -->
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>

			<div>

			<%@ include file="/WEB-INF/views/common/pagination_coworklist.jsp" %>

			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

	<script>
	function list_go(page){
		  url = "/colist/coworklist.do";

		  var mineCheck = "";
		   var searchType = $('select[name="searchType"]').val();
		   var keyword = $('input[name="keyword"]').val();
		   if($("#mineCheck").is(":checked")){
		  	 mineCheck = $('#mineCheck').val();
		   }
		   var selectFilter = $('#selectFilter').val();
		   subgoPage(url+"?page="+page+"&perPageNum=9&searchType="+searchType+"&keyword="+keyword+"&mineCheck="+mineCheck);
		}

	  $("#mineCheck").change(function(){
	        if($("#mineCheck").is(":checked")){
	        	list_go(1)
	        }else{
	        	list_go(1)
	        }
	    });




		function goPage_1() {
			subgoPage("/colist/proceedingCooperation.do");
		}
		function goPage_2() {
			subgoPage("/colist/completeCooperation.do");
		}


		function cooperationDetail(coRelease) {
			//alert(coRelease);
			if (coRelease == '공개') {
				subgoPage('/cooperation/detail.do?coNo='+coNo);
			} else {
				//alert("비공개된 협진입니다!접근불가");
					swal({
						title : "접근불가",
						text : "비공개된 협진입니다.",
						type : "warning",
						//showCancelButton : true,
						confirmButtonColor : "#DD6B55",
						closeOnConfirm : false
					});
				//return false;
			}
		}

		$(document).ready(function() {
			$("#chk_select").change(function() {
				if ($("#chk_select").is(":checked")) {
					//alert("체크박스 체크했음!");
					subgoPage("/colist/myCooperation.do");
				} else {
					//alert("체크박스 체크 해제!");
				}
			});
		});
	</script>
</body>
</html>