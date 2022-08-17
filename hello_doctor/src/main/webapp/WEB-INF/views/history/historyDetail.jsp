<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="historyDetail" value="${historyDetail}"/>
<c:set var="chartPicList" value="${chartPicList}"/>
<c:set var="chartFileList" value="${chartFileList}"/>
<c:set var="lastPreList" value="${lastPreList}"/>
<c:set var="commentList" value="${commentList}"/>
<c:set var="vo" value = "${vo}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리 상세</title>

<style>

#replyAddBtn{
	position: absolute;
    right: 17px;
}

.profile-image img {
    width: 60px;
    height: 60px;
}

img {
    vertical-align: middle;
    border-style: none;
    width: 320px;
    height: 400px;
}
.panel-body::-webkit-scrollbar {
  width:8px;  /*스크롤바의 너비*/
}
.panel-body::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
.panel-body::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
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

.col-lg-6 {
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%;
    margin-top: 200px;
}
</style>

</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
		<div class="justify-content-center">
			<div class="col-md-13" style="padding: 3px">
				<div class="card card-outline card-info">
					<div class="card-header row" style="margin-right: 0px; margin-left: 0px;" >
						<h4 class="col-md-8">${historyDetail.pName}/${historyDetail.pRnum}</h4>
					</div>
						<button  onclick="javascript:window.close()" class="btn btn-danger  dim " type="button" style="font-size: 0.8em;  position: absolute; right: 10px;top: 5px; ">닫 기</button>
					<!--end card-header  -->
					<div class="card-body pad">



							<div class="col-md-6" style="display: contents;">
								<div class="form-group" style="width: 300px; display: contents;">
									 <h5 style="margin-top: -8px;">진료일시:<small> ${historyDetail.mDate}</small>&nbsp;&nbsp;&nbsp;</small>&nbsp;&nbsp;&nbsp;담당의:<small>${historyDetail.dId}</small>&nbsp;&nbsp;&nbsp;</h5>
								</div>
							</div>



						<c:if test="${!empty chartPicList}">
							<c:forEach items="${chartPicList}" var="chartPic">
								<div class="pastimg"
									style="background-image:url('getChartPic?mpNo=${chartPic.mpNo}')"
									onclick="detailImg('${chartPic.mpNo}')"></div>
							</c:forEach>
						</c:if>



						<c:forEach items="${chartFileList}" var="chartFile">
<div class="file" onclick="location.href='getFile?mfNo=${chartFile.mfNo}'">
                                    <a>
                                        <span class="corner"></span>

                                        <div class="icon"><i class="fa fa-file"></i></div>
                                        <div class="file-name">
											${chartFile.mfFilename};
                                        </div>
                                    </a>
                                </div>
						</c:forEach>



</div>

                <div class="col-lg-8">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs" role="tablist">
                            <li><a class="nav-link active" data-toggle="tab" href="#tab-1"> 진료기록</a></li>
                            <li><a class="nav-link " data-toggle="tab" href="#tab-2">처방</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" id="tab-1" class="tab-pane active">
                                <div class="panel-body">
								${historyDetail.symptom}
                                </div>
                            </div>

                            <div role="tabpanel" id="tab-2" class="tab-pane ">
                                <div class="panel-body">
                                   		<table class="table table-bordered">

								<tbody>
								<th>약명</th>
								<th>수량</th>
								<th>일투수</th>
								<th>투약일</th>
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


					<!--end card-footer  -->
				</div>
				<!-- end card -->
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->







	</section>



	 <!-- Reply content -->
    <section class="content container-fluid">
    	<!-- reply component start -->
		<div class="row">
			<div class="col-md-12">
				<div class="card card-info">
					<div class="card-body">
						<!-- The time line -->
						<div class="timeline">
							<!-- timeline time label -->
							<div class="time-label" id="repliesDiv">
								<span class="bg-green">코멘트</span>
							</div>


						</div>
						<div class='text-center'>
							<ul id="pagination" class="pagination justify-content-center m-0" >

							</ul>
						</div>
					</div>

					<div class="card-footer">




	<div class="col-lg-13" style="margin-top: -8px;">

		<div class="ibox ">
			<div class="ibox-title"
				style="background-color: lightgray; padding: 0px;">
				<h3 style="padding: 14px;">&nbsp;코멘트</h3>
			</div>


				<div class="ibox-content">

 <form  role="commentInsert" method="post" action="replyRegist.do">

<input type = "hidden" name = "dId" value="${vo.dId}"/>
<input type= "hidden" name = "comNo" value="${historyDetail.comNo}"/>
<!-- commnetList가 없을경우 어떻게 할 것인가! -->
<input type="hidden" name = "coNo" value="${historyDetail.coNo}"/>
<input type = "hidden" name = "taNo" value="${historyDetail.taNo}"/>


					<strong><img alt="프로필" class="rounded-circle"
						src="getPic?dPic=${vo.dPic}" style="width: 40px; height: 40px;">&emsp;${vo.dName}/${vo.maName}</strong>
					<button  onclick="replyRegist_go()"class="btn btn-outline btn-success dim" type="submit">등록</button>

						<textarea class="form-control" name="comContent"
							placeholder="내용을 입력해주세요"
							style="height: 115px; margin-top: 10px;" ></textarea>


				 </form>
				</div>


			<c:if test="${empty commentList}">
				<div class="ibox-content">
					<div style="margin: 0 auto; text-align: center;">
						<h4>등록된 코멘트가 없습니다</h4>
					</div>
				</div>
			</c:if>



