<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ordersetVo" value="${dataMap.ordersetVo }" />
<c:set var="drugList" value="${dataMap.drugList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오더세트 수정</title>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css"
	rel="stylesheet">
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
	margin-left: 10px;
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

.note-editor.note-frame .note-editing-area .note-editable {
	width: 866px;
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
	<div class="col-lg-12" style="">
		<div class="ibox">
			<div class="ibox-content"
				style="margin-top: 20px; height: auto; border-radius: 0px;">
				<form role="form" method="post" action="orderset_modify" name="registForm" style="width: 100%;">

				<div style="margin-left: 20px; margin-top: 13px;">
					<h3 class="displayinlineblock">오더세트 수정</h3>

					<div style="display: inline-block;float: right;margin-right: 7px;margin-top: -10px;">
						<div class="card-tools" style="display: inline-block;">
							<button id="modisw" type="button" onclick="regist_go()" style="border: none; background: none;">
								<i class="fa fa-check-square" aria-hidden="true" style="color: #3E5476;font-size: 28px;vertical-align: -5px;"></i>
							</button>
						</div>
						<div class="card-tools" style="display: inline-block;margin-left: -1px;">
							<button type="button" style="border: none; background: none;" onclick="subgoPage('/orderset/orderset_detail.do?oNo=${ordersetVo.oNo}')" >
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
									value="${ordersetVo.oTitle}"
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
									value="${ordersetVo.oDname}"
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
									placeholder="1000자 내외로 작성하세요." style="display: none;">${ordersetVo.oNoti}</textarea>
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
												<th >약품명</th>
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

						<div class="hr-line-dashed"></div>


						<div class="form-group row">
							<label class="col-lg-1 col-form-label"
								style="margin-left: -px; margin-left: -15px;">주의사항</label>

							<textarea class="textarea" name="oCaution" id="content" rows="20"
								style="padding: 15px; width: 80%; height: 130px; /* margin-right: 13px; */ margin-left: 12px; border-radius: 20px;"
								placeholder="1000자 내외로 작성하세요." >${ordersetVo.oCaution}</textarea>

						</div>
						<div class="form-group row">
							<label class="col-lg-1 col-form-label" style="">&nbsp;&nbsp;&nbsp;&nbsp;결과</label>
							<textarea class="textarea" name="oResult" id="content" rows="20"
								style="padding: 15px; width: 80%; height: 130px; border-radius: 20px; margin-left: -2px;"
								placeholder="1000자 내외로 작성하세요.">${ordersetVo.oResult}</textarea>
						</div>



				</div>
				<input type="hidden" name="oNo" value="${ordersetVo.oNo}">
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
            $("#selectTarget").val("${ordersetVo.oTarget}").prop("selected", true);

       });

        window.onload = function() {
        	summernote_go($('#content'), '<%=request.getContextPath()%>');
		}

	


	</script>
	<script src="<%=request.getContextPath()%>/resources/js/open.js"></script>
	<%@ include file="./drugList.jsp" %>
</body>
</html>



