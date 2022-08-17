<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="cri" value="${dataMap.pageMaker.cri}" />
<c:set var="cooList" value="${dataMap.cooList}" />
<c:set var="dId" value="${dId}"/>


<c:set var="issueList" value="${issueList}" />
<c:set var="historyCommentList" value="${historyCommentList}" />
<c:set var="notiList" value="${notiList}" />
<c:set var="approveList" value="${approveList}" />
<c:set var="myApproveList" value="${myApproveList}" />
<c:set var="approveCompleteList" value="${approveCompleteList}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Sweet Alert -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

 <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">

<!-- <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script> -->



<style>
* {
}

/* [data-tooltip-text]:hover { */
/*    position: relative; */
/* } */
/* [data-tooltip-text]:hover:after { */
/*    content: attr(data-tooltip-text); */

/*     position: absolute; */
/*    bottom: 100%; */
/*    left: 0; */

/*     background-color: rgba(0, 0, 0, 0.8); */
/*    color: #FFFFFF; */
/*    font-size: 12px; */

/*    z-index: 9999; */
/* } */

/* TOOLTIP */
[data-tooltip]{position:relative;}
[data-tooltip]:before,
[data-tooltip]:after{visibility:hidden;opacity:0;position:absolute;left:50%;transform:translateX(-50%);white-space:nowrap;transition:all .2s ease;font-size:11px;font-family:dotum;letter-spacing:-1px;}
[data-tooltip]:before{content:attr(data-tooltip);height:22px;position:absolute;top:-20px;padding:5px 10px;border-radius:5px;color:#fff;background:#025272;box-shadow:0 3px 8px rgba(165, 165, 165, 0.5);}
[data-tooltip]:after{content: '';border-left:5px solid transparent;top:2px;border-right:5px solid transparent;border-top:5px solid #025272;}
[data-tooltip]:not([data-tooltip=""]):hover:before{visibility:visible;opacity:1;top:-30px}
[data-tooltip]:not([data-tooltip=""]):hover:after{visibility:visible;opacity:1;top:-8px}

.landing-page.pace .pace-progress {
   background: none;
   position: none;
   z-index: -;
   top: 0;
   left: 0;
   height: 2px;
   -webkit-transition: none;
   -moz-transition: none;
   -o-transition: none;
   transition: none;
}

.pace .pace-progress {
   background: none;
   position: fixed;
   z-index: -1;
   top: 0;
   right: 100%;
   width: 100%;
   height: 2px;
}



#coco tr{
border-bottom: hidden;
    overflow: hidden;
    height: 90px;
}

   .joinBox .panel-body {
    text-align: center;
    font-size: 12px;
     padding: 0px;
    height: 119px;
    padding-top: 7px;
}


.m-t-xs {
    margin-top: 5px;
    margin-left: 0px;
    text-align: center;
}

img {
    vertical-align: middle;
    border-style: none;
    width: 45px;
    height: 45px;
    border-radius: 60%;
}


.container {
   max-width: none;
}

.row {
   margin-bottom: -10px;
   margin-top: 5px;
}

.col-md-3, .col-md-4, .col-md-5, .col-md-9, .col-md-8 {
   padding-left: 5px;
   padding-right: 5px;
   height: 400px;
}
.col-md-6{
padding-bottom: 15px;
}

.col-3 {
   height: 63px;
}

.ibox-content {
   padding: 0px;
}

.list-group.clear-list .list-group-item {
   padding: 2px;
}

.btn btn-primary btn-rounded {
   color: white;
   padding: 10px 10px;
}

.p-xs {
   padding: 5px;
   width: 30%;
   text-align: center;
   font-size: 2.5em;
}

.btn-group {
   float: middle;
}

.input-group {
   width: 50%;
}

.contact-box {
   padding: 1px;
   margin-bottom: 1px;
   height:78.5px;
}

element.style {
   display: inline-block;
}
.input-group{
   float: right;
   margin-bottom: 7px;
}


.btn-group_1 {
    text-align: center;
    position: absolute;
    bottom: 40px;
    left: 40%;
}


.btn-group_2{
text-align:center;
margin-top: -15px;
}



p {
    margin-top: 0;
    margin-bottom: 0.2rem;
}

.joinBox {
    width: 194px;
    height: 132px;
    margin-bottom: 3px;
    font-size: 1.08em;
    margin-left: 5px;
    margin-top: 3px;
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
    margin-right: -185px;
}
</style>
</head>

<body>

   <div class="container">
      <h3 style="margin-left: 10px; margin-top: 9px;">My 협진</h3>
      <hr style="margin-bottom: 29px; margin-top: 1px;"></hr>


      <div class="row" style="margin-top: -40px;">
            <div class="col-md-7" style="margin-bottom: 7px;">


               <div class="ibox-content" style="width:97%;min-height: 368px;">

<div class="top ibox">
                   <div class="" style="float: left; font-size: 12px;"><h3 style="margin-left: 23px;">참여중인 협진
<%--                    <a onclick="subgoPage('/cooperation/detail.do?coNo=${coo.coNo}')"></a><i class="fa fa-arrow-circle-o-right"></i></a></h3> --%>
<a onclick="subgoPage('/colist/proceedingCooperation.do?chkSelectMine=Y')"><i class="fa fa-arrow-circle-o-right" style="font-size: 18px;"></i></a></h3>
                   </div>

             <div id="keyword" class="card-tools" style="width:450px;">
               <div class="input-group row">
                  <select  style="height: auto;"class="form-control col-md-4" name="searchType" id="searchType">
                     <option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
                     <option value="t" ${cri.searchType eq 't' ? 'selected':'' }>환자이름</option>
                     <option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>주상병</option>
                     <option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>주치의</option>
                  </select>
                  <input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword}"/>
                  <span class="input-group-append">
                     <button class="btn btn-default" type="button" onclick="list_go(1);"
                     data-card-widget="search">
                        <i class="fa fa-fw fa-search"></i>
                     </button>
                  </span>
               </div>
            </div>



               </div>


