<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ordersetList1" value="${dataMap.ordersetList1 }" />
<c:set var="ordersetList2" value="${dataMap.ordersetList2 }" />
<c:set var="feedbackList" value="${dataMap.feedbackList }" />
<c:set var="shareList" value="${dataMap.shareList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
}

.container {
	max-width: none;
}

.contact-box {
	padding: 10px;
	color: black;
	opacity: 40%;
	height: 300px;
	border-radius: 10px;
	padding-bottom: 30px;
	width: 23.5%;
	margin-left: 6px;
	margin-right: 6px;
	opacity: 80%;
}

.contact-box-3 {
	color: black;
	font-size: 1.2em;
	border-radius: 10px;
	width: 28%;
	margin-left: 24px;
	margin-right: 10px;
	margin-bottom: 20px;
	height: 145px;
	border: 1px solid black;
	font-size: 1.2em;
}

.contact-box-2 {
	color: black;
	border:1px solid black;
	border-radius: 10px;
	width: 28%;
	margin-left: 24px;
	margin-right: 3px;
	margin-bottom: 20px;
	height: 145px;
	border: 1px solid black;
	color: black;
}

.row {
	margin-bottom: 4px;
	margin-top: 4px;
}

.col-lg-3 {
	width: 140px;
}

.col-8 {
	max-width: 100%;
}

.panel-body {
	height: 370px;
}

.contact-box-2>.col-8 {
	padding-top: 13px;
	padding-left: 25px;
}

.icons {
	font-size: 1.2em;
}

.col-md-5 {
	height: 380px;
	padding-left: 0px;
	padding-top: 5px;
	background-color: white;
	margin-top: 5px;
	margin-left: 5px;
}

