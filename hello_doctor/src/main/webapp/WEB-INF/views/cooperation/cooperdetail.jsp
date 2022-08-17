
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="coTaskList" value="${coTaskList}"/>
<c:set var ="myTaskList" value= "${myTaskList}"/>
<c:set var="coDoc" value="${coDoc}"/>
<c:set var="coNo" value="${coNo}"/>
<c:set var="historyList" value="${historyList}"/>
<c:set var="selectLast" value="${selectLast}"/>
<c:set var="lastPreList" value="${lastPreList}"/>
<c:set var="myIssueList" value="${myIssueList}"/>
<c:set var="dId" value="${dId}"/> <!-- 세션(로그인)dId -->
<c:set var="coDocList" value="${coDocList}"/>
<c:set var="chartFileList" value="${chartFileList}"/>
<c:set var="chartPicList" value="${chartPicList}"/>
<c:set var="coFreqList" value="${coFreqList}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/slick/slick.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/slick/slick-theme.css"
	rel="stylesheet">

  <!-- Sweet Alert -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

 <link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
<!-- slick -->
  <link href="<%=request.getContextPath()%>/resources/css/plugins/slick/slick.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/slick/slick-theme.css" rel="stylesheet">



<style type="text/css">

wrapper .ibox-content{

overflow-y:hidden;
}

.stream-small .label {
    padding: 2px 6px;
    margin-right: 2px;
    font-size: 0.73rem;
}

a {
    color: black;
    text-decoration: none;
    background-color: transparent;
}
.stream-small {
    margin: 11px 0;
    margin-left: 11px;
}

.file{
	width:45%;
	float:left;
	margin: 5px;
    overflow-x: hidden;

}
.file .icon{
padding:0;
	height: 80px;

}

.pastimg{

width: 45%; height: 120px;
    float: left;
    display: inline-block;
    margin:5px;

}

body.light-skin {
    background-color: #f9f9f9;
    color: #3e5476;
    margin-top: -25px;
}
.tab-content .panel-body{
height: 312px;
}
.doctorsList {
    width: 70%;
    float: right;
    padding-left: -31px;
    padding-top: 10px;
}
.medicine{
text-align: center;
}
.mediname{
	text-align: left;
}
.loginfo > p {
    margin-bottom: -2px;
    padding-left: -5px;
}

div {

}

.diagnosis {
    width: 70%;
    float: left;
    height: 375px;
}
.history {
	width: 29%;
    float: right;
    height: 740px;
}

.clean {
	clear: both;
}

.rest {
	width: 70%;
	float: left;
	height: 361px;
}

.container {
	max-width: none;
	margin: 0;
	padding: 0;
	height: 100%;
}

.buttonplace {
	width: 100%;
	height: 70px;
	padding-top: 13px;
	padding-left: 30px;
	padding-right: 15px;
	text-align: right;
}

.todaydiagnosis {
	width: 45%;
	height: 100%;
	float: left;
}
.alldiagnosis {
    width: 55%;
    float: right;
    height: 100%;
}

.allrest {
	width: 45%;
	height: 89%;
	float: left;
}

.issue {
	width: 55%;
	height: 100%;
	float: right;
	margin-top: 15px;
}

.i-checks {
	display: inline-block;
	float: right;
	s
}

.ibox-title {
	margin: 0;
	padding: 0;
	padding-top: 10px;
}

.time {
	font-size: 90%;
}

.titlefont {
	font-size: 15px;
}

.ibox {
	margin-bottom: 0px;
}

.titlediv{
	width: 30px;
}

.ibox-content {
    padding: 0;
    display: block;
    height: 168px;
    overflow: auto;
    overflow-y: hidden;
}
#ibox-content{

overflow: auto;
 overflow-x: hidden;
}
.fa-plus-circle::before {
	font-size: 20px;
}

.btn-default {
	width: 25px;
	height: 20px;
	padding: 0;
	margin-left: 12px;
}

button.dim {
	margin-bottom: 13px !important;
	padding-top: 0;
}

.selectbox {
	width: 110px;
	float: right;
	margin-right: 15px;
	margin-left: 5px;
	font-size: 15px
}

.nav-tabs>li>a {
	width: 80px;
	padding: 0;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 8px;
}

.tabicon {
	font-size: 20px;
}

.panel-body {
	height: 380px;
	margin: 0;
}