<div >
                  <c:forEach items="${cooList}" var="coo">

                     <div style="color: white; margin-top: 8px; float: left; height:135ㄴpx; margin-left: 13px; cursor: pointer;"
                        onclick="subgoPage('/cooperation/detail.do?coNo=${coo.coNo}')">

                           <div class="joinBox"
                              style="background-color: #1ab394; border-radius: 12%;">

                        <div class="panel-body" style="text-align: center; font-size: 12px;">




<div>
                                 <img alt="프로필" class="rounded-circle" src="<%=request.getContextPath()%>/doctor/getPic?dId=${coo.coDoc}" style="width: 40px; height: 40px; text-align: left; vertical-align: -3px;">
                                    <div style="width:120px; display: inline-block; text-align: left;">
                                       <h5>${coo.dName}
                      <c:if test="${ !empty coo.cofRegdate}">
                           <a onclick="freqCancel('${coo.coNo}','${dId}',event);"> <i
                              class="fa fa-star"
                              style="font-size: 1.45em; color: #ffe200;  z-index: 1; float:right; margin-right:-2px;"></i></a>

                              </c:if>

                        <c:if test="${ empty coo.cofRegdate}">
                           <a onclick="freqRegist('${coo.coNo}','${dId}',event);"> <i
                             class="fa fa-star"
                              style="font-size: 1.45em; color: #e9ecef;z-index: 1; float:right;margin-right:-2px; "></i></a>
                        </c:if>

                                          </h5>
                                       <h5>${coo.maName}
                                       <c:if test="${coo.coDoc eq dId}">
                  <i class="fa fa-user-md" style="float:right; font-size: 16px; margin-right:2px"></i>
                        </c:if>
                                          </h5>
                                    </div>
                                    </div>
