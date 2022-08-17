<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
<style>
.modal-title{
	display: none;
}
.dropdown-toggle::after {
    display: none;
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
				style="height:auto; border-radius: 0px;  display: block;">
				<form role="form" method="post" action="orderset_regist.do" name="registForm">
					<div style="margin-left: 20px; margin-top: 13px;">
						<h3 class="displayinlineblock">오더세트 등록</h3>
						<div
							style="display: inline-block; float: right; margin-right: 7px; margin-top: -10px;">
							<div class="card-tools" style="display: inline-block;">
								<button id="modisw" type="button" onclick="regist_go()"
									style="border: none; background: none;">
									<i class="fa fa-check-square" aria-hidden="true"
										style="color: #3E5476; font-size: 28px; vertical-align: -5px;"></i>
								</button>
							</div>
							<div class="card-tools"
								style="display: inline-block; margin-left: -1px;">
								<button type="button" style="border: none; background: none;"
									onclick="subgoPage('/orderset/orderset_list.do');">
									<i class="fa fa-reply" aria-hidden="true"
										style="color: #3E5476; font-size: 28px; vertical-align: -6px;"></i>
								</button>
							</div>
						</div>
					</div>

					<div class="displayinlineblock card-body pad"
						style=" width: 100%;">
						<div class="form-group" style="display: inline-block; width: 38%;">
							<div class="col-md-6" style="display: contents;">
								<label for="title">오더세트명</label>
							</div>
							<div class="col-md-6" style="display: contents;">
								<input class=" form-control" type="text" id="title"
									name="oTitle"
									style="display: inline; width: 77%; margin-left: 11px;">
							</div>
						</div>

						<div class="form-group" style="display: inline-block; width: 39%;">
							<div class="col-md-6" style="display: contents;">
								<label for="title">주상병명</label>
							</div>
							<div class="col-md-6" style="display: contents;">
								<input class=" form-control" type="text" id="title"
									name="oDname"
									style="display: inline; width: 75%; margin-left: 13px;">
							</div>
						</div>

						<div class="form-group"
							style="display: inline-block; margin-left: -23px; width: 22%;">
							<div class="col-md-6" style="display: contents;">
								<label for="title">급여대상</label>
							</div>
							<div class="col-md-6" style="display: contents;">
								<select class="form-control m-b inputinfo" name="oTarget"
									style="margin-left: 12px; display: inline-block; width: 60%;">
									<option>선택</option>
									<option>영유아</option>
									<option>소아</option>
									<option>성인</option>
									<option>고령자</option>
									<option>임산부</option>
								</select>
							</div>
						</div>

							<div class="form-group row" style="margin-left: 4px; margin-top : -8px;     margin-bottom: -13px;">
							<label class="col-form-label labelbold"
								style="width: 4%; margin-left: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;노티</label>
							<div class="form-group row" style="margin-left: 10px;">
								<textarea class="textarea" name="oNoti" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
							</div>
						</div>

						<h4 style="margin-bottom: 28px; margin-top: 12px;">추천 약품 검색</h4>

						<div class="form-group row" style="margin-left: 27px;">
							<input id="keyword"
								style="width: 31%; font-size: 14px; border-radius: 5px;"
								type="text" placeholder="병명을 입력하세요"
								class="typeahead_1 form-control"> <span> <a
								onclick="drug_list()"> <i
									style="font-size: 1.5em; padding-top: 6px; padding-left: 10px;"
									class="fa fa-search"></i>
							</a>
							</span>
						</div>

						<div id="drug_list" class="table-responsive"></div>





						<h4 style="margin-bottom: 28px;">처방내역</h4>

						<div class="form-group row" style="margin-left: 27px;">
							<input style="width: 31%; font-size: 14px; border-radius: 5px;"
								type="text" placeholder="약품명을 입력하세요"
								class="typeahead_2 form-control"> <span> <i
								style="font-size: 1.5em; padding-top: 6px; padding-left: 10px;"
								class="fa fa-search"></i>&nbsp; <a onclick="medicheck()"><i
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


								</tbody>
							</table>
						</div>


						<div class="hr-line-dashed"></div>




						<div class="form-group row">
							<label class="col-lg-1 col-form-label"
								style="margin-left: -px; margin-left: -15px;">주의사항</label>

							<textarea class="textarea" name="oCaution"  rows="20"
								style="padding: 15px; width: 80%; height: 130px; margin-left: 12px; border-radius: 20px;"
								placeholder="1000자 내외로 작성하세요."></textarea>

						</div>
						<div class="form-group row">
							<label class="col-lg-1 col-form-label" style="">&nbsp;&nbsp;&nbsp;&nbsp;결과</label>
							<textarea class="textarea" name="oResult"  rows="20"
								style="padding: 15px; width: 80%; height: 130px; border-radius: 20px; margin-left: -2px;"
								placeholder="1000자 내외로 작성하세요."></textarea>
						</div>
					</div>





				</form>

			</div>
		</div>
	</div>

	<div style="height: 100px;"></div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="<%=request.getContextPath()%>/resources/js/open.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/typehead/bootstrap3-typeahead.min.js"></script>

	<%@ include file="./drugList.jsp"%>

</body>
</html>