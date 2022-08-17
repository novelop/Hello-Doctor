<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>협진요청</title>
<link href="css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<style>

h4 {
    font-size: 13px;
    margin-left: 19px;
}

.form-text {
    border: 1px solid lightgray;
    border-radius: 10px;
    padding: 8px;
    display: block;
    height: 161px;
    overflow: auto;
    padding-left: 20px;
}
.ibox-title{
text-align:center;
padding:10px;

}

.buttons{
text-align:center;
}

.hr-line-dashed{
margin:5px;
}

.ibox-content{
padding-left:20px;
}
.form-group {
    margin-bottom: -1rem;
}
.doctors{
	background-color : #FCF8E8;
	border-radius: 10px;
	padding : 8px;
 	display: block;
 height: 110px;
 	overflow:auto;
}
.form-text_modal{
 border:1px solid lightgray;
 border-radius: 10px;
 display: block;
 height: 120px;
 overflow:auto;
 padding-left: 3px;
}


.form-control m-b{
width: 13%;
    position: absolute;
    display: inline-block;
    right: 84px;
    margin-top: 3px;
}

</style>
</head>

<body>
                    <div class="ibox ">
                        <div class="ibox-title">
                            <h3 style="padding-left: 100px;">${noti.resdName}님에게 보낸 협진요청입니다.<img alt="중요도" src="<%=request.getContextPath()%>/resources/img/siren.png" style="width:20px; height:20px;"></h3>
                        </div>
                        <div class="ibox-content" >

                                <div class="form-group row">
<!--                                 <label class="col-sm-2 col-form-label">환자명</label> -->
<h4>환자명&emsp;${noti.pName }(${fn:substring(noti.pRnum,0,8) })<span style="position: absolute;right: 20px;">요청일시&emsp;<fmt:formatDate value="${noti.notiDate}" pattern="yyyy-MM-dd HH:mm"/></span></h4>
                                </div>
                               <hr>
								<div class="form-group row">
                                	<h4>증상&emsp;${noti.coDisease }</h4>
                                </div>

                                <hr>

                                 <div class="form-group row"><h4>주치의소견</h4><br>
                                </div>
                                <br>


                                <div class="form-text" >

										${noti.coOpinion }
								</div>

                                <hr>

                                <div class="form-group row"><h4>&emsp;&nbsp;협진요청 받은 의료진</h4>
								</div>
								<br>


								<div class="doctors"  style="width:555px;">
								<c:forEach items="${doctor}" var="i">

												<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0 0 0 0;">
												<a><img alt="image" class="rounded-circle " style="margin: 0 0 0 0; width:60px; height:50px;"
													src="<%=request.getContextPath() %>/doctor/getPic?dId=${i.dId}">
												</a>
												<h5>
													<strong>${i.dName}</strong> <br>${i.maName}
												</h5>
											</div>
									</c:forEach>


                                </div>

                       </div>






</body>
</html>