<hr>
<div style="text-align: left;
    margin-left: 10px;">

                           <p style="text-align: 3px 3px 6px black;margin-top: 0px;margin-bottom: 0px;"><strong>${coo.pName}&nbsp;&nbsp;${fn:substring(coo.pRnum,0,8)}</strong></p>
                           <p style="float: left;margin-top: 6px;">
                              <strong> 주상병:&nbsp;
<span data-tooltip="${coo.coDisease}"> ${fn:substring(coo.coDisease,0,12) }</span></strong>
                           </p>
     </div>








                           <hr style="visibility: hidden;">
<!--                            <p> -->
<!--                               <strong>최근진료일</strong><br> -->
<%--                               <fmt:formatDate value="${coo.maxDate}" pattern="yyyy-MM-dd" /> --%>
<!--                            </p> -->
                        </div>

                     </div>
               </div>


               </c:forEach>












            </div>



<br>
<div style="position: absolute;
    top: 90.7%;
    left: 34%;">
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
<br>
               </div>
            </div>

            <div class="col-md-5">



               <div class="ibox-content" style="width: 108%;
 min-height: 368px;
    margin-left: -36px;
    margin-top: 26px;">
 <div  style="font-size: 12px; margin-bottom: 10px; margin-left: 8px;" ><h3><img src="/ddit/resources/img/siren.png" style="font-size: 5px;margin-left: 7px;color: #ed5565;width: 20px;height: 20px;margin-top: 10px;">
 <span style="position: absolute;top: 38px;left: 10px;">특이사항</span></h3>
 </div>
<a class="view_all" onclick="issueMainListForm()" style="font-size: 12px; position: absolute;top: 19px;left: 332px;"><i class="fa fa-bars" style="font-size: 20px;position: absolute;right: -148px;top: 14px;"></i> </a>
<!--                <a class="view_all" onclick="issueMainListForm()" style="float: right;font-size: 12px;position: absolute;left: 537px;top: 6px;"> 전체보기 </a> -->


<table class="table coco">
                     <thead style="">
                     <c:forEach items="${issueList}" var="issue" varStatus="status" begin="0" end="3">
<c:if test="${!empty issue.issContent}">
                   <tr style="border-bottom: hidden;overflow: hidden;height: 75px;margin-bottom: -18px; cursor: pointer;" onclick="window.open('significantDetail.do?issNo=${issue.issNo}','','width=605, height=440, left=500, top=100');return false;" >
                           <th
                              style="display: inline-block;padding-left: 14px;border-bottom: hidden;width: 100%;padding-bottom: 5px;line-height: 20px;">

                                    환자명 :${issue.pName}&nbsp;${issue.pRnum}
                                       <span style="float:right;"><small class="text-muted">작성의료진:${issue.dName}
                                       <i class="fa fa-clock-o" ></i>
                              ${issue.mDate}</small>
                              </span>

                                    <br>
<%-- <span data-tooltip="${issue.coDisease}">주상병:${fn:substring(issue.coDisease,0,9)}</span> --%>
<span>주상병:${issue.coDisease}</span>

                              </th>
                           <td
                              style="    padding-bottom: 3px; display: inline-block;border-top: hidden;width: 500px;padding-top: 1px;margin-left: 1%;line-height: 20px;letter-spacing: 0.5px;">
<c:choose>
  <c:when test="${fn:length(issue.issContent) gt 90}">
   <c:out value="${fn:substring(issue.issContent,0,90)}" />...
  </c:when>
  <c:otherwise>

<c:out value="${issue.issContent}" />
  </c:otherwise>
</c:choose>




                           </td>
                        </tr>
</c:if>

                     </c:forEach>




                     </thead>
                  </table>




               </div>
            </div>
         </div>


         <div class="row" style="margin-top: 12px;margin-left: -5px;width: 102%;">

      <div class="" style=" padding-right: 5px; padding-left: 5px;">
                <div class="ibox-content" style="width:375px;">

                <div class="" style="margin-left: 8px;padding-top: 7px;" ><h3>협진요청</h3>
            <a class="view_all" onclick="notiAllList()" style="font-size: 12px; position: absolute;top: 19px;left: 332px;"><i class="fa fa-bars" style="
    font-size: 20px;
    position: relative;
    right: -25px;
    top: 435px;
    "></i></a>
         </div>

                    <div class="tabs-container" style=" margin-top: 13px;">
