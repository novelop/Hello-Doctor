<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="approveList" value="${approveList}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
font-size: 12px;
}
.container {
	max-width: none;
}

.row {
	margin-top: 2px;
	margin-bottom: 2px;
}

.col-md-6 {
	height: 400px;
}

.col-md-4 {
	height: 440px;
}

.ibox-content {
	padding: 8px 8px 8px 8px;
}

.ibox-content-2 {
	border: 3px solid #1F4690;
	border-radius: 20px;
}

h4 {
	margin-left: 15px;
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
<h3 style="margin-left: 10px; margin-top: 15px;">히스토리</h3>
		<hr style=" margin-top: 1px;"></hr>
	<div class="container">
		<div class="row">
			<div class="col-md-5" style="padding-left: 5px; padding-right: 0px;">
				<div class="ibox-content" style="height: 371px; margin-bottom: -15px;">
					<div class="tabs-container">
					<a
							style="display: inline-block; float: right; margin-top: 7px;"
							onclick=""><i
							class="fa fa-bars" style="color:black; margin-right: 6px; font-size: 20px;"></i></a>
						<ul class="nav nav-tabs" role="tablist">
							<li><a class="nav-link active" id="tab3"   data-toggle="tab" href="#tab-3"> 협진요청</a></li>
							<li><a class="nav-link" id="tab4"   data-toggle="tab" href="#tab-4">협진요청현황</a></li>
						</ul>
						<div class="tab-content">
							<div role="tabpanel" id="tab-3" class="tab-pane active">
								<div class="panel-body" style="padding: 0px;">
									<div class="ibox-content" style="height:314px; padding-top:0px;">
										<table class="table table-hover">
											<tbody>
												<c:forEach items="${comingalarm}" var="comingalarm" begin="0" end="10" step="1">
													<tr onclick="cooperation_read('${comingalarm.notiNo}',this)" style="cursor: pointer;">
														<td>
															<c:if test="${comingalarm.read eq '1'}">
																<img alt="프로필" src="<%=request.getContextPath()%>/resources/img/notification.png" style="width: 20px; height: 20px;">
															</c:if></td>
														<td>${comingalarm.maName}&nbsp;${comingalarm.dName}님의 협진요청입니다
															&emsp;&emsp;&emsp;</td>
														<td><i class="fa fa-calendar"></i>${comingalarm.notiDate}</td>
													</tr>
													<tr>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div role="tabpanel" id="tab-4" class="tab-pane">
								<div class="panel-body" style="padding: 0px;">
									<div class="ibox-content" style="height:314px; padding-top:0px; " >
										<table class="table table-hover">
											<tbody>
												<c:forEach items="${sending}" var="sending" begin="0" end="10" step="1" >
													<tr onclick="cooperationTwo('${sending.notiNo}',this)" style="cursor: pointer;">
														<td>${sending.maName}&nbsp;${sending.dName}님의 협진요청입니다</td>
														<td><i class="fa fa-calendar"></i>${sending.notiDate}</td>
														<td><c:if test="${sending.response eq '0'}">
																<span class="label label-danger">거절</span>
															</c:if> <c:if test="${sending.response eq '1'}">
																<span class="label label-success">수락</span>
															</c:if> <c:if test="${sending.response eq '2'}">
																<span class="label" style="background-color:#8bc34a; color:white;">보류</span>
															</c:if></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-7" style="padding-right: 0px; padding-left: 0px;">
				<div class="ibox-content" style="height: 371px;">
					<div class="tabs-container">
						<a
							style="display: inline-block; float: right; margin-top: 7px; color: black; margin-right: 3px;"
							onclick="goAllList()"><i class="fa fa-bars"
							style="margin-right: 6px; font-size: 20px;"></i></a>

						<ul class="nav nav-tabs" role="tablist">
							<li><a id="tab1" class="nav-link active" data-toggle="tab" href="#tab-1" >진료히스토리</a></li>
							<li><a id="tab2" class="nav-link" data-toggle="tab" href="#tab-2" >협진히스토리</a></li>
						</ul>

						<div class="tab-content">
							<div role="tabpanel" id="tab-1" class="tab-pane active">
								<div class="panel-body" style="padding: 0px;">
									<div class="col-md-12" style="padding-left:0px; padding-right:0px;">
										<div class="ibox-content" style="height:315px;">
											<table class="table table-hover" style="width:670px;">
												<thead style="background: rgb(26, 179, 148);">
													<tr>
														<th style="width: 10%;">환자명(협진이력)</th>
														<th style="width: 3%;">생년월일</th>
														<th style="width: 30%;">주상병</th>
														<th style="width: 10%;">진료일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${diagnosis}" var="history"  begin="0" end="7" step="1">
														<tr >
															<td>
															${history.pName}[${history.pSex}]
															<c:if test="${history.cReco eq '1'}">
																	<i class="fa fa-group"></i>
															</c:if>
															</td>
															<td>${history.pRnum}</td>
															<td>${history.dName}</td>
															<td>${history.mDate}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" id="tab-2" class="tab-pane">
								<div class="panel-body" style="padding: 0px;">
									<div class="col-md-12" style="padding-left:0px; padding-right:0px;">
										<div class="ibox-content" style="height:315px;">
											<table class="table table-hover" style="width:670px;">
												<thead style="background: rgb(26, 179, 148);">
													<tr>
														<th style="width: 3%;">환자명</th>
														<th style="width: 2%;">생년월일</th>
														<th style="width: 8%;">주상병</th>
														<th style="width: 3%;">종료사유</th>
														<th style="width: 8%;">협진일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${Cooperation}" var="cooperation" >
														<tr>
															<td>${cooperation.pName}[${cooperation.pSex}]</td>
															<td>${cooperation.pRnum}</td>
															<td>${cooperation.coDisease}</td>
															<td>${cooperation.endReason}</td>
															<td>${cooperation.coOpenDate}~${cooperation.endDate}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4" style="padding-right: 0px; padding-left: 0px;">
				<div class="ibox-content" style="height: 390px;">
				<div class="tabs-container">
				 <a
							style="display: inline-block; float: right; margin-top: -3px;"
							onclick=""><i
							class="fa fa-bars" style="margin-right: 6px; font-size: 20px; color:black; margin-top:6px;"></i></a>
                        <ul class="nav nav-tabs" role="tablist">
                            <li><a class="nav-link active" data-toggle="tab" href="#tab-10"> 좋아요</a></li>
                            <li><a class="nav-link" data-toggle="tab" href="#tab-11">댓글</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" id="tab-10" class="tab-pane active">
                                <div class="panel-body" style="height: 332px; padding-top:0px; padding: 0px;">
										<table class="table table-hover">
												<c:forEach items="${likeList}" var="likeList" begin="0" end="5" step="1" >
													<c:set var = "disNo" value="${likeList.disNo}"/>
														<tbody>
														<c:if test="${fn:substring(disNo,0,1) eq'O'}">
																<tr onclick="subgoPage('/orderset/orderset_detail.do?from=list&oNo=${likeList.disNo}&dId=${doctorLogin.dId }')">
																	<td style="width:15%; padding-top: 15px;"><span class="label label-primary"><i class="fa fa-thumbs-up"></i>오더세트</span></td>
																	<td style="width:45%; padding-top: 13px;">[${likeList.disTitle}]에 공감하셨습니다
																	<br><medium><i class="fa fa-clock-o"></i>${likeList.rDate}</medium></td>
																</tr>
														</c:if>
														<c:if test="${fn:substring(disNo,0,2) eq 'DI'}">
																<tr onclick="subgoPage('/case/detail.do?from=list&disNo=${likeList.disNo}&dId=${doctorLogin.dId }')">
																	<td style="width:15%; padding-top: 15px;"><span class="label label-success"><i class="fa fa-thumbs-up"></i>C.D</span></td>
																	<td style="width:45%; padding-top: 13px;">[${likeList.disTitle}]에 공감하셨습니다
																	<br><medium><i class="fa fa-clock-o"></i>${likeList.rDate}</medium></td>
																</tr>
														</c:if>
														<c:if test="${fn:substring(disNo,0,2) eq 'DR'}">
																<tr onclick="subgoPage('/case/detail.do?from=list&disNo=${likeList.disNo}&dId=${doctorLogin.dId }')">
																	<td style="width:15%; padding-top: 15px;"><span class="label label-success"><i class="fa fa-thumbs-up"></i>C.D</span></td>
																	<td style="width:45%; padding-top: 13px;">[${likeList.disTitle}]댓글에 공감하셨습니다
																	<br><medium><i class="fa fa-clock-o"></i>${likeList.rDate}</medium></td>
																</tr>
														</c:if>
														</tbody>
												</c:forEach>
										</table>
                                </div>
                            </div>
                            <div role="tabpanel" id="tab-11" class="tab-pane">
                                <div class="panel-body" style="height: 332px; padding-top:0px; padding: 0px;">
   										<table class="table table-hover">
												<c:forEach items="${commentList}" var="commentList" begin="0" end="5" step="1" >
													<c:set var = "logNum" value="${commentList.logNum}"/>
														<tbody>
														<c:if test="${fn:substring(logNum,0,1) eq'O'}">
																<tr onclick="subgoPage('/orderset/orderset_detail.do?from=list&oNo=${commentList.codeNum}')">
																	<td style="width:15%; padding-top: 15px;"><span class="label label-primary"><i class="fa fa-thumbs-up"></i>오더세트</span></td>
																	<td style="width:45%; padding-top: 13px;">[${commentList.disTitle}]에 댓글등록을 하였습니다.
																	<br><medium><i class="fa fa-clock-o"></i>${commentList.logDate}</medium></td>
																</tr>
														</c:if>
														<c:if test="${fn:substring(logNum,0,1) eq 'D'}">
																<tr onclick="subgoPage('/case/detail.do?from=list&disNo=${commentList.codeNum}')">
																	<td style="width:15%; padding-top: 15px;"><span class="label label-success"><i class="fa fa-thumbs-up"></i>C.D</span></td>
																	<td style="width:45%; padding-top: 13px;">[${commentList.disTitle}]에 댓글등록을 하였습니다.
																	<br><medium><i class="fa fa-clock-o"></i>${commentList.logDate}</medium></td>
																</tr>
														</c:if>
														</tbody>
												</c:forEach>
										</table>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</div>


				<div class="col-md-4" style="padding-left: 5px; padding-right:5px;">
				<div class="ibox-content" style="height: 390px; border: 1px solid lightgray;">
					<h4 style="color: black;">
						공지사항 <a
							style="display: inline-block; float: right; margin-top: -3px;"
							onclick="subgoPage('/history/notice.do')"><i
							class="fa fa-bars" style="margin-right: 6px; font-size: 20px;"></i></a>
					</h4>
					<table class="table table-hover">
						<tbody>
							<c:forEach items="${noticeList}" var="noticeList">
								<tr onclick="notice_read('${noticeList.nNo}',this)">
									<td style="width:2%;">
									<c:if test="${noticeList.noticeYn eq '1'}">
											<img class="readchk" alt="프로필" src="<%=request.getContextPath()%>/resources/img/red.png" style="width: 8px; height: 8px;">
									</c:if> </td>
									<td>&nbsp;
									<c:choose>
											<c:when test="${fn:length(noticeList.nTitle) gt 20}">
												<c:out value="${fn:substring(noticeList.nTitle, 0, 19)}..">
		        								</c:out>
											</c:when>

											<c:otherwise>
												<c:out value="${noticeList.disContent}">
												</c:out>
											</c:otherwise>
											</c:choose>
<%-- 									${noticeList.nTitle} --%>


									</td>
									<td style="width: 28%;"><i class="fa fa-calendar"></i>${noticeList.nDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-4" style="background-color: white; height: 390px; padding-left: 5px; border-radius:5px; border: 1px solid lightgray;">
				<h4 style="color: black; padding-top: 8px;">
					&nbsp;My Log &emsp;<a
							style="display: inline-block; float: right; margin-top: -3px;"
							onclick=""><i
							class="fa fa-bars" style="margin-right: 6px; font-size: 20px;"></i></a>
				</h4>
				<div class="col-lg-12" style="padding-right: 0px;  padding-left: 0px;">
					<div class="ibox-content" style="height:340px;">
                        <table class="table">
                            <thead>
                            <tr style="background: rgb(26, 179, 148);">
                                <th style="width:10%;"></th>
                                <th>일시</th>
                                <th>로그인IP</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${log}" var="log">
                            <tr>
                            	<c:if test="${log.logCla eq '1'}">
                            	<td style="font-size: 14px; color:red; "><i class="fa fa-sign-in"></i></td>
                                <td>${log.indate}</td>
                                <td>${log.ipaddress}</td>
                                </c:if>
                                <c:if test="${log.logCla eq '2'}">
                                <td style="font-size: 14px; color:blue; transform: scale(-1); padding: 7px 0px 10px 16px;"><i class="fa fa-sign-out"></i></td>
                                <td>${log.indate}</td>
                                <td>${log.ipaddress}</td>
                                </c:if>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>

					</div>
				</div>
			</div>
		</div>
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
<script>



function notice_read(nNo,img){
	console.log(nNo);
	var dId = '${doctorLogin.dId}'
	console.log(dId);

	var data = {
			"dId":dId,
			"nNo":nNo,
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/notice/noticeRead",
				type : 'post',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function(data) {

						$(img).find("img").remove();
						window.open('notice_detail.do?nNo='+nNo,'','width=600, height=535');

				},
				error : function(error) {
					alert('실패했습니다.');
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});

		}

function cooperation_read(notiNo,img){
	console.log(notiNo);
	var dId = '${doctorLogin.dId}'
	console.log(dId);

	var data = {

			"notiNo":notiNo,
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/cooperation/readCooperation",
				type : 'post',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function(data) {
						$(img).find("img").remove();
						window.open('cooperationRequest.do?notiNo='+notiNo,'','width=750, height=695');
				},
				error : function(error) {
					alert('실패했습니다.');
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});

		}

function cooperationTwo(notiNo){
	console.log(notiNo);
	var dId = '${doctorLogin.dId}'
	console.log(dId);

	var data = {

			"notiNo":notiNo,
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/cooperation/readCooperation",
				type : 'post',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function(data) {

						window.open('cooperationRequest.do?notiNo='+notiNo,'','width=750, height=695');
				},
				error : function(error) {
					alert('실패했습니다.');
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});

		}



function goAllList(){
	  if($('#tab1').is('.active')) {
		  subgoPage('/history/diagnosis_history.do')
	  }else{
		  subgoPage('/colist/completeCooperation.do?chkSelectMine=Y')
	  }

}

</script>

</body>
</html>