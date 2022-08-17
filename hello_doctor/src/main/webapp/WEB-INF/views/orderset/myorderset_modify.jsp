<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myOrdersetVo" value="${dataMap.myOrdersetVo }" />
<c:set var="drugList" value="${dataMap.drugList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css"
	rel="stylesheet">
<title>My 오더세트 수정</title>
<style>

.ibox-title {
	padding: 10px 5px 0px 10px;
}
.note-editor.note-frame .note-editing-area .note-editable {
	width: 866px;
}
.displayinlineblock {
	display: inline-block;
}
#myDrugList input{
width: 40px;
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
				style="height:auto; border-radius: 0px;">
					<form method="post" action="myorderset_modify" name="form">
					
				<div style="margin-left: 20px; margin-top: 13px;">
					<h3 class="displayinlineblock">My 오더세트 수정</h3>
					<div style="display: inline-block;float: right;margin-right: 7px;margin-top: -10px;">
						<div class="card-tools" style="display: inline-block;">
							<button id="modisw" type="button"  onclick="myregist_go()" style="border: none; background: none;">
								<i class="fa fa-check-square" aria-hidden="true" style="color: #3E5476;font-size: 28px;vertical-align: -5px;"></i>
							</button>
						</div>
						<div class="card-tools" style="display: inline-block;margin-left: -1px;">
							<button type="button" style="border: none; background: none;" onclick="subgoPage('/orderset/myorderset_detail.do?moNo=${myOrdersetVo.moNo}')">
								<i class="fa fa-reply" aria-hidden="true" style="color: #3E5476;font-size: 28px;vertical-align: -6px;"></i>
							</button>
						</div>
					</div>
				</div>

				<div class="displayinlineblock"
					style="margin-top: 28px; margin-left: 30px; width: 100%;">
					
				

	<div class="form-group" style="display: inline-block; width: 31%;">
							<div class="col-md-6" style="display: contents;">
								<label for="title">오더세트명</label>
							</div>
							<div class="col-md-6" style="display: contents;">
								<input class=" form-control" type="text" id="title" name="oTitle"
									value="${myOrdersetVo.oTitle}"
									style="display: inline; width: 71%; margin-left: 32px;"
									>
							</div>
						</div>

						<div class="form-group" style="display: inline-block; width: 39%;">
							<div class="col-md-6" style="display: contents;">
								<label for="title">주상병</label>
							</div>
							<div class="col-md-6" style="display: contents;">
								<input class=" form-control" type="text" id="title" name="oDname"
									value="${myOrdersetVo.oDname}"
									style="display: inline; width: 72%; margin-left: 25px;">
							</div>
						</div>

						<div class="form-group"
							style="display: inline-block; margin-left: -23px; width: 22%;">
							<div class="col-md-6" style="display: contents;">
								<label for="title">급여대상</label>
							</div>
							<div class="col-md-6" style="display: contents;">
								<select id="selectTarget" class="form-control m-b inputinfo" name="oTarget"
									style="margin-left: 19px; display: inline-block; width: 60%;">
									<option value="영유아">영유아</option>
									<option value="소아">소아</option>
									<option value="성인">성인</option>
									<option value="고령자">고령자</option>
									<option value="임산부">임산부</option>
								</select>
							</div>
						</div>



						<div class="form-group row">
							<label class="col-lg-1 col-form-label"
								style="margin-right: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;노티</label>
							<div class="form-group row">

								<textarea class="textarea" name="oNoti" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;">${myOrdersetVo.oNoti}</textarea>
							</div>
						</div>

						<div class="hr-line-dashed"></div>
						<h4 style="margin-bottom: 28px;">추천 약품 검색</h4>

						<div class="form-group row" style="margin-left: 27px;">
									<input id="keyword"
										style="width: 31%; font-size: 14px; border-radius: 5px;"
										type="text" placeholder="병명을 입력하세요" class="typeahead_1 form-control">
									<span> <a onclick="drug_list()"> <i
											style="font-size: 1.5em; padding-top: 6px; padding-left: 10px;"
											class="fa fa-search"></i>
									</a>
									</span>
								</div>

								<div id="drug_list" class="table-responsive"></div>

 <div class="hr-line-dashed"></div>
						<h4 style="margin-bottom: 28px;">처방내역</h4>


								<div class="form-group row" style="margin-left: 27px;">
									<input style="width: 31%; font-size: 14px; border-radius: 5px;"
										type="text" placeholder="약품명을 입력하세요" class="typeahead_2 form-control">
									<span> <i
										style="font-size: 1.5em; padding-top: 6px; padding-left: 10px;"
										class="fa fa-search"></i>&nbsp;

										<a onclick="appendDrug()"><i
										style="font-size: 1.7em; padding-top: 6px; padding-left: 10px; vertical-align: -2px;"
										class="fa fa-plus-square"></i></a>
									</span>
								</div>

							<div class="table-responsive">
									<table id="myDrugList" class="table "
										style="width: 90%; margin-left: 25px; text-align: center;">
										<thead>
											<tr>
												<th></th>
												<th>약품명</th>
												<th>1회급여량</th>
												<th>하루 투약 횟수</th>
												<th>투약일</th>

											</tr>

										</thead>
										<tbody>
											<c:forEach items="${drugList}" var="drug">
												<tr>
													<td></td>
													<td><input type="hidden" name="oDrug" value="${drug.oDrug}">${drug.oDrug}</td>
													<td><input type="number" name="quantity" value="${drug.quantity}"></td>
													<td><input type="number" name="dgAday" value="${drug.dgAday}"></td>
													<td><input type="number" name="dgDays" value="${drug.dgDays}"></td>
													<td onclick="removetr(this)"><a><i style='margin-right: 6px; font-size: 1.2em;' class='fa fa-minus-circle'></i></a></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>


 


                          
                                </div>
                                	<input type="hidden" name="moNo" value="${myOrdersetVo.moNo}">
                                </form>
</div>
</div>
                                </div>
                  
<div style="height: 100px;"></div>
	<!-- SUMMERNOTE -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/summernote/summernote-bs4.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/plugins/typehead/bootstrap3-typeahead.min.js"></script>
	<script>
        $(document).ready(function(){

            $('.summernote').summernote();
            $("#selectTarget").val("${myOrdersetVo.oTarget}").prop("selected", true);
       });

        window.onload = function() {
        	summernote_go($('#content'), '<%=request.getContextPath()%>');
		}

        function myregist_go() {

			var deftr = document.getElementById("deftr");


			var form = document.form;
			if (form.oTitle.value == "") {
				alert("오더세트명을 입력해주세요.");
				return;
			}
			if (form.oDname.value == "") {
				alert("주상병을 입력해주세요.");
				return;
			}
			if (form.oTarget.options[form.oTarget.selectedIndex].text == "선택") {
				alert("급여대상을 선택해주세요.");
				return;
			}
			if(deftr!=null && deftr){
				alert("처방내역을 추가해주세요.");
				return;
			}


			form.submit();
		}
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/open.js"></script>
	<%@ include file="./drugList.jsp" %>
</body>
</html>