.tabs-container .panel-body {
	padding: 0;
}

.disc {
	font-size: 50px;
	width: 20%;
	float: left;
}

.download {
	width: 100%;
	height: 13%;
	padding: 0;
	padding-left: 10px;
}

.fileinfo {
	width: 80%;
	float: right;
	padding-left: 5px;
}

.logicon::before {
    font-size: 22px;
}

.loginfo {
    width: 88%;
    float: right;
    padding-left: -31px;
    padding-top: 10px;
}
#recordtable>tbody>tr>td, #recordtable>tfoot>tr>td {
	padding: 0;
	border : 1px dotted #999;
	padding-left: 10px;
}

#recordtable>tbody>tr {
	display: flex;
}


#vertical-timeline {
	margin: 0;
	width: 100%;
}

.datefont {
	color: #1ab394;
}

.historyibox {
    height: 640px;
}

.title {
	width: 120px;
	display: inline-block;
	text-align: center;
}

.vertical-timeline-content p {
	margin: 2px;
}

#pastrecord {
    height: auto;
    padding-left: 6px;
    padding-top: 10px;
    height: 310px;
}
.fa-paperclip {
	display: block;
	border: 1px solid #e2e2e2;
}

.checkbutton {
	padding-top: 5px;
	margin: 0;
	height: 35px;
}

.table {
	margin-bottom: 0px;
}

.logdisc{
	    width: 30px;
    display: inline-block;
        padding-left: 10px;
    padding-top: 10px;
}
.medidisc{
   width: 40px;
    display: inline-block;
        padding-left: 30px;
    padding-top: 10px;
}
.medipic{
	border-radius: 50%;
	width: 40px;
	height: 50px;
}
.loginfo > p {
    margin-bottom: 3px;
    padding-left: 5px;
}

.fileinfo > p{
	margin-bottom : 3px;
	padding-left: 15px;
}
.panel-body{
	height: 380px;
	display: block;
	overflow:auto;

}
#allsearch{
	font-size: 20px;
	margin: 20px;

}
.fa-cog{

	float:right;
	margin-right:20px;
	font-size: 20px;
}
#dropdown-toggle{
	float:right;
}
.reservationButton{
height: 27px;
    padding-top: 0;
    padding-bottom: 0;

}
.pastRecoButton{
height: 30px;
    padding-top: 0;
    padding-bottom: 0;
	margin-bottom: 2px;
}
.light-skin .ibox-content{
overflow-x: hidden;
}
.docName{
	margin-top: 5px;
	margin-bottom: 0px;
}
.picDiv{
	margin-left: 7px;
	margin-top: 2px;
}
.issueContent{
	font-weight: bold;
	padding: 5px;
	letter-spacing: 1px;
	margin-top: 30px;
}
#sessionId{
margin-right: 7px;
}


.joinBox {
        width: 180px;
    height: 120px;
    margin-bottom: 3px;
    font-size: 1.08em;
    margin-left: 15px;
    margin-top: 10px;
}
.joinBox hr{
    margin-top: -1px;
}

.joinBox p {
    margin-top: -9px;
    margin-bottom: 0.2rem;

}
.col-lg-4 {

    flex: 0 0 33.333333%;
    max-width: 30.88888%;
    padding-left: 4%;

}

.nonActive{
	border: 1px solid #dee2e6;
    background: #8080800f;
    color: #80808094;
}
.nav-tabs .nav-link {
    border: 1px solid #dee2e6;
  }

.input-group {
    float: right;
    margin-bottom: -6px;
    width: 70%;
    margin-right: -157px;
}

#coco tr{
border-bottom: hidden;
    overflow: hidden;
    height: 90px;
}

.slick-slide img{
display: inline-block;
}
.docInfo{
width: 100px;
    display: inline-block;
    text-align: left;
    float: left;
    margin-left: 10px;


}

</style>
</head>
<body style="margin-top: -25px;">
	<div class="container">
		<!-- <div class="buttonplace">
			<button class="btn btn-outline btn-success  dim" type="button">전체
				채팅</button>
		</div> -->
		<div class="diagnosis">
			<div class="todaydiagnosis">
				<div class="ibox">
					<div class="ibox-title">
						<!-- <div class="bg-primary p-xs b-r-xl title">전체 진료</div> -->