.col-md-7{
	height: 380px;
	padding-top: 5px;
	background-color: white;
	padding-left:10px;
	margin-top: 5px;

    flex: 0 0 56.333333%;
    max-width: 58.333333%;

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
.nonActive{
	border: 1px solid #dee2e6;
    background: #8080800f;
    color: #80808094;
}
.nav-tabs .nav-link {
    border: 1px solid #dee2e6;
  }
</style>

</head>
<body>



		<div class="row" style="margin-left: -25px; margin-top: 10px;">
			<div class="col-md-12" style="height: 410px;">
<h3 style="margin-left: 25px;">오더세트</h3>
<hr></hr>
				<div class="tabs-container">
					<ul class="nav nav-tabs" role="tablist">
						<li><a class="nav-link active" data-toggle="tab" href="#tab-1" style="margin-left: 10px;"> 추천 오더세트</a></li>
						<li><a class="nav-link" data-toggle="tab" href="#tab-2" >최근 등록한 오더세트</a></li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" id="tab-1" class="tab-pane active">
						<div class="panel-body" style="height: 353px;  margin-left: 10px;">
							<div class="row" style="margin-left: 10px;">
								<c:forEach items="${ordersetList1}" var="orderset" begin="0"
									end="3" step="1">
									<div class="contact-box"
										style="border: 3px solid #C9BBCF; background: #b3a5b91c;">
										<div class="col-8">
											<a
												onclick=" subgoPage('/orderset/orderset_detail.do?from=list&oNo=${orderset.orderset.oNo}#top'); ">
												<h4>
													<p
														style="display: inline-block; width: 77%; text-align: left;">
														<c:choose>
															<c:when test="${fn:length(orderset.orderset.oTitle) gt 10}">
											<c:out value="${fn:substring(orderset.orderset.oTitle, 0,9)}..">
																</c:out>
															</c:when>
															<c:otherwise>
																<c:out value="${orderset.orderset.oTitle}">
																</c:out>
															</c:otherwise>
														</c:choose>
														(${orderset.orderset.oTarget})
													</p>
													<i style="width: 21%; text-align: left;"
														class="fa fa-thumbs-o-up">
														${orderset.orderset.recoCnt}</i>
												</h4>

													<div
								class=" bg-primary p-xs b-r-xl datediv datestyle displayinlineblock"
								style="width: 60px; margin-top: 5px; position: relative; margin-left: 78px;">처방내역</div>
												<div class=" drugbox textaline dongle" style="font-size: 12.5px;">
														<c:forEach items="${orderset.drugList}" var="drug"
															begin="0" end="4" step="1">
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
											<hr style="background-color: black;">
											<div class="listBt">
											<img alt="프로필" class="rounded-circle"
													src="<%=request.getContextPath()%>/doctor/getPic?dId=${orderset.orderset.docId}"
													style="width: 40px; height: 40px;     vertical-align: -3px;">
												<div style="margin-left: 5px; display: inline-block;">
													<h5>${orderset.orderset.oCla}/
														${orderset.orderset.dName}</h5>
													<h5>조회수 ${orderset.orderset.oViewcnt}회
														&nbsp;•&nbsp;${orderset.orderset.oRegdate}</h5>
												</div>

											</div>

										</div>
									</div>
								</c:forEach>


							</div>
						</div>
					</div>
						<div role="tabpanel" id="tab-2" class="tab-pane">
							<div class="panel-body" style="height: 353px;  margin-left: 10px;">
							<div class="row" style="margin-left: 10px;">

								<c:forEach items="${ordersetList2}" var="orderset" begin="0"
									end="3" step="1">
									<div class="contact-box"
										style="border: 3px solid #6E85B7; background: #4c5b7c14;">
										<div class="col-8">
											<a
												onclick=" subgoPage('/orderset/orderset_detail.do?from=list&oNo=${orderset.orderset.oNo}#top'); ">
											<h4>
													<p
														style="display: inline-block; width: 77%; text-align: left;">
														<c:choose>
															<c:when
																test="${fn:length(orderset.orderset.oTitle) gt 8}">
																<c:out
																	value="${fn:substring(orderset.orderset.oTitle, 0, 7)}..">
																</c:out>
															</c:when>
															<c:otherwise>
																<c:out value="${orderset.orderset.oTitle}">
																</c:out>
															</c:otherwise>
														</c:choose>
														(${orderset.orderset.oTarget})
													</p>
													<i style="width: 21%; text-align: left;"
														class="fa fa-thumbs-o-up">
														${orderset.orderset.recoCnt}</i>
												</h4>

												<div
								class=" bg-primary p-xs b-r-xl datediv datestyle displayinlineblock"
								style="width: 60px; margin-top: 5px; position: relative; margin-left: 78px;">처방내역</div>
												<div class=" drugbox textaline dongle"  style="font-size: 12.5px;">
														<c:forEach items="${orderset.drugList}" var="drug"
															begin="0" end="4" step="1">
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
											<hr style="background-color: black;">
											<div class="listBt">
											<img alt="프로필" class="rounded-circle"
													src="<%=request.getContextPath()%>/doctor/getPic?dId=${orderset.orderset.docId}"
													style="width: 40px; height: 40px;     vertical-align: -3px;">
												<div style="margin-left: 5px; display: inline-block;">
													<h5>${orderset.orderset.oCla}/
														${orderset.orderset.dName}</h5>
													<h5>조회수 ${orderset.orderset.oViewcnt}회
														&nbsp;•&nbsp;${orderset.orderset.oRegdate}</h5>
												</div>

											</div>
										</div>
									</div>
								</c:forEach>


							</div>
						</div>
					</div>
					</div>


				</div>
			</div>
		</div>



	<div class="row" style="    margin-top: 50px;" >

	<div class="col-lg-6" >
		<div class=" white-bg page-heading" style="border: 1px solid #e7eaec; width: 586px;">
			<div class="">
				<h3 style="margin-top: 20px;">&nbsp;<i class="fa fa-share-alt"></i>&nbsp;공유 받은 오더세트
				<a  style="display: inline-block; float: right;" onclick="OpenWindow('MainShareList.do?dId=${doctorLogin.dId}','공유 받은 오더세트',600,457);"><i class="fa fa-bars" style="    margin-right: 6px;
    font-size: 24px;"></i></a>
				</h3>

			</div>
		</div>
			<div class="ibox-content"
				style="margin-left: 1px; border-radius: 0px; height: 436px;">
				<c:forEach items="${shareList}" var="share" begin="0" end="3"
					step="1">
					<div class="feed-element"
						style="cursor: pointer; padding-bottom: 0px;"
						onclick="subgoPage('/orderset/orderset_detail.do?from=list&oNo=${share.oNo}#top');">
						<a class="float-left"> <img alt="image" class="rounded-circle"
							src="<%=request.getContextPath()%>/doctor/getPic?dId=${share.dId}">
						</a>
						<div class="media-body ">
							<%--                                             <small class="float-right"><i class="fa fa-clock-o"></i> ${feed.fbRegdate}</small> --%>
							<strong>${share.dName}/${share.maName}</strong>님이 <strong>${share.oTitle}</strong>
							오더세트를 공유하였습니다.<br> <small class="text-muted"><i
								class="fa fa-clock-o"></i> ${share.osRegdate}</small>
							<div class="well">
								<div style="display: inline-block; width: 15%">${share.oRegdate}</div>
								<div style="display: inline-block; width: 48%">
									<c:choose>
										<c:when test="${fn:length(share.oTitle) gt 15}">
											<c:out value="${fn:substring(share.oTitle, 0, 14)}..">
					        								</c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${share.oTitle}">
											</c:out>
										</c:otherwise>
									</c:choose>
									(${share.oTarget})
								</div>
								<div style="display: inline-block; width: 35%">${share.oCla}
									/ ${share.docId}</div>
							</div>
						</div>
					</div>
				</c:forEach>

				<c:if test="${empty shareList}">
						<div
							style="text-align: center; font-size: 18px; color: #c6cace; padding: 69px; height: 187px;">
							<p>공유받은 오더세트가 없습니다.</p>
						</div>
				</c:if>
			</div>
		</div>



		<div class="col-lg-6" style="padding-left: 0px;">
			<div class=" white-bg page-heading"
				style="border: 1px solid #e7eaec; width: 600px; margin-left: -1px;">
				<div class="">
					<h3 style="margin-top: 20px;">
						&nbsp;<i class="fa fa-comment-o"></i>&nbsp;사용 후기 알림
						<a  style="display: inline-block; float: right;" onclick="OpenWindow('MainReplyList.do?dId=${doctorLogin.dId}','사용 후기 알림',600,457);"><i class="fa fa-bars" style="    margin-right: 6px;
    font-size: 24px;"></i></a>
					</h3>
				</div>
			</div>
			<div class="ibox-content"
				style="margin-right: 2px; border-radius: 0px; height: 436px;">
				<c:forEach items="${feedbackList}" var="feed" begin="0" end="3"
					step="1">
					<div class="feed-element"
						style="cursor: pointer; padding-bottom: 0px;"
						onclick="subgoPage('/orderset/orderset_detail.do?from=list&oNo=${feed.oNo}#top');">
						<a class="float-left"> <img alt="image" class="rounded-circle"
							src="<%=request.getContextPath()%>/doctor/getPic?dId=${feed.docId}">
						</a>
						<div class="media-body ">
							<%--                                             <small class="float-right"><i class="fa fa-clock-o"></i> ${feed.fbRegdate}</small> --%>
							<strong>${feed.dName}/${feed.maName}</strong>님이 <strong>${feed.oTitle}</strong>
							오더세트에 사용 후기를 등록하였습니다.<br> <small class="text-muted"><i
								class="fa fa-clock-o"></i> ${feed.fbRegdate}</small>
							<div class="well">
								<c:choose>
									<c:when test="${fn:length(feed.fbResult) gt 54}">
										<c:out value="${fn:substring(feed.fbResult, 0,53)}..">
				        								</c:out>
									</c:when>
									<c:otherwise>
										<c:out value="${feed.fbResult}">
										</c:out>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:if test="${empty feedbackList}">
						<div
							style="text-align: center; font-size: 18px; color: #c6cace; padding: 69px; height: 187px;">
							<p>새로운 사용 후기 알림이 없습니다.</p>
						</div>
				</c:if>
			</div>
		</div>



</div>
<div style="height: 200px;"></div>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script>
window.onload = function() {

	$('.nav-tabs > li > a').each(function() {
	    if($(this).is('.active')) {
	        // true
	    	console.log($(this).is('.active'));
	    } else {
	        // false
	        $(this).addClass('nonActive');
	    }
	})

}

$(document).on('click','.nav-link' ,function(){

	$('.nav-tabs > li > a').each(function() {
	    if($(this).is('.active')) {
	        // true
	    	console.log($(this).is('.active'));
	    } else {
	        // false
	        $(this).addClass('nonActive');
	    }
	})



})

</script>
</body>
</html>