<!--                          <a class="view_all" onclick="notiAllList()" style="font-size: 12px; position: absolute;top: 19px;left: 332px;"><i class="fa fa-bars" style="font-size: 20px;position: absolute;right: -45px;top: -7px;"></i> </a> -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li><a class="nav-link active" data-toggle="tab" href="#tab-1">받은요청</a></li>
                            <li><a class="nav-link " data-toggle="tab" href="#tab-2">보낸요청</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" id="tab-1" class="tab-pane active">
                                <div class="panel-body" style="height: 360px;">

   <table class="table table-hover">
                     <thead>
                        <tr style="text-align: center;">
                           <th width="23%;">요청날짜</th>
                           <th width="35%;">요청한 사람</th>
                           <th width= "20%;">상태</th>

                        </tr>
                     </thead>

                     <tbody>

                     <c:forEach items="${notiList}" var="noti"  varStatus="status" begin="0" end="7">

<tr onclick="window.open('cooperationRequest.do?notiNo=${noti.notiNo}&mysetting=${noti.mysetting}','','width=590, height=612, left=500, top=100');return false;" style="cursor: pointer;">
                           <td><i class="fa fa-clock-o"></i><fmt:formatDate value="${noti.notiDate}" pattern="yyyy-MM-dd"/></td>
<%-- <c:set var = "nameLength" value="${fn:length(noti.reqdName)}"/> --%>
<%-- <c:set var = "maLength" value = "${fn:length(noti.maName}"/> --%>

<%-- <c:if test= "${nameLength + maLength  > 5}"> --%>
<%--    <td>${noti.reqdName}/${noti.maName}</td> --%>
<%-- </c:if> --%>



                            <td>${noti.reqdName}/${noti.maName}</td>

                           <c:if test="${noti.mysetting eq'수락'}">
                                     <td style="text-align: center"><span class="label label-success">수락</span></td>
                           </c:if>
                           <c:if test="${noti.mysetting eq'거절'}">
                                     <td style="text-align: center"><span class="label label-warning">거절</span></td>
                           </c:if>

                           <c:if test="${noti.mysetting eq'보류'}">
                           <td style="text-align: center"><span class="label label-default">보류</span></td>
                              </c:if>
                        </tr>
</c:forEach>

                     </tbody>
                  </table>

                                </div>
                            </div>
                            <div role="tabpanel" id="tab-2" class="tab-pane">
                                <div class="panel-body" style="height: 360px;">


   <table class="table table-hover">
                     <thead>
                        <tr style="text-align: center">
                           <th width="23%;">요청날짜</th>
                           <th width="35%;">요청받은 사람</th>
                           <th width= "20%;">상태</th>

                        </tr>
                     </thead>

                     <tbody>

   <c:forEach items="${notiReqList}" var="notiReq" varStatus="status" begin="0" end="7">

<tr onclick="window.open('cooperationRequestCheck.do?notiNo=${notiReq.notiNo}&mysetting=${notiReq.mysetting}','','width=590, height=612, left=500, top=100');return false;" style="cursor: pointer;">
                           <td><i class="fa fa-clock-o"></i><fmt:formatDate value="${notiReq.notiDate}" pattern="yyyy-MM-dd"/></td>

<c:choose>

<c:when test= "${fn:length(notiReq.resdName += ' ' += notiReq.maName) >10 }">
   <td data-tooltip="${notiReq.resdName+='/'+=notiReq.maName}">${fn:substring(notiReq.resdName += '/' += notiReq.maName,0,10)}</td>