<div class=""><div><span style="font-size: 16px; font-weight: bold; padding-left:3px"><i class="fa fa-stethoscope"></i>진료 예약</span>


<select class="form-control selectbox" name="account">
							<option>최신순</option>
							<option>등록일순</option>

						</select>


<button onclick="window.open('reservationform.do?coNo=${coNo}&coDoc=${coDoc}','','width=800, height=533, left=500, top=100');return false;" class="btn btn-primary reservationButton" type="button">예약</button>

					<div class="i-checks">
							<label class="checkbutton">
								<div class="icheckbox_square-green" style="position: relative;" id="sessionId" userId="${dId}">
									<input type="checkbox" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper"
										style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div>나의 진료
							</label>
						</div>



			</div>
				</div>

					</div>
					<div class="ibox-content" style="width: 99%;height: 315px; overflow-y:auto;">

						<table class="table table-hover" style="text-align: center">
							<thead>
								<tr>
									<th>진료일시</th>
									<th>담당의료진</th>
									<th>진료구분</th>
									<th>진행도</th>
								</tr>
							</thead>
							<tbody id="taskTable">

							<c:forEach items="${coTaskList}" var="cotasksub">
								<tr style="cursor: pointer;" onclick="window.open('reservationDetail.do?taNo=${cotasksub.taNo}','','width=609, height=650, left=500, top=100');return false;">
									<td class="time">${cotasksub.taDate}</td>
									<td>${cotasksub.dName}</td>
									<td>${cotasksub.taName}</td>
									<td style="padding-left: 0px;">
									<input type="hidden" value="세션로그인==>${dId}"/>
											<c:if test="${cotasksub.dId ne dId}">
												<div class="progress">
													<div class="progress-bar-info"
														style="width: ${cotasksub.progressPercentage}%"
														role="progressbar" aria-valuenow="43" aria-valuemin="60"
														aria-valuemax="100"></div>
												</div>
											</c:if>
											<c:if test="${cotasksub.dId eq dId}">
												<div class="progress">
													<div class="progress-bar-success"
														style="width: ${cotasksub.progressPercentage}%"
														role="progressbar" aria-valuenow="43" aria-valuemin="60"
														aria-valuemax="100"></div>
												</div>
											</c:if>

									</td>
								</tr>
								</c:forEach>


							</tbody>



						</table>
					</div>
				</div>


			</div>
			<div class="alldiagnosis">

				<div class="ibox">
					<div class="ibox" style="margin-bottom: 0">

						<div class="" style="margin-top:5px;"><h3></h3></div>


				                  <div class="tabs-container">
                        <ul class="nav nav-tabs" role="tablist" style="margin-bottom: -13px;">
                            <li><a style="width:92px; padding-top: 16px;"class="nav-link active" data-toggle="tab" href="#tab-1">최근진료기록</a></li>
                            <li><a style="padding-top: 16px;padding-left: 16px;"class="nav-link " data-toggle="tab" href="#tab-2">처방전</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" id="tab-1" class="tab-pane active">
                                <div class="panel-body">
						<div  class="ibox-content" id="pastrecord">
						<c:if test ="${!empty selectLast}">
						<p style="text-align: right;padding-right: 15px;">진료일시 : <fmt:formatDate value="${selectLast.mDate}" pattern="yyyy-MM-dd HH:mm"/><p>
						${selectLast.symptom}
<br><br>
</c:if>

<c:if test = "${!empty chartPicList}">
<c:forEach items="${chartPicList}" var="chartPic">
<div class="pastimg" style="background-image:url('getChartPic?mpNo=${chartPic.mpNo}')" onclick="detailImg('${chartPic.mpNo}')"></div>
</c:forEach>
</c:if>


<c:forEach items="${chartFileList}" var="chartFile">
<div class="file" onclick="location.href='getFile?mfNo=${chartFile.mfNo}'">
                                    <a>
                                        <span class="corner"></span>

                                        <div class="icon">
                                            <i class="fa fa-file"></i>
                                        </div>
                                        <div class="file-name">
											${chartFile.mfFilename};
                                        </div>
                                    </a>
                                </div>
