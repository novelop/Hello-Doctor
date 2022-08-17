<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="ordersetList" value="${dataMap.ordersetList }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<style>
.sweet-alert{
top: 25%;
}
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
	border-radius: 20px;
	padding-bottom: 28px;
	  
}

p {
	margin-top: 0;
	margin-bottom: 0.3rem;
}

.title_2 {
	display: inline;
	text-align: center;
}

.row>.col-lg-4>.contact-box {
	width: 340px;
	box-shadow: 1px 1px 1px #000;
}

.backblue {
	background: aliceblue;
}

.row {
	margin-left: -25px;
}
.datestyle {
	width: 90px;
	padding: 3px;
	text-align: center;
}
.dongle p {
	margin-bottom: 2px;
}
.textaline {
	text-align: center;
}

.feed-element:hover{
	color : grey;
}
.drugbox{
	border: 1px solid lightgray;;
    border-radius: 15px;
    padding-top: 27px;
    padding-bottom: 15px;
    margin-top: -14px;
    height: 141px;
    text-align: left;
    padding-left: 15px;
}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-9">
			<h3 style="margin-top: 20px;">공유된 오더세트</h3>
		</div>
	</div>

	<div class="wrapper wrapper-content animated fadeInRight" style="    padding: 10px 10px 40px;">
	<div class="title_2" style="margin-top: 11px;">
					<a style="font-size: 1.1em;display: inline-block;cursor: pointer; margin-left: 10px;width: 10%;" onclick="subgoPage('/orderset/orderset_registform.do')"> <i class="fa fa-plus-square-o" style="vertical-align: -3px; font-size: 23px;">&nbsp;</i><span style="font-size: 15px;">등록하기</span></a>
			<p
				style="display: inline-block; text-align: right; width: calc(47% - 4px);">
				<input
					style="display: inline; white-space: nowrap; zoom: 1.3; vertical-align: -2px;"
					type="checkbox" id="mineCheck" value="Y"
					${cri.mineCheck eq 'Y' ? 'checked' : ''}> <label for="a"
					style="font-size: 1.1em;">내가 등록한 오더세트</label>
			</p>
			&nbsp;&nbsp; <select id="selectFilter"
				class="form-control"
				style="height: 31px; width: 12%; text-align: left; font-size: 1em; display: inline-block;">
				<option selected value="d"
					${cri.selectFilter eq 'd' ? 'selected':'' }>최근 등록일 순</option>
				<option value="v" ${cri.selectFilter eq 'v' ? 'selected':'' }>조회 순</option>
				<option value="r" ${cri.selectFilter eq 'r' ? 'selected':'' }>추천 순</option>
			</select>
			<div class="search"
				style="display: inline-block; width: calc(30% - 20px);">
				<select name="searchType" class="form-control"
					style="height: 31px; width: 104px; text-align: left; font-size: 1em; display: inline-block;">
					<option selected value="cdt"
						${cri.searchType eq 'cdt' ? 'selected':'' }>전체</option>
					<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>전공분야</option>
					<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>상병명</option>
					<option value="d" ${cri.searchType eq 'd' ? 'selected':'' }>작성자</option>
				</select> <input name="keyword" class="form-control"
					style="display: inline-block; height: 31px; width: 203px; vertical-align: 1px;"
					type="text" value="${param.keyword}"> <a
					onclick="list_go(1);"> <i style="font-size: 1.5em;"
					class="fa fa-search"></i></a>
			</div>
		</div>

		<div class="row" style="margin-top: 10px;">

		<c:forEach items="${ordersetList}" var="orderset" >
			<div class="col-lg-3">
				<div class="contact-box center-version">

					<a onclick="subgoPage('/orderset/orderset_detail.do?from=list&oNo=${orderset.orderset.oNo}')" style="min-height: 226px;">
						<h4>
								<p style="display: inline-block; width: 77%; text-align: left;">
									<c:choose>
										<c:when test="${fn:length(orderset.orderset.oTitle) gt 11}">
											<c:out value="${fn:substring(orderset.orderset.oTitle, 0,10)}..">
	        								</c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${orderset.orderset.oTitle}">
											</c:out>
										</c:otherwise>
								</c:choose>
									(${orderset.orderset.oTarget})
								</p>
								<i style="width: 21%; text-align: left;" class="fa fa-thumbs-o-up"> ${orderset.orderset.recoCnt}</i>
						</h4>
							<div
								class=" bg-primary p-xs b-r-xl datediv datestyle displayinlineblock"
								style="width: 60px; margin-top: 5px; position: relative; margin-left: 85px;">처방내역</div>
							<div class="drugbox">
						<c:forEach items="${orderset.drugList}" var="drug"  begin="0" end="3" step="1" >
							<p>
							   <c:choose>
										<c:when test="${fn:length(drug.oDrug) gt 15}">
											<c:out value="${fn:substring(drug.oDrug, 0, 14)}..">
	        								</c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${drug.oDrug}">
											</c:out>
										</c:otherwise>
								</c:choose>
							</p>
						</c:forEach>
						<c:if test="${fn:length(orderset.drugList) gt 4}">
							<div style="margin-top: -8px; text-align: center; margin-left: -15px;">:</div>
						</c:if>
								</div>

					</a>
					<div class="contact-box-footer" style="  padding: 0px;">
						<div class="m-t-xs btn-group">
								<div style="    margin-left: -50px;" >
											<img alt="프로필" class="rounded-circle"
													src="<%=request.getContextPath()%>/doctor/getPic?dId=${orderset.orderset.docId}"
													style="width: 40px; height: 40px; text-align: left; vertical-align: -3px;">
												<div style="margin-left: 5px; display: inline-block; text-align: left;">
													<h5>${orderset.orderset.oCla}/
														${orderset.orderset.dName}</h5>
													<h5>조회수 ${orderset.orderset.oViewcnt}회
														&nbsp;•&nbsp;${orderset.orderset.oRegdate}</h5>
												</div>
											</div>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>





		</div>
		<!--end row -->

			<nav aria-label="Navigation">
				<ul class="pagination justify-content-center m-0">
					<li class="page-item">
						<a class="page-link" href="javascript:list_go(1);">
							<i class="fa fa-angle-double-left"></i>
						</a>
					<li class="page-item">
						<a class="page-link" href="javascript:list_go(1);">
							<i class="fa fa-angle-left"></i>
						</a>
					</li>

					<c:forEach var="pageNum" begin="${pageMaker.startPage }"
											 end="${pageMaker.endPage }" >
						<li class="page-item ${cri.page == pageNum?'active':''}">
							<a class="page-link" href="javascript:list_go('${pageNum}');" >${pageNum }</a>
						</li>

					</c:forEach>


					<li class="page-item">
						<a class="page-link" href="javascript:list_go(1);">
							<i class="fa fa-angle-right"></i>
						</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:list_go(${pageMaker.realEndPage });">
							<i class="fa fa-angle-double-right"></i>
						</a>
					</li>
				</ul>
			</nav>


	</div>



	<div style="height: 100px;"></div>
	<!-- Mainly scripts -->
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/open.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script src="js/inspinia.js"></script>
	<script src="js/plugins/pace/pace.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
	
	<script>
	
	
	
	function list_go(page){
		  url = "/orderset/orderset_list.do";

		  var mineCheck = "";
		   var searchType = $('select[name="searchType"]').val();
		   var keyword = $('input[name="keyword"]').val();
		   if($("#mineCheck").is(":checked")){
		  	 mineCheck = $('#mineCheck').val();
		   }
		   var selectFilter = $('#selectFilter').val();
		   subgoPage(url+"?page="+page+"&perPageNum=9&searchType="+searchType+"&keyword="+keyword+"&mineCheck="+mineCheck+"&selectFilter="+selectFilter);
		} 

	  $("#mineCheck").change(function(){
	        if($("#mineCheck").is(":checked")){
	        	list_go(1)
	        }else{
	        	list_go(1)
	        }
	    });
	  $("#selectFilter").change(function(){
	        	list_go(1)
	    });

	</script>

<c:if test="${from eq 'regist' }">
	<script>
	swal("", "오더세트가 등록되었습니다.", "success");
	</script>
</c:if>
<c:if test="${from eq 'remove' }">
	<script>
	swal("", "오더세트가 삭제되었습니다.", "success");
	</script>
</c:if>
</body>
</html>