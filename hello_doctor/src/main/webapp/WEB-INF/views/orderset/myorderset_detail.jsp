<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="myOrdersetVo" value="${dataMap.myOrdersetVo }" />
<c:set var="drugList" value="${dataMap.drugList }" />
<c:set var="recoList" value="${dataMap.recoList }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css"
	rel="stylesheet">
<title>Insert title here</title>
<style>
.sweet-alert{
top: 30%;
}

.ibox-title {
	padding: 10px 5px 0px 10px;
}
.note-editor.note-frame .note-editing-area .note-editable {
	width: 866px;
}
.displayinlineblock {
	display: inline-block;
}
</style>
<style>
.col-md-12 {
	padding: 10px;
	height: 200px;
}

.row {
	margin-bottom: 10px;
	margin-top: 10px;
}

tr {
	text-align: center;
}

.col-8 {
	max-width: 100%;
}

.contact-box {
	padding: 10px;
	color: black;
	opacity: 40%;
	height: 300px;
	border-radius: 10px;
	padding-bottom: 30px;
	width: 23.5%;
	margin-left: 9px;
	margin-right: 6px;
	opacity: 80%;
}

.list-group {
	font-size: 1.1em;
}

button.dim {
	float: right;
	margin-bottom: 5px !important;
}

.displayinlineblock {
	display: inline-block;
}

.datestyle {
	width: 90px;
	padding: 3px;
	text-align: center;
}
.labelbold{

    font-weight: 600;
    font-size: 14px;
}
#myDrugList th:nth-child(2){  width: 60%; text-align: left;}
#myDrugList td:nth-child(2){  text-align: left;}
#myDrugList th:nth-child(3){  width: 12%;}
#myDrugList th:nth-child(4){  width: 12%;}
#myDrugList th:nth-child(5){  width: 12%;}
</style>
</head>
<body>

	<div class="col-lg-12" style="margin-top: 20px;">
		<div class="ibox">
			<div class="ibox-content"
				style="min-height: 377px; height: auto; border-radius: 0px;">
				
				<div style="margin-left: 20px; margin-top: 13px;">
					<h3 class="displayinlineblock">${myOrdersetVo.oTitle}</h3>
				<span> / ${myOrdersetVo.oCla}</span>

				
					<div style="display: inline-block;float: right;margin-right: 7px;margin-top: -10px;">

						<button class="btn btn-outline btn-success" type="button" 
							id="regist" onclick="OpenWindow('myorderset_uploadForm.do?moNo=${myOrdersetVo.moNo}','My오더세트업로드',550,360);">
							<i class="fa fa-s1ign-out ">공유 오더세트 업로드</i>
						</button>
						
							<div class="filebox"
								style="margin-left: 13px; display: inline; width: 2%;">
								<i class="fa fa-cog" data-toggle="dropdown" type="button"
									aria-expanded="false"
									style="font-size: 23px; vertical-align: -5px;"></i>
								<ul class="dropdown-menu" x-placement="bottom-start"
									style="position: absolute; top: 131px; left: 929px; will-change: top, left; min-width: 6rem;">
									<li><a onclick="subgoPage('/orderset/myorderset_modifyForm.do?moNo=${myOrdersetVo.moNo}')">수정</a></li>
									<li><a onclick="subgoPage('/orderset/myorderset_delete?moNo=${myOrdersetVo.moNo}')" >삭제</a></li>
								</ul>
							</div>
					<div class="card-tools" style="display: inline-block;">
						<button type="button" style="border: none; background: none;" onclick="subgoPage('/orderset/myorderset_list.do');">
							<i class="fa fa-th-large" aria-hidden="true" style="color: #3E5476;font-size: 23px;vertical-align: -6px;"></i>
						</button>
					</div>
					</div>
				</div>

				<div class="displayinlineblock"
					style="margin-top: 5px; margin-left: 30px; width: 100%;">
					
					<div class="bg-primary p-xs b-r-xl datediv datestyle displayinlineblock">${myOrdersetVo.oRegdate}</div>
			

				<form method="get" style="width: 100%;">

					<div class="form-group" style="margin-top: 13px; display: inline-block;width: 32%;">
						<div class="col-md-6" style="display: contents;">
							<label for="title" class="labelbold">작성자</label>
						</div>
						<div class="col-md-6" style="display: contents;">
							<div style=" display: inline; width: 71%; margin-left: 10px;">
							${myOrdersetVo.dName} / ${myOrdersetVo.oCla}	</div>
						</div>
					</div>
					<div class="form-group" style="display: inline-block;width: 38%;">
						<div class="col-md-6" style="display: contents;">
							<label for="title" class="labelbold">주상병</label>
						</div>
						<div class="col-md-6" style="display: contents;">
							<div style=" display: inline; width: 71%; margin-left: 10px;">${myOrdersetVo.oDname}</div>
						</div>
					</div>
					<div class="form-group" style="display: inline-block;margin-left: -30px;width: 22%;">
						<div class="col-md-6" style="display: contents;">
							<label for="title" class="labelbold">급여대상</label>
						</div>
						<div class="col-md-6" style="display: contents;">
							<div style=" display: inline; width: 71%; margin-left: 10px;">${myOrdersetVo.oTarget}</div>
						</div>
					</div>



						<div class="form-group row" style="    margin-top: -4px;">
							<label class="col-lg-1 col-form-label labelbold" style="width: 9%;">&nbsp;&nbsp;&nbsp;&nbsp;노티</label>
							<div style="padding: 15px; width: 79%;  border: 1px solid gray; border-radius: 20px; min-height: 130px; max-height: 300px; overflow: auto; ">${myOrdersetVo.oNoti}</div>
						</div>


					<div class="form-group row">
						<h4>처방내역</h4>
						<div style="margin-left: 100px;" class="table-responsive">
								<table id="myDrugList" class="table " style="width: 84%;">
									<thead>
										<tr>
											<th></th>
											<th>약명</th>
											<th>1회급여량</th>
											<th>하루 투약 횟수</th>
											<th>투약일</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${drugList}" var="drug">
											<tr>
												<td></td>
												<td>${drug.oDrug}</td>
												<td>${drug.quantity}</td>
												<td>${drug.dgAday}</td>
												<td>${drug.dgDays}</td>
											</tr>

										</c:forEach>


									</tbody>
								</table>
							</div>
					</div>