</c:forEach>
						</div>


                                </div>
                            </div>





                            <div role="tabpanel" id="tab-2" class="tab-pane">
                                <div class="panel-body">


						<div class="ibox" style="margin-bottom: 0">
							<div class="ibox" style="margin-bottom: 0">

								<h4 style="text-align: center">처방</h4>
								<div class="ibox-content" style="height: 280px;">

									<table class="table table-bordered medicine">


										<tbody>
										<thead>
										<tr>
															<th>약명</th>
															<th>수량</th>
															<th>일투수</th>
															<th>투약일</th>
										</tr>
										</thead>
										<tbody>
									<c:forEach items="${lastPreList}" var="lastpre">
											<tr>
												<td class="mediname"> ${lastpre.cureName}</td>
												<td>${lastpre.pQuantity}</td>
												<td>${lastpre.pAday}</td>
												<td>${lastpre.pDays}</td>
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
			</div>
		</div>


		 <div class="history">

			<div class="ibox-title">
			<div class="">
				<h3><a style="font-size: 16px"><i class="fa fa-history"></i>진료기록</a></h3> </div>

<div class="col-md-6" style="display: contents;">
								<div class="form-group" style="width: 300px; display: contents;">
									<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
										for="date"></label>
										<input class="datepicker" type="text" placeholder="   YYYY - mm - dd" id="title" name="title" class="form-control"
									style="display: inline;margin-left: 25px;margin-bottom: 17px;height: 31px;width: 151px;">
								</div>
								<input value="조회" type="button" class="btn btn-primary pastRecoButton" onclick="datePic()"/>&nbsp;&nbsp;
								<input value="초기화" type="button" class="btn btn-warning pastRecoButton" onclick="restartHistory()"/>
							</div>

			</div>
			<div class="ibox-content historyibox" id="ibox-content">



<c:forEach items="${historyList}" var = "history">
<div   onclick="window.open('historyDetail.do?comNo=${history.taNo}','','width=720, height=810, left=500, top=100');return false;" class="timeline-item width330">
                            <div class="row">
                                <div class="col-4 date">
                                    <i class="fa fa-briefcase"></i>
                                   ${history.taDate}
                                    <br>
                                    <small class="text-navy">${history.ago }</small>
                                </div>
                                <div class="col-7 content top-border">
                                    <p class="m-b-xs"><strong>&lt;${history.taName}&gt;</strong></p>

                                    <p>담당의료진 : &nbsp;&nbsp; ${history.dId}
                                    </p>
                                  <span class="issueContent"> ${history.taContent}</span>


                                </div>
                            </div>
                        </div>
</c:forEach>
















			</div>
		</div>
		<span class="clean"></span>


		<div class="rest">

					<div class="issue">
				<div class="col-md-12" style="padding-right: 0">
					<h3><img alt="중요도" src="<%=request.getContextPath() %>/resources/img/siren.png" style="width:20px; height:20px;">특이사항
					<div class="btn-groups" style="float: right;margin-top: -22px;margin-right: 15px;">

<%-- 					<a class="view_all" onclick="issueList('${param.coNo}')" style="font-size: 12px;position: relative;top: 20px;"> 전체보기 </a> --%>

