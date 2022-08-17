<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="iCooperation" value="${dataMap.iCooperation}" />


<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>


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

p {
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
	<h2 style="color:black;">내 협진 <p style="display: inline-block; float:right; font-size: 0.6em; margin-top: 13px; margin-right: 10px; cursor:pointer;" onclick="subgoPage('/history/main.do')">히스토리<i class="fa fa-mail-forward" ></i></p></h2>
	<hr style="background-color:black;">

<div class="col-sm-12" style="margin-bottom: -30px; padding-left: 0px;">
	<input style="margin-left:10px;display: inline-block; white-space: nowrap; zoom: 1.3; vertical-align: text-top;" type="checkbox" id="chk_select_mine" checked> <label for="chk_select" style="font-size: 1.1em;">내 협진</label>

	<a onclick="goPage_1()" class="atag" style="font-size: 1.1em;  margin-left: 702px;">진행중</a>&nbsp;&nbsp;|
	<a onclick="goPage_2()" class="atag" style="font-size: 1.1em; font-weight:bold;">완료</a>&nbsp;&nbsp;


	<select class="form-control" name="searchType" style="vertical-align: top; margin-left:0px; height: 31px; width: 95px; text-align: center; font-size: 1em; display: inline-block;" name="searhlist" id="searchType">
		<option value="cwt" ${cri.searchType eq 'cwt' ? 'selected':'' }>검색</option>
		<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>진단명</option>
		<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>주치의</option>
		<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>환자명</option>
	</select>



	<input class="form-control"  name="keyword" style="display: inline-block; height: 31px; width: 170px;" type="text" name="keyword" value="${param.keyword }" /> &nbsp;&nbsp;
	<i style="font-size: 1.5em;" class="fa fa-search" onclick="list_go(1)"></i>
</div>
	<br>
	<br>

	<div id="all-wrapper">
		<div id="inner-wrapper">
			<div class="row">
				<c:forEach items="${iCooperation}" var="iCooperation">
					<div class="col-lg-3" style="padding-left: 0px;">
						<div class="contact-box demo3" style="box-shadow: 1px 1px 1px 1px #79afc8; height: 165px;" onclick="cooperationDetail('${iCooperation.coNo}')">
							<div class="col-8">
								<div class="col-12" style="margin-left: -15px;">
									<h3>
										<strong>협진시작일&nbsp;&nbsp;${iCooperation.coStartDate}</strong><br>

										<strong>협진종료일&nbsp;&nbsp;${iCooperation.endDate}</strong>

									</h3>
								</div>




								<div>
								<p>환자명 &emsp;${iCooperation.pName}</p>
								<p>주상병 &emsp;${iCooperation.coDisease}</p>
								<c:if test="${iCooperation.subDName ne null}">
									<p>부상병 &emsp;${iCooperation.subDName}</p>
								</c:if>
								<p>주치의 &emsp; ${iCooperation.dName} ${iCooperation.maName}
								<img alt="프로필" class="rounded-circle" src="<%=request.getContextPath()%>/doctor/getPic?dId=${iCooperation.dId}" style="display: inline-block; margin-left:10px;width: 35px; height: 35px; text-align: left; vertical-align: -21px;">
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
		  url = "/colist/iCooperation.do";

		  var mineCheck = "";
		   var searchType = $('select[name="searchType"]').val();
		   var keyword = $('input[name="keyword"]').val();

		   subgoPage(url+"?page="+page+"&perPageNum=9&searchType="+searchType+"&keyword="+keyword);
		}


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
				subgoPage('/cooperation/detail.do');
			}
		}

		$(document).ready(function() {
			$("#chk_select_mine").change(function() {
				if ($("#chk_select").is(":checked")) {
					//alert("체크박스 체크했음!");
					//subgoPage("/colist/myCooperation.do");
				} else {
					//alert("체크박스 체크 해제!");
					subgoPage("/colist/completeCooperation.do");
				}
			});
		});
	</script>
</body>
</html>