<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>협진요청</title>
<link href="css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<style>
.form-text{
border:1px solid lightgray;
border-radius: 10px;
 padding : 8px;
 display: block;
 height: 250px;
 overflow:auto;
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
 	height: 100px;
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
                            <h3>${noti.dName} 님의 협진요청입니다.<span style="float: right; font-size: 0.8em;">	</span></h3>

                            <c:if test="${mysetting eq '수락' }">
                            <select disabled class="form-control m-b selectSet" name="account" style="width: 13%;
						    position: absolute;
						    display: inline-block;
						    right: 84px;
						    margin-top: 3px;" >
                                        <option>수락</option>
                             </select>
                            </c:if>
                           <c:if test="${mysetting eq '거절'}">
                            <select  class="form-control m-b selectSet" name="account" style="width: 13%;
						    position: absolute;
						    display: inline-block;
						    right: 84px;
						    margin-top: 3px;" >
                                        <option>수락</option>
                                        <option selected="selected">거절</option>
                             </select>
                           </c:if>
                           <c:if test = "${mysetting eq '보류'}">
                            <select class="form-control m-b selectSet" name="account" style="width: 13%;
						    position: absolute;
						    display: inline-block;
						    right: 84px;
						    margin-top: 3px; " >
                                        <option>수락</option>
                                        <option>거절</option>
                                        <option selected="selected">보류</option>
                             </select>
                             </c:if>
                            <c:if test="${mysetting ne '수락'}">
                             <button onclick="updateComed('${notiNo}','${noti.coNo}')" class="btn btn-success  dim" type="button" style="width:60px; float:right;">확인</button>
                             </c:if>
                               <c:if test="${mysetting eq '수락'}">
                             <button  class="btn btn-outline btn-success  dim" type="button" style="margin-bottom: 10px !important; visibility : hidden; width:60px; float:right;">확인</button>
                             </c:if>

                        </div>
                        <div class="ibox-content" >

                                <div class="form-group row"><label class="col-sm-2 col-form-label">환자명</label>
                                	<h4>${noti.pName }         &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;발생일시&emsp;&emsp;&emsp;&emsp; <fmt:formatDate value="${noti.notiDate}" pattern="yyyy-MM-dd HH:mm"/></h4>
                                </div>
                               <hr>
								<div class="form-group row"><label class="col-sm-2 col-form-label">증상</label>
                                	<h4>${noti.coDisease }</h4>
                                </div>
                                <hr>

                                <div class="form-group row"><label class="col-sm-3 col-form-label">주치의소견</label><br>
                                </div>
                                <br>


                                <div class="form-text" >

										${noti.coOpinion }
								</div>

                                <hr>

                                <div class="form-group row"><h4>&emsp;&nbsp;협진요청 받은 의료진</h4>
								</div>
								<br>


								<div class="doctors" style="width:640px;">
								<c:forEach items="${doctor }" var="i">

												<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0 0 0 0;">
												<a><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath() %>/doctor/getPic?dPic=${i.dPic}">
												</a>
												<h5>
													<strong>${i.dName}</strong> <br>${i.maName}
												</h5>
											</div>
									</c:forEach>


                                </div>

                       </div>



                       <script>

                       function updateComed(notiNo,coNo){
                    	var set=   $(".selectSet option:selected").val();
           				var notiNo = notiNo;
           				var coNo = coNo;
                    	  alert(set);
                    	   alert("notiNo==>"+notiNo);
                    	  alert(coNo);
                    	  data = {
                    		"mysetting":set,
                    		"notiNo":notiNo,
                    		"coNo":coNo
                    	  }
                    	  $.ajax({
	           url :"<%=request.getContextPath()%>/cooperation/updateComedStatus"
	         , type : "POST"
	         , data : 	JSON.stringify(data)// 검색 키워드
	         , contentType : 'application/json'
	         , success : function(data){ 	// 성공
	        	 	alert("상태변경 성공!");
	         	window.close();
	            window.opener.reload();
	         },error : function(){
	        	 alert("실패!!");
	         }
	})


                       }


                       </script>


</body>
</html>