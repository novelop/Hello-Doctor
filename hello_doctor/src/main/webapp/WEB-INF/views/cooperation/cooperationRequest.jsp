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

 <!-- Sweet Alert -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<style>

#fake{
background-color: transparent;
    border: none;
    padding-left: 5px;
text-align: center;
    padding: 10px;

    border-color: #e7eaec;
    border-image: none;
    border-style: solid solid none;
    border-width: 1px;
    color: inherit;
    margin-bottom: 0;
    padding: 15px 90px 8px 15px;
    min-height: 65px;
    position: relative;
    clear: both;
    -webkit-border-radius: 3px 3px 0 0;
    -moz-border-radius: 3px 3px 0 0;
    border-radius: 2px 2px 0 0;

}
#approve{
width: 13%;
    position: absolute;
    display: inline-block;
    right: 84px;
    margin-top: 3px;

    height: 2.05rem;
    background-color: #e9ecef;
    opacity: 1;
    border :none;
    text-align: center;
}

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
.doctors {
    background-color: #FCF8E8;
    border-radius: 10px;
    padding: 8px;
    display: block;
    height: 100px;
    overflow: auto;
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

<!--                         <div class="ibox-title"> -->
<%--                             <span style="padding-left: 100px;font-size: 1.05rem;"><strong>${noti.dName} 님의 협진요청입니다.</strong><img alt="중요도" src="<%=request.getContextPath()%>/resources/img/siren.png" style="width:20px; height:20px;"></span> --%>

<%--                             <c:if test="${mysetting eq '수락' }"> --%>
<!-- 									<input id="approve" value="수 락"> -->
<!-- <!--                             <select disabled class="form-control m-b selectSet" name="account" style="width: 13%;position: absolute;display: inline-block;right: 84px;margin-top: 3px;" >
<!-- <!--                                         <option>수락</option> -->
<!-- <!--                              </select> -->
<%--                             </c:if> --%>
<%--                            <c:if test="${mysetting eq '거절'}"> --%>
<!--                             <select  class="form-control m-b selectSet" name="account" style="width: 13%;position: absolute;display: inline-block;right: 84px;margin-top: 3px;" >
<!--                                         <option>수락</option> -->
<!--                                         <option selected="selected">거절</option> -->
<!--                              </select> -->
<%--                            </c:if> --%>
<%--                            <c:if test = "${mysetting eq '보류'}"> --%>
<!--                             <select class="form-control m-b selectSet" name="account" style="width: 13%;position: absolute;display: inline-block;right: 84px;margin-top: 3px; " >
<!--                                         <option>수락</option> -->
<!--                                         <option>거절</option> -->
<!--                                         <option selected="selected">보류</option> -->
<!--                              </select> -->
<%--                              </c:if> --%>

<%--                               <c:if test = "${empty mysetting }"> --%>
<!--                             <select class="form-control m-b selectSet" name="account" style="width: 13%; -->
<!-- /*     position: absolute; */ -->
<!-- /*     display: inline-block; */ -->

<!-- /*     right: 84px; */ -->
<!--     margin-top: 3px; " > -->
<!--                                         <option>수락</option> -->
<!--                                         <option>거절</option> -->
<!--                              </select> -->
<%--                              </c:if> --%>



<%--                             <c:if test="${mysetting ne '수락'}"> --%>
<%--                              <button onclick="updateComed('${notiNo}','${noti.coNo}')" class="btn btn-outline btn-success  dim" type="button" style="width:60px; float:right;">확인</button> --%>
<%--                              </c:if> --%>
<%--                                <c:if test="${mysetting eq '수락'}"> --%>
<!--                              <button  class="btn btn-outline btn-success  dim" type="button" style="visibility : hidden; width:60px; float:right;">확인</button> -->
<%--                              </c:if> --%>

<!--                         </div> -->




                        <div id="fake">


                        <span style="    padding-left: 69px;font-size: 1.05rem;"><strong style="color: black;">${noti.dName}님의 협진요청입니다.</strong><img alt="중요도" src="<%=request.getContextPath()%>/resources/img/siren.png" style="width:20px; height:20px;margin-top: 3px;"></span>

                            <c:if test="${mysetting eq '수락' }">
<!-- 									<input id="approve" value="수 락"> -->
                            <select disabled class="form-control m-b selectSet" name="account" style="width: 13%;position: absolute;display: inline-block;right: 80px;-webkit-appearance:none;" >
                                        <option>수락</option>
                             </select>
                            </c:if>
                           <c:if test="${mysetting eq '거절'}">
                            <select  class="form-control m-b selectSet" name="account" style="width: 13%;position: absolute;display: inline-block;right: 80px;" >
                                        <option>수락</option>
                                        <option selected="selected">거절</option>
                             </select>
                           </c:if>
                           <c:if test = "${mysetting eq '보류'}">
                            <select class="form-control m-b selectSet" name="account" style="width: 13%;position: absolute;display: inline-block;right: 80px;" >
                                        <option>수락</option>
                                        <option>거절</option>
                                        <option selected="selected">보류</option>
                             </select>
                             </c:if>

                              <c:if test = "${empty mysetting }">
                            <select class="form-control m-b selectSet" name="account" style="width: 13%;
    position: absolute;
    display: inline-block;
    right: 84px;" >
                                        <option>수락</option>
                                        <option>거절</option>
                             </select>
                             </c:if>



                            <c:if test="${mysetting ne '수락'}">
                             <button onclick="updateComed('${notiNo}','${noti.coNo}')" class="btn btn-success" type="button" style="width:60px; float:right;position: absolute;
    right: 5px;">확인</button>
                             </c:if>
                               <c:if test="${mysetting eq '수락'}">
                             <button  class="btn btn-outline btn-success" type="button" style="visibility : hidden; width:60px; float:right;position: absolute;
    right: 5px;">확인</button>
                             </c:if>




                        </div>





                        <div class="ibox-content" >

                                <div class="form-group row">
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


								<div class="doctors" style="width:555px;">
								<c:forEach items="${doctor }" var="i">

												<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0 0 0 0;">
												<a><img alt="image" class="rounded-circle " style="margin: 0 0 0 0; width:60px; height:50px"
													src="<%=request.getContextPath() %>/doctor/getPic?dId=${i.dId}">
												</a>
												<h5>
													<strong>${i.dName}</strong> <br>${i.maName}
												</h5>
											</div>
									</c:forEach>


                                </div>

                       </div>
			</div>
<!-- Sweet alert -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>



                       <script>

                       function updateComed(notiNo,coNo){


                       	var set=   $(".selectSet option:selected").val();
              				var notiNo = notiNo;
              				var coNo = coNo;
                    	   data = {
                           		"mysetting":set,
                           		"notiNo":notiNo,
                           		"coNo":coNo
                           	  }
//                     	   swal({
//                     	        title: "",
//                     	        text: "상태변경에서 삭제하시겠습니까?",
//                     	        type: "warning",
//                     	        showCancelButton: true,
//                     	        confirmButtonColor: "#DD6B55",
//                     	        confirmButtonText: "삭제하기",
//                     	        cancelButtonText: "취소하기",
//                     	        closeOnConfirm: false},
//                     	        function(){

                    	  $.ajax({
	           url :"<%=request.getContextPath()%>/cooperation/updateComedStatus"
	         , type : "POST"
	         , data : 	JSON.stringify(data)// 검색 키워드
	         , contentType : 'application/json'
	         , success : function(data){ 	// 성공



	       	 //	alert("상태변경 성공!");


	        	 swal("", "상태변경에 성공하였습니다!", "success");
					setTimeout(function(){
						window.opener.location.reload(true);
			        	window.close();
					}, 1500);




	         },error : function(){
	        		swal("상태변경실패!!","","error");
	         }

	});
                    	  //      });

                       }




        $(document).ready(function(){

			  opener.parent.document.location.href ="javascript:notiajax()";;

           })


                       </script>


</body>
</html>