</c:when>
<c:otherwise>
<td>${notiReq.resdName}/${notiReq.maName}</td>
</c:otherwise>
</c:choose>
<%--                            <td>${notiReq.resdName}/${notiReq.maName}</td> --%>
                           <c:if test="${notiReq.mysetting eq'수락'}">
                                     <td style="text-align: center"><span class="label label-success">수락</span></td>
                           </c:if>
                           <c:if test="${notiReq.mysetting eq'거절'}">
                                     <td style="text-align: center"><span class="label label-warning">거절</span></td>
                           </c:if>

                           <c:if test="${notiReq.mysetting eq'보류'}">
                           <td style="text-align: center"><span class="label label-default">보류</span></td>
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
            </div>

            <div  style="padding-right: 7px; width: 410px;">
                <div class="ibox-content">

                <div class="" style="margin-left: 8px;padding-top: 7px;" ><h3 style="display: inline-block;">의료행위요청</h3>

         </div>

                    <div class="tabs-container" style="margin-top: 3px;">
                          <a class="view_all" onclick="commentMainListForm()" style="font-size: 12px; position: absolute;top: 19px;left: 332px;"><i class="fa fa-bars" style="
   font-size: 20px;
    position: relative;
    right: -435px;
    top: 435px;"></i> </a>
                        <ul class="nav nav-tabs" role="tablist">
                            <li><a class="nav-link active" data-toggle="tab" href="#tab-3">받은요청</a></li>
                            <li><a class="nav-link " data-toggle="tab" href="#tab-4">보낸요청</a></li>
                             <li><a class="nav-link " data-toggle="tab" href="#tab-5">처리한요청</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" id="tab-3" class="tab-pane active">
                                <div class="panel-body" style="height: 360px;">

   <table class="table table-hover">
                     <thead>
                        <tr>
                           <th width="34%;">환자정보</th>
                           <th width="33%;">주상병</th>
                           <th width= "20%;">요청</th>
                           <th>분류</th>
                        </tr>
                     </thead>

                     <tbody>

                     <c:forEach var="approve" items="${approveList}" varStatus= "status" begin="0" end="7" >
                     <tr  style="cursor: pointer;" id="${approve.taNo}"onclick="window.open('approveRegistDetail.do?taNo=${approve.taNo}&tnNo=${approve.tnNo}','','width=950, height=610, left=500, top=100');return false;">
                           <td>${approve.pName}&nbsp;${approve.pRnum}</td>
<!--                            &&taNo==>${approve.taNo}" -->
                           <td data-tooltip="${approve.coDisease}">${fn:substring(approve.coDisease,0,9)}</td>
                           <td>${approve.reqdName}</td>
                           <td>${approve.tnStatusResult}</td>
                        </tr>
                     </c:forEach>

                     </tbody>
                  </table>

                                </div>
                            </div>
                            <div role="tabpanel" id="tab-4" class="tab-pane">
                                <div class="panel-body" style="height: 360px;padding-left: 10px;padding-right: 2px;">

   <table class="table table-hover">
                     <thead>
                        <tr>
                           <th width="38%;">환자정보</th>
                           <th width="40%;">주상병</th>
                           <th width= "20%;">주치의</th>
                           <th>상태</th>
                        </tr>
                     </thead>

                     <tbody>

                     <c:forEach var="myapprove" items="${myApproveList}" varStatus="status" begin="0" end="7">

                     <tr style="cursor: pointer;" onclick="window.open('reserveDetail.do?taNo=${myapprove.taNo}&taStatusResult=${myapprove.taStatusResult}','','width=620, height=490, left=500, top=100');return false;" >
                           <input type= "hidden" value = "밸류값은${myapprove.taStatusResult}"/>
                           <td>${myapprove.pName}&nbsp;${myapprove.pRnum} </td>
