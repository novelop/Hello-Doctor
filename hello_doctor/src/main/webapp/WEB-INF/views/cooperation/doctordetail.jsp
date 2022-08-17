<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="docDetail" value="${docDetail}"/>
<c:set var="taskList" value="${taskList}"/>
<c:set var="coNo" value="${coNo}"/>
<c:set var="dId" value="${dId}"/>
<c:set var = "sessiondId" value="${sessiondId}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 등록</title>

<style>
p {
    margin-top: 0;
    margin-bottom: 0.3rem;
}
</style>

</head>
<body>
	<div class="card-header " style="margin-right: 0px; margin-left: 0px;" >
						<h4 class="col-md-8">의료진 상세보기</h4>



     			<div class="user-button">
                                    <div class="row">
<!--                                         <div class="col-md-4"> -->
<!--                                             <button type="button" class="btn btn-primary btn-sm btn-block"><i class="fa fa-wechat"></i> 1:1 채팅하기</button> -->
<!--                                         </div> -->
                                        <div class="col-md-6">
                                        <c:if test="${sessiondId ne dId}">
                                            <button onclick="window.open('takeover.do?coNo=${coNo}&dId=${dId}','','width=800, height=555, left=500, top=100');return false;" type="button" style="background-color: #FF6B1A;color: white;"class="btn btn-default btn-sm btn-block"><i class="fa fa-handshake-o" aria-hidden="true"></i> 인수인계하기</button>
                                        </c:if>
                                        </div>
                                        <div class="col-md-6">
                                        <button type="button" class="btn btn-default btn-sm btn-block" id="cancelBtn"
								onclick="window.close();">닫 기</button>
                                        </div>

                                    </div>
                                </div>







					</div>
<div class="row">



                            <div >


                            <img alt="프로필" src="<%=request.getContextPath()%>/doctor/getPic?dId=${docDetail.dId}" style="width: 250px;height: 290px;text-align: left;border-radius: 23px;margin-left: 45px;margin-top: 52px;">

</div>


<div style="margin-left: 30px;margin-top: 30px;width: 420px;">
								<input type="hidden" value="${docDetail.dId}"/><!-- 상세보기 페이지의 의료진 dId숨겨놓기 -->
                                <h3><strong>${docDetail.dName}</strong></h3>
                                <p><i class="fa fa-map-marker"></i>
              <label><strong>교수실:</strong>&nbsp;&nbsp;</label>${docDetail.dOffice} <br>
                              </p>
<!--                                 <h5> -->
<!--                                     About me -->

<!--                                 </h5> -->
                                <p>
                                <label><strong>전공:</strong>&nbsp;&nbsp;</label>${docDetail.maName}
                               <label><strong>세부전공:</strong>&nbsp;&nbsp;</label> ${docDetail.smName}<br>
                                <label><strong>연락처:</strong>&nbsp;&nbsp;</label> ${docDetail.tel}
                                </p>
                                <p style="font-weight: bold;">전체진료</p>
                               <div style="max-height: 219px;overflow: auto;">

                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>의료행위</th>
                                    <th>날짜</th>

                                </tr>
                                </thead>
                                <tbody>

                               <c:forEach items="${taskList}" var="task" varStatus="status">
                                <input type = "hidden" value = "${task.dId}"/>
                                <input type = "hidden" value = "${task.coNo}"/>
                                <input type = "hidden" value = "${task.taNo}"/>
                                <input type = "hidden" value = "${task.reservYn}"/>
                                <tr onclick="window.open('reserveDetail.do?taNo=${task.taNo}','','width=800, height=650, left=500, top=100');return false;">
                                    <td>${status.count}</td>
                                    <td>${task.taName}</td>
                                    <td>${task.taDate }</td>

                                </tr>
							</c:forEach>
                                </tbody>
                            </table>
</div>
             </div>
<br>
</div>


</body>
</html>