<a class="view_all" onclick="issueList('${param.coNo}')"style="font-size: 12px; position: absolute;top: 19px;left: 332px;"><i class="fa fa-bars" style="
    font-size: 20px;
    position: absolute;
    right: -118px;
    top: -20px;
    "></i> </a>

					</div>



					</h3>

					<div class="ibox-content" style="height: 310px;">

						<table class="table">
							<tbody style="">
							<c:forEach items="${myIssueList}" var="issue" varStatus="status" begin="1" end="4" >
									<tr style="height:75px; " onclick="window.open('significantDetail.do?issNo=${issue.issNo}','','width=800, height=440, left=500, top=100');return false;" type="button">
									<td>
									<div class="picDiv">
									<img src="<%=request.getContextPath()%>/doctor/getPic?dId=${issue.dId}" alt="" class="medipic">
									<span class="docName" style ="position: absolute; left: 90px;">${issue.dName}</span>
									</div>
									</td>
									<td	style="width: 390px; padding-top: 1px; ">
										<p><i class="fa fa-clock-o" style="float:right; margin: 4px; margin-top:7px">	<fmt:formatDate value="${issue.mDate}" pattern="yyyy-MM-dd HH:mm"/></i></p>
									<p class="issueContent">${issue.issContent}</p>
									</td>
								</tr>

							</c:forEach>




							</tbody>
						</table>


					</div>
				</div>


			</div>





			<div class="allrest">
				<div class="tabs-container">
					<ul class="nav nav-tabs" style="height: 48px;">
						<li><a class="nav-link active" data-toggle="tab" style="padding-top: 13px;"
							href="#tab-3"> <i class="fa fa-laptop tabicon"></i>로그
						</a></li>
						<li><a style="padding-top: 13px;"class="nav-link" data-toggle="tab" href="#tab-4"><i
								class="fa fa-user-md tabicon"></i>의료진</a></li>
						<li><a class="nav-link" data-toggle="tab" href="#tab-5" style="padding-top: 13px;"><i
								class="fa fa-archive tabicon"></i>자료실</a></li>
					</ul>
					<div class="tab-content">
						<div id="tab-3" class="tab-pane active">
							<div class="panel-body" style="height: 312px; padding-left:5px">

									<c:forEach items="${logHistory }" var="i">
										<c:if test="${i.hiCla eq '1' }">
								<div class="stream-small" style="cursor: pointer;" onclick="window.open('doctorDetail.do?${i.hiReference}','','width=777, height=485, left=500, top=100');return false;">
                                    <span class="label label-warning">협진요청</span>
                                    <span class="text-muted"> <fmt:formatDate value="${i.hiDate}" pattern="yyyy-MM-dd HH:mm"/> </span> / <a>${i.dName }</a><br><h5>${i.dName }님께서 ${i.hiContent }</h5>
                                </div>
										</c:if>
										<c:if test="${i.hiCla eq '2' }">

								<div class="stream-small"  style="cursor: pointer;"  onclick="window.open('historyDetail.do?comNo=${i.hiReference}','','width=720, height=810, left=500, top=100')">
                                    <span class="label label-success"> Comment&nbsp;<i class="fa fa-commenting-o"></i></span>
                                    <span class="text-muted"><fmt:formatDate value="${i.hiDate}" pattern="yyyy-MM-dd HH:mm"/> </span> / <a>${i.dName }</a><br><h5>${i.hiContent }</h5>
                                </div>

										</c:if>
										<c:if test="${i.hiCla eq '3' }">

								<div class="stream-small"  style="cursor: pointer;"  onclick="window.open('historyDetail.do?comNo=${i.hiReference}','','width=720, height=810, left=500, top=100')">
                                    <span class="label label-success"> Comment&nbsp;<i class="fa fa-sliders bg-success"></i></span>
                                    <span class="text-muted"><fmt:formatDate value="${i.hiDate}" pattern="yyyy-MM-dd HH:mm"/> </span> / <a>${i.dName }</a><br><h5>${i.hiContent }</h5>
                                </div>


										</c:if>
										<c:if test="${i.hiCla eq '4' }">

								<div class="stream-small"  style="cursor: pointer;"  onclick="window.open('historyDetail.do?comNo=${i.hiReference}','','width=720, height=810, left=500, top=100')">
                                    <span class="label label-success">Comment&nbsp;<i class="fa fa-sliders bg-success"></i></span>
                                    <span class="text-muted"><fmt:formatDate value="${i.hiDate}" pattern="yyyy-MM-dd HH:mm"/> </span> / <a>${i.dName }</a><br><h5>${i.hiContent }</h5>
                                </div>


										</c:if>
										<c:if test="${i.hiCla eq '5' }">
							<div class="stream-small"  style="cursor: pointer;"   onclick="window.open('significantDetail.do?issNo=${i.hiReference}','','width=800, height=440, left=500, top=100')"">
                                    <span class="label label-primary">특이사항&nbsp;<i class="fa fa-pencil"></i></span>
                                    <span class="text-muted"> <fmt:formatDate value="${i.hiDate}" pattern="yyyy-MM-dd HH:mm"/></span> / <a>${i.dName }</a><br><h5>${i.hiContent }</h5>
                            </div>


										</c:if>

									</c:forEach>

							</div>
						</div>
						<div id="tab-4" class="tab-pane">
							<div class="panel-body">
							<a id="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                               <i class="fa fa-cog"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user" x-placement="bottom-start" style="position: absolute; top: 18px; left: 26px; will-change: top, left;">
                                <li><a    onclick="window.open('doctorInvite2.do?coNo=${coNo}&dId=${dId}','','width=1100, height=700, left=500, top=100');return false;" class="dropdown-item  ">의료진 초대</a>


                                </li>
								<c:if test="${coDoc ne dId}">
								<c:if test="${!empty myTaskList}"><!-- 진료가 남아있을 경우 탈퇴불가! -->
                                <li data-toggle="modal" data-target="#myModal4"><a href="#" class="dropdown-item">협진 탈퇴</a> </li>
								</c:if>
								</c:if>
								<c:if test="${empty myTaskList}">
								<li><a href="javascript:goHome()" class="dropdown-item">협진 탈퇴</a></li>
								</c:if>


                                <li onclick="window.open('cooperover.do','','width=800, height=540, left=500, top=100');return false;" ><a href="#" class="dropdown-item">협진 종료</a></li>
                            </ul>

                            <!-- 협진 탈퇴 시 업무 남아있을 경우 모달창 -->
                              <div class="modal inmodal" id="myModal4" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content animated fadeIn">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <i class="fa fa-clock-o modal-icon"></i>
                                            <h5 class="modal-title" style="color:red;">탈퇴 불가!</h5>
                                            <small style="font-size: 1.1em;">아래의 진료들이 남아있어 협진 탈퇴가 불가합니다.<br>인수인계를 진행해주세요</small>
                                        </div>
                                        <div class="modal-body">
                                           <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>날짜</th>
                                    <th>의료행위</th>

                                </tr>
                                </thead>
                                <tbody>