<%--                            <td data-tooltip="${myapprove.coDisease}">${myapprove.coDisease}</td> --%>
                           <td data-tooltip="${myapprove.coDisease}">${fn:substring(myapprove.coDisease,0,9)}</td>
                           <td>${myapprove.coDocName}</td>
                           <c:if test="${myapprove.taStatusResult eq '미승인'}">
                           <td><span class="label label-default">미승인</span></td>
                           </c:if>
                           <c:if test="${myapprove.taStatusResult eq '수락'}">
                              <td><span class="label label-success">수락</span></td>
                           </c:if>
                           <c:if test="${myapprove.taStatusResult eq '거절'}">
                                <td><span class="label label-warning">거절</span></td>
                           </c:if>
                           <c:if test="${myapprove.taStatusResult eq '삭제완료'}">
                                <td><span class="label label-success">삭제완료</span></td>
                           </c:if>
                        </tr>

<%-- <c:choose> --%>
<%--   <c:when test="${myapprove.taStatusResult eq '수락'}"> --%>
<%--                          <tr onclick="window.open('reserveDetail.do?taNo=${myapprove.taNo}&taStatusResult=${myapprove.taStatusResult}','','width=620, height=490, left=500, top=100');return false;" > --%>
<%--                            <input type= "hidden" value = "${myapprove.taStatusResult }"> --%>
<%--                            <td>${myapprove.pName}&nbsp;${myapprove.pRnum} </td> --%>
<%--                            <td>${myapprove.coDisease}</td> --%>
<%--                            <td>${myapprove.coDocName}</td> --%>
<%--                            <c:if test="${myapprove.taStatusResult eq '미승인'}"> --%>
<!--                            <td><span class="label label-default">미승인</span></td> -->
<%--                            </c:if> --%>
<%--                            <c:if test="${myapprove.taStatusResult eq '수락'}"> --%>
<!--                               <td><span class="label label-success">수락</span></td> -->
<%--                            </c:if> --%>
<%--                            <c:if test="${myapprove.taStatusResult eq '거절'}"> --%>
<!--                                 <td><span class="label label-warning">거절</span></td> -->
<%--                            </c:if> --%>
<%--                            <c:if test="${myapprove.taStatusResult eq '삭제완료'}"> --%>
<!--                                 <td><span class="label label-success">삭제완료</span></td> -->
<%--                            </c:if> --%>
<!--                         </tr> -->

<%--   </c:when> --%>
<%-- <c:otherwise> --%>
<%--                         <tr onclick="window.open('reserveDetail.do?taNo=${myapprove.taNo}&taStatusResult=${myapprove.taStatusResult}','','width=620, height=490, left=500, top=100');return false;"> --%>
<%--                            <td>${myapprove.pName}&nbsp;${myapprove.pRnum} </td> --%>
<%--                            <td>${myapprove.coDisease}</td> --%>
<%--                            <td>${myapprove.coDocName}</td> --%>
<%--                            <td>${myapprove.taStatusResult}</td> --%>
<!--                         </tr> -->

<%--   </c:otherwise> --%>
<%-- </c:choose> --%>


</c:forEach>


                     </tbody>
                  </table>

                                </div>
                            </div>




                             <div role="tabpanel" id="tab-5" class="tab-pane">
                                <div class="panel-body" style="height: 360px; ">

   <table class="table table-hover">
                     <thead>
                        <tr>
                           <th width="35%;">환자정보</th>
                           <th width="30%;">주상병</th>
                           <th width= "20%;">요청</th>
                           <th>분류</th>
                        </tr>
                     </thead>

                     <tbody>

                     <c:forEach var="approveC" items="${approveCompleteList}" varStatus="status" begin="0" end="7">
<%--                      <tr id="${approveC.taNo}"onclick="window.open('approveRegistDetail.do?taNo=${approveC.taNo}&tnNo=${approveC.tnNo}','','width=940, height=610, left=500, top=100');return false;"> --%>


<c:choose>
  <c:when test="${approveC.taStatusResult eq '수락'}">
                         <tr style="cursor: pointer;" onclick="window.open('reserveDetail.do?taNo=${approveC.taNo}&taStatusResult=${approveC.taStatusResult}','','width=620, height=490, left=500, top=100');return false;">
                           <td>${approveC.pName}&nbsp;${approveC.pRnum}</td>