<h4 style="margin-bottom: 28px;">사용된 진료 내역</h4>

			
						<div style="" class="table-responsive">
							<table class="table " style="width: 90%;margin-left: 25px;text-align: center;">
								<thead>
									<tr>
										<th>환자명</th>
										<th>의료행위</th>
										<th>진단명</th>
										<th>날짜</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${recoList}" var="reco">
										<tr>
											<td>${reco.pName}(${reco.pSex})</td>
											<td>${reco.mName}</td>
											<td>${reco.dName}</td>
											<td>${reco.mDate}</td>
										</tr>
									</c:forEach>
									<c:if test="${empty recoList}">
										<tr>
											<td colspan="4" style="text-align: center; color: grey;">사용된 진료 내역이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>

						    </form>
						
						
							 <form  method="post" action="myorderset_updateResult">
						<div class="form-group row">
							<label class="col-lg-1 col-form-label labelbold" style="">&nbsp;&nbsp;&nbsp;&nbsp;결과</label>
							<c:if test="${empty myOrdersetVo.oResult}">
							<textarea class="textarea" name="oResult" id="content" rows="20"
								style="padding: 15px; width: 77%; height: 130px; border-radius: 20px; margin-left: -2px;"
								placeholder="1000자 내외로 작성하세요." ></textarea>
							<button class="btn btn-outline btn-success " type="submit"
								style="height: 54px; width: 8%; margin-top: 33px; margin-left: 20px;" >결과 등록</button>
							</c:if>
							<c:if test="${not empty myOrdersetVo.oResult}">
								<textarea class="textarea" name="oResult" id="disableTa" rows="20"
								style="padding: 15px; width: 77%; height: 130px; border-radius: 20px; margin-left: -2px;"
								placeholder="1000자 내외로 작성하세요."
								disabled="disabled" >${myOrdersetVo.oResult}</textarea>
								<button id="submitBtn" class="btn btn-outline btn-success " type="submit"
								style="height: 54px; width: 8%; margin-top: 33px; margin-left: 20px; display: none;" >결과 수정</button>
								<div class="filebox" id="modifybtn"
									style="margin-left: -34px; margin-top: 10px; display: inline; width: 2%;">
									<i class="fa fa-pencil" data-toggle="dropdown" type="button"
										aria-expanded="false"
										style="font-size: 23px; vertical-align: -5px;" onclick="modifyResult()"></i>
									
								</div>
							  <input type="hidden" name="rmcheck" value="1">
							</c:if>
						  <input type="hidden" name="moNo" value="${myOrdersetVo.moNo}">
						</div>
						
					
						 </form>
						
						
					
						  


                        
                                </div>
</div>
</div>
                                </div>
                  
<div style="height: 100px;"></div>

<script src="<%=request.getContextPath()%>/resources/js/open.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
	<!-- SUMMERNOTE -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/summernote/summernote-bs4.js"></script>
<c:if test="${from eq 'regist' }">
<script>
swal("", "결과가 등록되었습니다.", "success");

</script>
</c:if>
<c:if test="${from eq 'update' }">
<script>
swal("", "결과가 수정되었습니다.", "success");

</script>
</c:if>
<c:if test="${from eq 'modify' }">
	<script>
	swal("", "My오더세트가 수정되었습니다.", "success");
	
	</script>
</c:if>
<c:if test="${from eq 'upload' }">
	<script>
	swal("", "업로드에 성공했습니다.", "success");
	</script>
</c:if>

<script>
function modifyResult(){
	  $('#disableTa').attr("disabled", false);
	  $('#modifybtn').css("display","none");
	  $('#submitBtn').css("display","inline-block");
	  
	
}


</script>
</body>
</html>