<!-- ------------------------------------------------------------------------------------------------------------------ -->
			<div class="ibox-content no-padding">
				<ul class="list-group">
					<c:forEach items="${commentList}" var="comment">






						<li class="list-group-item"><strong> <img alt="프로필" class="rounded-circle"
								src="getPic?dPic=${comment.dPic}"
								style="width: 40px; vertical-align: -13px; height: 40px;">

								<input id="comCoNo" type="hidden" value= "${comment.comCoNo}"/>
								<input id="comNo" type = "hidden"value="${comment.comNo}"/>
								<input id= "dId" type = "hidden" value="${comment.dId}"/>


								&emsp;${comment.dName}/${comment.maName} &emsp;<span id="fDate">${comment.comDate}</span>
								<button id="updateFeedbackGo" class="btn btn-outline btn-success dim" type="button" onclick="updateFeedbackGo(this)" style="display: none;">수정</button>

								<c:if test="${vo.dId eq comment.dId}">
									<div class="filebox" id="feedbackDivBtn"
										style="margin-left: 13px; display: inline; width: 2%;">
										<i class="fa fa-cog" data-toggle="dropdown" type="button"
											aria-expanded="false"
											style="font-size: 21px; vertical-align: -3px;"></i>
										<ul class="dropdown-menu" x-placement="bottom-start"
											style="position: absolute; top: 131px; left: 929px; will-change: top, left; min-width: 6rem;">
											<li><a onclick="updateFeedback(this)">수정</a></li>
											<li><a onclick="deleteFeedback(this)">삭제</a></li>
										</ul>
									</div>
								</c:if>
						</strong>
							<textarea class="form-control"  id="fbResultTa"
								placeholder="피드백을 작성하세요."
								style="height: 115px; margin-top: 10px; display: none;" >${comment.comContent}</textarea>
							<div id="fbResultDiv"
								style="padding: 10px; width: 98%; margin: 0 auto; margin-top: 7px;">
								${comment.comContent}</div>

						</li>
					</c:forEach>



				</ul>
			</div>
<!-- ------------------------------------------------------------------------------------------------------------------ -->
		</div>
	</div>


				</div>

			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>


    <!-- Modal -->
<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn" onclick="replyModify_go();">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn" onclick="replyRemove_go();">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<script>

function modify_go(){
	var formObj = $("form[role='form']");
	formObj.attr({
		'action':'modifyForm.do',
		'method':'post'
	});
	formObj.submit();
}
function remove_go(){
	var formObj = $("form[role='form']");
	var answer = confirm("정말 삭제하시겠습니까?");
	if(answer){
		formObj.attr("action", "remove.do");
		formObj.attr("method", "post");
		formObj.submit();
	}
}

<c:if test="${from eq 'modify'}" >
	alert("정상적으로 수정되었습니다.");
</c:if>
<c:if test="${from eq 'remove'}" >
	alert("삭제되었습니다.");
	window.close();
	window.opener.location.reload();
</c:if>


</script>

<%-- <%@ include file="./reply_js.jsp" %> --%>













<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});

		  $(function(){
		    $('.datepicker').datepicker();
		  })

function detailImg(data){
		window.open("detailImg?mpNo="+data, "","width=800, height=700, left=500, top=200")
	}

	function replyRegist_go(){
		//alert("댓글등록버튼 작동!");
		$('form[role=commentInsert]').submit();
	}

	var change = null;
	function updateFeedback(aa){
		var fli  = $(aa).parents("li");
		var fbtn = fli.find('#feedbackDivBtn');
		var fta  = fli.find("textarea");
		var fdiv = fli.find('#fbResultDiv');
		var fgo = fli.find('#updateFeedbackGo');


		if(change != aa ){
			var oldFli  = $(change).parents("li")
			oldFli.find('#feedbackDivBtn').css("display","inline-block");
			oldFli.find("textarea").hide();
			oldFli.find('#fbResultDiv').css("display","inline-block");
			oldFli.find("#updateFeedbackGo").hide();
		}
			fgo.css("display","inline-block")
			fbtn.css("display","none");
		    fta.show();
		    fdiv.css("display","none");
		    change = aa;

	}



	//수정하고 수정하기 버튼 누르기!
	function updateFeedbackGo(aa){
		var fli = $(aa).parents("li");
		var fbResult = fli.find("textarea").val();
		var fbNo = fli.find("#comCoNo").val();
		var fDate = fli.find("#fDate").html();

		var fbtn = fli.find('#feedbackDivBtn');
		var fta  = fli.find("textarea");
		var fdiv = fli.find('#fbResultDiv');
		var fgo = fli.find('#updateFeedbackGo');


		console.log(fbResult, fbNo, fDate );

		var data = {
				"comContent":fbResult,
				"comCoNo":fbNo
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/cooperation/replyUpdate",
			type:'post',
			data:JSON.stringify(data),
			contentType:'application/json',

			success:function(data){

				console.log("comment==>"+data.comContent);

				fdiv.html(data.comContent);
				fDate = data.comDate;
				fbtn.css("display","inline-block");
				fta.hide();
				fdiv.css("display","inline-block");
				fgo.hide();
			},
			error:function(error){
				alert('실패했습니다.');
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});

	}

	function deleteFeedback(aa){

		var fli = $(aa).parents("li");
		var fbNo = fli.find("#comCoNo").val();
		console.log("삭제눌렀을 때 댓글번호"+fbNo);
		var data = {
				"comCoNo":fbNo
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/cooperation/replyRemove",
			type:'post',
			data:JSON.stringify(data),
			contentType:'application/json',
			success:function(data){
				alert("삭제되었습니다.");
				fli.hide();

			},
			error:function(error){
				alert('실패했습니다.');
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	</script>

</body>
</html>