<c:forEach items="${myTaskList}" var="mytask" varStatus="status">
                                <tr onclick="window.open('reserveDetail.do?comNo=${mytask.taNo}','','width=800, height=650, left=500, top=100');return false;">
                                <input type = "hidden" value="${mytask.taNo}"/>
                                    <td>${status.count}</td>
                                    <td>${mytask.taDate}</td>
                                    <td>${mytask.taName}</td>

                                </tr>
</c:forEach>
                                </tbody>
                            </table>
                                        </div>
                                        <div class="modal-footer">
                                      <!--      <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>-->
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫 기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


							<table class="table table-bordered" class="logtable">

						<tbody>

<c:forEach items="${coDocList}" var="codoc">
						<tr  style="cursor: pointer;"   onclick="window.open('doctorDetail.do?dId=${codoc.dId}&coNo=${codoc.coNo}','','width=777, height=485, left=500, top=100');return false;" >
									<td class="download">

								<div class="medidisc"><img src="<%=request.getContextPath()%>/doctor/getPic?dId=${codoc.dId}" alt="" class="medipic"></div>

								<div class="loginfo" style="width: 70%;">
								<p>의료진명 : ${codoc.dName}</p>
								<p>담당분야 : ${codoc.maName}</p>
								<p>상태 : ${codoc.statusResult}</p>
								</div>

								</td>

							</tr>
</c:forEach>
						</tbody>
					</table>

							</div>
						</div>
						<div id="tab-5" class="tab-pane">
							<div class="panel-body">
								<table class="table table-bordered" id="recordtable">

									<tbody>
										<c:forEach items="${medFileList}" var="i">
										<tr>
											<td class="download">

												<div class="disc">
													<a href="<%=request.getContextPath()%>/medi/getFile?mfNo=${i.mfNo}"><i class="fa fa-file "></i></a>
												</div>
												<div class="fileinfo">
													<p>														<label>파일명 : ${i.mfFilename } </label>
													</p>
													<p>
														<label>등록일 : ${i.mDate}</label>
													</p>
													<p>
														<label>작성자 : </label>${i.dId}
													</p>
												</div>
											</td>
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





	<!-- containter /div -->

<div class="wrapper wrapper-content" style="background: white; margin-top: 2%;">
            <div class="row">
           		 <div class="col-sm-6">
           		 <img alt="" src="https://cdn-icons-png.flaticon.com/128/4706/4706857.png" style="width: 25px">