<!--                            &&taNo==>${approve.taNo}" -->
                           <td data-tooltip="${approveC.coDisease}">${fn:substring(approveC.coDisease,0,8)}</td>
                           <td>${approveC.reqdName}</td>
                           <td>${approveC.tnStatusResult}</td>
                        </tr>

  </c:when>



  <c:otherwise>
                        <tr  onclick="window.open('reserveDetail.do?taNo=${approveC.taNo}&taStatusResult=${approveC.taStatusResult}','','width=620, height=490, left=500, top=100');return false;" >
                           <td>${approveC.pName}&nbsp;${approveC.pRnum}</td>
<!--                            &&taNo==>${approve.taNo}" -->
                           <td>${approveC.coDisease}</td>
                           <td>${approveC.reqdName}</td>
                           <td>${approveC.tnStatusResult}</td>
                        </tr>

  </c:otherwise>
</c:choose>




                     </c:forEach>



                     </tbody>
                  </table>

                                </div>
                            </div>




                        </div>


                    </div>
                </div>
            </div>






<div class="col-md-4" style=" padding-left: 0px;">

<div class = "ibox-content" style=" height: 445px;overflow: auto;overflow-x: hidden;">
<div class="" style="margin-left: 8px;padding-top: 7px;" ><h3 style="
 margin-bottom: 19px;">협진코멘트</h3>
            <a class="view_all" onclick="commentMainListForm()" style="font-size: 12px; position: absolute;top: 19px;left: 332px;"><i class="fa fa-bars" style="
    font-size: 20px;
    position: absolute;
    right: -45px;
    top: -7px;"></i> </a>
         </div>
                                        <div style = "padding-left: 6px;">
                                            <div class="feed-activity-list">



<c:forEach items="${historyCommentList}" var="comment" varStatus="status" begin="0" end="4">

                                                <div class="feed-element" style="padding-bottom: 12px; cursor: pointer;" onclick="window.open('historyDetail.do?comNo=${comment.comNo}','','width=720, height=810, left=500, top=100');return false;" class="timeline-item width330">
                                                    <a class="float-left" href="profile.html">
                                                        <img alt="image" class="rounded-circle" src="<%=request.getContextPath()%>/doctor/getPic?dId=${comment.dId}" style="width: 40px; height: 40px;">
                                                    </a>
                                                    <div class="media-body ">
<!--                                                         <small class="float-right">23h ago</small> -->
                                             <small class="text-muted">${comment.comDate}</small><br>
                                                        <strong>${comment.dName}</strong>님이 <strong>${comment.taDate}의&nbsp;#${comment.taName}</strong>에 댓글을 등록했습니다<br>

                                                        <strong>${fn:substring(comment.comContent,0,31) }</strong>
                                                    </div>
                                                </div>

</c:forEach>

                                        </div>

                                    </div>


</div>


</div>

</div>
</div>


<!-- Mainly scripts -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>





<!-- Sweet alert -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>






   <script>





/* function (){
   window.open("http://localhost/ddit/cooperation/significantDetail.do", "","width=600, height=400, left=500, top=300")
} */

//pagination func
function list_go(page,url){
   if(!url) url="/cooperation/coopermain.do";

   var jobForm=$('#jobForm');
   jobForm.find("[name='page']").val(page);
//   jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
   var searchType = jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
   var keyword = jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
   subgoPage(url+"?page="+page+"&perPageNum=9&searchType="+searchType.val()+"&keyword="+keyword.val());

   /*
jobForm.attr({
   action:url,
   method:'get'
   }).submit();*/

}

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

