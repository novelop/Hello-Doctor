<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="list" value="${dataMap.list}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer" />
<link
href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
rel="stylesheet">
<style>
.elements-list .nav-link {
    padding: 10px 25px;
}


.file {
	width: 15%;

}
.pastimg{
	background-size: contain;
    background-repeat: no-repeat;
    width: 80%;
    height: 0;
   padding-top: 30%;
}
table{
margin-top: -15px;
}
#drugList th:nth-child(1){  width: 60%; text-align: left;}
#drugList td:nth-child(1){  text-align: left;}
#drugList th:nth-child(2){  width: 12%; }
#drugList th:nth-child(3){  width: 12%; }
#drugList th:nth-child(4){  width: 12%; }
</style>
</head>
<body>
	<div style="padding-top: 20px;">
		<h3 style="margin-left: 16px; display: inline-block; width: 51%;">진료
			히스토리</h3>
		<div style="display: inline-block; width: 7%;">
<!-- 			<a style="cursor: pointer;" onclick="resetList()"><i class="fa fa-th-list">&nbsp;전체날짜</i></a> -->

		</div>

		<div style="display: inline-block;">
			<span><strong>진료일</strong> </span>
			<div class="form-group"
				style="display: inline-block; margin-left: 10px;">
				<div class="col-md-6" style="display: contents;">
					<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
						for="date"></label> <input
						class="datepicker form-control" type="text"
						placeholder="YYYY - mm - dd" id="startDate" name="startDate"
						value="${cri.startDate }" style="display: inline; width: 61%; margin-left: 10px;">
				</div>
			</div>
			<span style="margin-left: -39px;"> - </span>
			<div class="form-group"
				style="display: inline-block; margin-left: 6px;">
				<div class="col-md-6" style="display: contents;">
					<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
						for="date"></label> <input
						class="datepicker form-control" type="text"
						placeholder="YYYY - mm - dd" id="endDate" name="endDate" value="${cri.endDate }"
						style="display: inline; width: 61%; margin-left: 10px;">
				</div>
			</div>
			<a style="margin-left: -37px;" onclick="list_go(1);"> <i
				style="font-size: 1.5em;" class="fa fa-search"></i></a>
				<div class="card-tools" style="display: inline-block;">
							<button type="button" style="border: none; background: none;" onclick="subgoPage('/history/main.do');">
								<i class="fa fa-th-large" aria-hidden="true" style="color: #3E5476; font-size: 23px; vertical-align: -3px;
    margin-left: 5px;"></i>
							</button>
						</div>
		</div>

	</div>
	<div class="col-lg-12" style="margin-top: 10px;">

		<div class="row" style="margin-top: -26px;">

		<div class="fh-breadcrumb" style="    margin-top: 20px;">

                <div class="fh-column" style="">
                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 700px;">
                    <div class="full-height-scroll" style="overflow: hidden; width: auto; height: 655px;">
                        <ul class="list-group elements-list" id="">
                            <c:forEach items="${list}" var="list">

                            <li class="list-group-item">
                                <a class="nav-link" data-toggle="tab" onclick="pastchart('${list.mNo}')">
                                    <small class="float-right text-muted">${list.mDate}</small>
                                    <strong>${list.pName}[${list.pSex}]</strong>
                                    <div class="small m-t-xs" style="font-size: 13px;">
                                        <p class="m-b-xs">
                                          <strong>주상병</strong>&nbsp;
                                          <c:choose>
											<c:when test="${fn:length(list.dName) gt 15}">
												<c:out value="${fn:substring(list.dName, 0, 14)}..">
		        								</c:out>
											</c:when>

											<c:otherwise>
												<c:out value="${list.dName}">
												</c:out>
											</c:otherwise>
											</c:choose>
                                        </p>
                                        <p class="m-b-none">
                                            ${list.pRnum}
                                        </p>
                                    </div>
                                </a>
                            </li>

                             </c:forEach>


                        </ul>

						</div>
						<nav aria-label="Navigation"
								style="margin-left: 12px;">
								<ul class="pagination justify-content-center m-0">
									<li class="page-item"><a class="page-link"
										href="javascript:list_go(1);"> <i
											class="fa fa-angle-double-left"></i>
									</a>
										<li class="page-item"><a class="page-link"
										href="javascript:list_go(1);"> <i class="fa fa-angle-left"></i>
									</a></li>

									<c:forEach var="pageNum" begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }">
										<li class="page-item ${cri.page == pageNum?'active':''}">
											<a class="page-link" href="javascript:list_go('${pageNum}');">${pageNum }</a>
										</li>

									</c:forEach>


									<li class="page-item"><a class="page-link"
										href="javascript:list_go(1);"> <i
											class="fa fa-angle-right"></i>
									</a></li>
									<li class="page-item"><a class="page-link"
										href="javascript:list_go(${pageMaker.realEndPage });"> <i
											class="fa fa-angle-double-right"></i>
									</a></li>
								</ul>
							</nav>


						<div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 254.863px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                </div>

                <div class="full-height">
                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="full-height-scroll white-bg border-left" style="overflow: auto; width: auto; height: 700px;">

                        <div class="element-detail-box">

                            <div class="tab-content">
                                <div class="tab-pane active">
										<div class="float-right"
											style="margin-top: -20px; margin-right: 10px;">
											<div class="tooltip-demo">
												<button id="goCP" class="btn btn-outline btn-primary " type="button"
													onclick="corequest()">
													<i class="fa fa-handshake-o">협진요청</i>
												</button>
											</div>
										</div>



									<h4>
                                   		진료 상세
                                    </h4>
                                    		<p style="width: 1165px;"></p>
										<div id="">
											<div class="bg-primary p-xs b-r-xl titlediv" id="pasttitle"
												style="border-radius: 6px;">진료 기록</div>
											<div class="ibox-content" id="pastrecord"
												style="height: 200px; overflow: auto;"></div>


											<div class="bg-primary p-xs b-r-xl titlediv"
												style="border-radius: 6px; margin-top: 5px;">진단</div>
											<div class="ibox-content"
												style="height: 112px; overflow: auto;">
												<table class="table  recordresult">

													<tbody id="pastdiseasebody">


													</tbody>

												</table>



											</div>

											<div class="bg-primary p-xs b-r-xl titlediv"
												style="border-radius: 6px; margin-top: 5px;">처방 내역</div>
											<div class="ibox-content"
												style="height: 160px; overflow: auto;">

												<table class="table" id="drugList" style="text-align: center;">
													<thead>
														<tr>

															<th>약명</th>
															<th>1회급여량</th>
															<th>하루 투약 횟수</th>
															<th>투약일</th>

														</tr>
													</thead>
													<tbody id="pastdrug" >
													</tbody>
												</table>


											</div>

										</div>



									</div>

                            </div>

                        </div>

                    </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 195.142px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                </div>



            </div>


	</div>
	</div>
		<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
	<!-- datepicker 날짜만 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/x-handlebars-template" id="pastdruglist">
	{{#each.}}

		<tr class="medicinemove" >

		<td class="drugName">{{cureName}}</td>
		<td>{{pQuantity}}</td>
		<td>{{pAday}}</td>
		<td>{{pDays}}</td>
	</tr>

    {{/each}}
</script>
<script type="text/x-handlebars-template" id="pastmaindisease">


						<tr>
							<td class="secondpastresult" style="width :6%;"><strong>주상병</strong></td>
							<td  style="width :90%;">{{dName}}<input type="hidden" name="dName" value="{{dName}}"></td>
						</tr>

</script>
<script type="text/x-handlebars-template" id="pastsubdisease">
{{#each.}}
						<tr>
							<td class="secondpastresult" style="width :6%;"><strong>부상병</strong></td>
							<td style="width :90%;" >{{subDName}}<input type="hidden" name="subDName" value="{{subDName}}"></td>
						</tr>
 {{/each}}

</script>

<script type="text/x-handlebars-template" id="pastpic">
{{#each.}}
						<div class='pastimg' style="background-image:url('<%=request.getContextPath()%>/medi/getPic?mpNo={{mpNo}}')  " onclick="detailImg('{{mpNo}}')"></div>

 {{/each}}

</script>

<script type="text/x-handlebars-template" id="pastfile">
{{#each.}}
<div class="file" onclick="location.href='getFile?mfNo={{mfNo}}'">
                                    <a>
                                        <span class="corner"></span>

                                        <div class="icon">
                                            <i class="fa fa-file"></i>
                                        </div>
                                        <div class="file-name">
                                           {{mfFilename}}
                                        </div>
                                    </a>
                                </div>
 {{/each}}

</script>

<script>
	$('.datepicker').datepicker( {dateFormat: 'yy-mm-dd' } );

	$(document).ready(function(){
		var li = $("li").first();
		console.log(li);

		$("li").first().find("a").addClass("active");
		$("li").first().find("a").trigger("click");
	});

	function resetList(){
		$('#startDate').val(null);
		$('#endDate').val(null);
		list_go(1);
	}

	function list_go(page){
		  url = "/history/diagnosis_history.do";

		  var startDate = $('#startDate').val();
		  var endDate = $('#endDate').val();

		   subgoPage(url+"?page="+page+"&perPageNum=7&startDate="+startDate+"&endDate="+endDate);
		}

	function corequest(pNo){
		openWin = window.open("<%=request.getContextPath()%>/cooperation/cooperationRegist?pNo="+pNo,"협진요청", "width=700, height=600, left=600, top=150")

	}
	function pastchart(mNo){
		var no ={"mNo" : mNo};
		$.ajax({
			url: "<%=request.getContextPath()%>/medi/pastreco",
					type : 'post',
					data : JSON.stringify(no),
					contentType : 'application/json',
					success : function(data) {
						console.log(data)
						$('#pastrecord').html(data.pastsymptom.symptom+"<br>");
						printData(data.pic, $('#pastrecord'), $('#pastpic') )
						printData(data.file, $('#pastrecord'), $('#pastfile') )
						$('#pasttitle').text(
								"과거 진료 기록 (" + data.pastsymptom.mDate + ")")


						var template = Handlebars.compile($('#pastmaindisease').html());
						var dName = {"dName": data.pastsymptom.dName};
						var html = template(dName);

						$('#pastdiseasebody').html(html);



						var template = Handlebars
								.compile($('#pastdruglist').html());

						var html = template(data.orderdruglist);

						$('#pastdrug').html(html);


						printData(data.sub_dlist, 	$('#pastdiseasebody'),$('#pastsubdisease'))

						$('#goCP').attr("onclick","corequest('"+ data.pastsymptom.pNo+"')")

					}
				})
			}


	function coSuccess() {
		swal({
			title : "협진 요청",
			text : "성공적으로 협진 요청이 되었습니다.",
			type : "success",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "OK",
			closeOnConfirm : false
		})

	}
	function coFail() {
		swal({
			title : "협진 요청",
			text : "협진 요청에 실패하였습니다.",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "OK",
			closeOnConfirm : false
		})
	}
	</script>
</body>
</html>