<p style="font-size: 15px; display: inline; margin-left: 2%; font-weight: bold; vertical-align: -2px;">자주
						찾는 협진</p>
				</div>

			</div>
			<hr style="width: 95%">
            <div class="row justify-content-md-center" style="padding-top: 0%;width: 100%;">
                <div class="col-lg-11">
				<div class="slick_demo_2">

         <c:forEach items="${coFreqList}" var="cofreq">

                     <div style="color: white; margin-top: 8px; float: left; height:153px; margin-left: 13px;"
                        onclick="subgoPage('/cooperation/detail.do?coNo=${cofreq.coNo}')">


                        <c:if test="${cofreq.coDoc eq dId}">
                           <div class="joinBox"
                              style="background-color:   #1ab394; border-radius: 12%;">
                        </c:if>
                        <c:if test="${cofreq.coDoc ne dId}">
                           <div class="joinBox"
                              style="background-color: #1ab394; border-radius: 12%;">
                        </c:if>
                        <div class="panel-body" style="text-align: center; font-size: 12px;">
											<div>
											<img alt="프로필" class="rounded-circle" src="<%=request.getContextPath()%>/doctor/getPic?dId=${cofreq.dId}" style="width: 40px; height: 40px; float:left; vertical-align: -3px;">
												<div class="docInfo">
													<h5>${cofreq.dName}</h5>

													<h5>${cofreq.maName}
													<c:if test="${cofreq.coDoc eq dId}">
						<i class="fa fa-user-md" style="float:right; font-size: 16px; margin-right:2px;position: relative;top: -25px;"></i>
                        </c:if>
														</h5>
												</div>
			</div>
                           <p style="text-align: left"><strong>${cofreq.pName}&nbsp;&nbsp;${cofreq.pRnum}</strong></p>

                           <p style="text-align: left; margin-top: 3px;">
                              <strong> 주상병:&nbsp;
							<span data-tooltip="${cofreq.coDisease}"> ${fn:substring(cofreq.coDisease,0,9) }</span></strong>
                           </p>
                        </div>
                     </div>
               </div>
             	  </c:forEach>


                    </div>
                </div>
               </div>



	</div>

</div>
<!-- container div -->
<script
		src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>

//나의 진료 눌렀을 때 찍히는 템플릿!

<script type="text/x-handlebars-template"  id="reply-list-template" >