function freqRegist(coNo,dId,event){

   event.stopPropagation();
      var data = {
            "coNo":coNo,
            "dId": dId
      }
        swal({
              title: "",
              text: "자주찾는협진에 등록하시겠습니까?",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "등록하기",
              cancelButtonText: "등록취소하기",
              closeOnConfirm: false},
              function(){

             $.ajax({
                 url :"<%=request.getContextPath()%>/cooperation/freqRegist"
               , type : "POST"
               , data :    JSON.stringify(data)// 검색 키워드
               , contentType : 'application/json'
               , success : function(data){    // 성공
                   swal("등록되었습니다!","","success");
                 setTimeout(function(){
                           window.location.reload();
                     },1000);
//alert("성공!");

               },error:function(){
                swal("자주찾는협진에 등록 실패!","","error");
               }

               }); //ajax끝
              });
}


   // if (confirm("자주 찾는 협진에 등록하시겠습니까?") == true){    //확인
      // alert(coNo);
       // alert(dId);



// $.ajax({
<%--     url :"<%=request.getContextPath()%>/cooperation/freqRegist" --%>
//   , type : "POST"

//   , data :    JSON.stringify(data)// 검색 키워드
//   , contentType : 'application/json'
//   , success : function(data){    // 성공

// window.location.reload();

//   },error: function(){
// alert("자주찾는등록실패!");
//   }
// })



//     }else{   //취소
//         return false;
//     }




//자주찾는협진에서 삭제하기 !
function freqCancel(coNo,dId,event){
   event.stopPropagation();
//  if (confirm("자주 찾는 협진에서 삭제하시겠습니까?") == true){    //확인
//    // alert(coNo);
//     // alert(dId);
// var data = {
//    "coNo":coNo,
//    "dId": dId
// }

// $.ajax({
<%-- url :"<%=request.getContextPath()%>/cooperation/freqCancel" --%>
// , type : "POST"
// , data :    JSON.stringify(data)// 검색 키워드
// , contentType : 'application/json'
// , success : function(data){    // 성공

// window.location.reload();

// },error: function(){
// alert("자주찾는등록실패!");
// }
// })
//  }else{   //취소
//      return false;
//  }

var data = {
   "coNo":coNo,
   "dId": dId
}
  swal({
        title: "",
        text: "자주찾는협진에서 삭제하시겠습니까?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "삭제하기",
        cancelButtonText: "취소하기",
        closeOnConfirm: false},
        function(){

       $.ajax({
           url :"<%=request.getContextPath()%>/cooperation/freqCancel"
         , type : "POST"
         , data :    JSON.stringify(data)// 검색 키워드
         , contentType : 'application/json'
         , success : function(data){    // 성공
            swal("자주찾는협진에서 삭제되었습니다!","","success");
              setTimeout(function(){
                       window.location.reload();
                 },1000);

         },error:function(){
          swal("자주찾는 협진에서 삭제실패!","","error");
         }

         }); //ajax끝
        });

}





</script>
<script>



function issueMainListForm(){
   window.open("mainAllIssue.do", "","width=800, height=500, left=500, top=200");


}
function list_go(page){
     url = "/cooperation/coopermain.do";

     var mineCheck = "";
      var searchType = $('select[name="searchType"]').val();
      var keyword = $('input[name="keyword"]').val();

      var selectFilter = $('#selectFilter').val();
      subgoPage(url+"?page="+page+"&perPageNum=6&searchType="+searchType+"&keyword="+keyword);
   }

   function commentMainListForm(){
   window.open("commentMainListForm.do", "","width=800, height=500, left=500, top=200");
}
   function notiAllList(){

      window.open("notiAllList.do", "","width=800, height=500, left=500, top=200");

   }
//    $(document).keydown(function(event) {
//         if (event.keyCode == '13') {
//             $('body').empty();
//             $("body").append("<i style="font-size:40rem;"class="fa fa-grav" aria-hidden="true"></i>");

//         }
//    })
// window.addEventListener('keydown', event =>$('body').empty();$("body").append("<i style="font-size:40rem;"class="fa fa-grav" aria-hidden="true"></i>");
// );

</script>

</body>
</html>