{{#each .}}

<tr onclick="window.open('reservationDetail.do?taNo={{taNo}}','','width=800, height=650, left=500, top=100');return false;"">
									<td class="time">{{taDate}}</td>
									<td>{{dName}}</td>
									<td>{{taName}}</td>
									<td style="padding-left: 0px;">
{{#isFlag vodId dId }}
							<div class="progress">
                                <div class="progress-bar-success" style="width: {{progressPercentage}}%" role="progressbar" aria-valuenow="43" aria-valuemin="60" aria-valuemax="100"></div>
                            </div>
{{else}}
						<div class="progress">
                                <div class="progress-bar-info" style="width: {{progressPercentage}}%" role="progressbar" aria-valuenow="43" aria-valuemin="60" aria-valuemax="100"></div>
                            </div>
{{/isFlag}}


								</td>
								</tr>

{{/each}}

</script>


<script type="text/x-handlebars-template"  id="date-history-template" >

{{#each .}}
<div   onclick="window.open('historyDetail.do?comNo={{taNo}}','','width=720, height=810, left=500, top=100');return false;" class="timeline-item width330">
                            <div class="row">
                                <div class="col-4 date">
                                    <i class="fa fa-briefcase"></i>
                                   {{taDate}}
                                    <br>
                                    <small class="text-navy">{{ago}}</small>
                                </div>
                                <div class="col-7 content top-border">
                                    <p class="m-b-xs"><strong>&lt;{{taName}}&gt;</strong></p>

                                    <p>담당의료진 : &nbsp;&nbsp; {{dId}}
                                    </p>
                                    <span class="issueContent">{{taContent}}</span>


                                </div>
                            </div>
                        </div>
{{/each}}
</script>




<script type="text/javascript" src="http://www.datejs.com/build/date.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/plugins/slick/slick.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/slick/slick.min.js"></script>

 <!-- Sweet alert -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

<script>

Handlebars.registerHelper('isFlag', function(arg1, arg2, options) {
	 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
});


</script>



	<script>
	//초기화 시키기
	function restartHistory(){
		var coNo = '${coNo}';

		$.ajax({
			url:'restartHistory.do',
			data:{'coNo':coNo},
			dataType:'json',//받는타입
			success:function(data){
				console.log("restart==>"+data[0].taDate);
				//date-history-template
	            $('.timeline-item').remove();
	        	var template=Handlebars.compile($('#date-history-template').html());
				var html = template(data);
				$('.historyibox').html(html);
				$('.datepicker').val('   YYYY - mm - dd');
			}
		})


	}

	//히스토리 날짜 검색
	function datePic(){
		var date = $('.datepicker').val();

		var coNo = '${coNo}';
		console.log("선택한 날짜==>"+date);

		$.ajax({
			url:'historySearch.do',
			data:{'date':date,
				'coNo':coNo
			},
			dataType:'json',//받는타입
			success:function(data){

				console.log("히스토리날짜검색"+data);
            //console.log("성공결과"+data[0].taDate);
			//검색결과가 없으면


            //date-history-template
            $('.timeline-item').remove();
        	var template=Handlebars.compile($('#date-history-template').html());

			var html = template(data);
			$('.historyibox').html(html);

			},
			error :function(){
			//	alert("에러~!");
// 				 $('.timeline-item').remove();
// 				 $('.historyibox p').remove();
$('.historyibox').empty();
	 $( '.historyibox').append('<p style="text-align: center;position: relative;top: 15px;">검색결과가 없습니다</p>');

			}
		})
	}

	function issueList(coNo){
		window.open("issueAllList.do?coNo="+coNo, "","width=800, height=500, left=500, top=200")
	}
	function detailImg(data){
		window.open("detailImg?mpNo="+data, "","width=800, height=700, left=500, top=200")
	}
		$(document).ready(function() {

	//나의진료보기 아이체크 했을때!
    $('.i-checks').on('ifChecked',function(event){ //나의 진료 보기
    	// alert('${coNo}');
 		var coNo = '${coNo}';
		console.log("coNo==>"+coNo);



    	 $.ajax({
    		url : 'myTaskChecked.do',
    		data: {'coNo':coNo},
    		dataType:'json', //받는 타입
    		type:'POST',
    		success : function(data){
    			console.log(data);
    			var sessionId = $('#sessionId').attr('userId');
    			//alert(sessionId);
    			$("tbody#taskTable tr").remove();
    			var template=Handlebars.compile($('#reply-list-template').html());

    			var html = template(data);
    			$('tbody#taskTable').html(html);

    		},
    		error: function(){
    			alert('실패');
    		}

    	})
    });


    //아이체크 풀었을 때!
    $('.i-checks').on('ifUnchecked',function(event){
    	// alert("언체크 표시");
     //	alert('${coNo}');
 		var coNo = '${coNo}';
		console.log("coNo==>"+coNo);



    	 $.ajax({
    		url : 'myTaskUnChecked.do',
    		data: {'coNo':coNo},
    		dataType:'json', //받는 타입
    		type:'POST',
    		success : function(data){
    			console.log("unchecked==>"+data);
    			$("tbody#taskTable tr").remove();
    			var template=Handlebars.compile($('#reply-list-template').html());

    			var html = template(data);
    			$('tbody#taskTable').html(html);

    		},
    		error: function(){
    			alert('실패');
    		}

    	})
    });
			$('.i-checks').iCheck({

				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});

        $('.demo3').click(function () {
            swal({
                title: "협진을 탈퇴하시겠습니까?",
                text: "",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "탈퇴하기",
                closeOnConfirm: false
            }, function () {
                swal("탈퇴되셨습니다!");
                setTimeout(function(){
		              window.location.reload();
	            },1000);
            });
        });

        $('.slick_demo_2').slick({
            infinite: false,
            slidesToShow: 5,
            slidesToScroll: 2,
            centerMode: false,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                        infinite: true,
                        dots: true
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }
            ]
        });

        $(function(){
		    $('.datepicker').datepicker({
		    	dateFormat : 'yy-mm-dd'
		    });
		  })

     function hello(){
        	alert("정상작동");
        }


        function goHome(){//협진탈퇴하기 버튼이 먹혔을 때
//alert("협진탈퇴!");

	var dId = '${dId}';
	var coNo = '${coNo}';

	var data = {
		"dId":dId,
		"coNo":coNo
	};

	$.ajax({
		url:'coExit.do',
		data : JSON.stringify(data),
		contentType: "application/json; charset=UTF-8",
		type:'POST',
		success:function(res){
			window.location.href = '<%=request.getContextPath()%>/main/index.do';
		},
		error:function(){
			alert("실패!");
		}


	})


        }

	</script>




</body>
</html>
