<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="list" value="${dataMap.list}" />
<c:set var="historyList" value="${dataMap.historyList}" />
<c:set var="selectLast" value="${dataMap.selectLast}" />
<c:set var="chartPicList" value="${dataMap.chartPicList}" />
<c:set var="chartFileList" value="${dataMap.chartFileList}" />
<c:set var="lastPreList" value="${dataMap.lastPreList}" />
<c:set var="myIssueList" value="${dataMap.myIssueList}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	margin-left: 25px;
}
.navy-bg, .bg-primary{
    background: #79afc8;
    border-radius: 6px;
}
}

</style>
</head>
<body>
	<div style="padding-top: 20px;">
		<h3 style="margin-left: 16px; display: inline-block; width: 58%;">협진
			히스토리</h3>
		<div style="display: inline-block;">
			<span><strong>협진일</strong> </span>
			<div class="form-group"
				style="display: inline-block; margin-left: 10px;">
				<div class="col-md-6" style="display: contents;">
					<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
						for="date"></label> <input
						class="datepicker form-control hasDatepicker" type="text"
						placeholder="YYYY - mm - dd" id="datepicker" name="title"
						style="display: inline; width: 61%; margin-left: 10px;">
				</div>
			</div>
			<span style="margin-left: -39px;"> - </span>
			<div class="form-group"
				style="display: inline-block; margin-left: 6px;">
				<div class="col-md-6" style="display: contents;">
					<i class="fa fa-calendar" style="margin-left: 3.5%;"></i> <label
						for="date"></label> <input class="datepicker2 form-control"
						type="text" placeholder="YYYY - mm - dd" id="datepicker2"
						name="title2"
						style="display: inline; width: 61%; margin-left: 10px;">
				</div>
			</div>
			<a style="margin-left: -37px;"
					onclick="list_go(1);"> <i style="font-size: 1.5em;"
					class="fa fa-search"></i></a>
		</div>

	</div>
	<div class="col-lg-12" style="margin-top: 10px;">

		<div class="row" style="margin-top: -26px;">

		<div class="fh-breadcrumb" style="    margin-top: 20px;">

                <div class="fh-column" style="">
                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 700px;">
                    <div class="full-height-scroll" style="overflow: hidden; width: auto; height: 655px;">
                        <ul class="list-group elements-list">
                            <c:forEach items="${list}" var="list">

                            <li class="list-group-item">
                                <a class="nav-link" data-toggle="tab" onclick="comeon('${list.coNo}')">
                                    <small class="float-right text-muted">${list.coStartDate}</small>
                                    <strong>${list.pName}[${list.pSex}]</strong>
                                    <div class="small m-t-xs" style="font-size: 13px;">
                                    <p class="m-b-none">
                                            ${list.pRnum}
                                        </p>
                                        <p class="m-b-xs">
                                          <strong>주상병</strong>&nbsp;${list.coDisease}<br>
                                          <c:if test="${!empty list.subDName}">
                                          	<strong>부상병</strong>&nbsp;${list.subDName}
                                          </c:if>
                                        </p>
                                        <p class="m-b-none">

                                        </p>
                                    </div>
                                </a>

                                <input type="hidden" id="cooperation" value="${list.pName}"/>
                                <input type="hidden" id="cooperation" value="${list.pSex}"/>
                                <input type="hidden" id="cooperation" value="${list.pRnum}"/>
                                <input type="hidden" id="cooperation" value="${list.coStartDate}"/>
                                <input type="hidden" id="cooperation" value="${list.endDate}"/>
                                <input type="hidden" id="cooperation" value="${list.coDisease}"/>
                                <input type="hidden" id="cooperation" value="${list.subDName}"/>
                                <input type="hidden" id="cooperation" value="${list.symptom}"/>
                                <input type="hidden" id="cooperation" value="${list.mOpinion}"/>


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

											</div>
										</div>



									<h4>
                                   		협진상세
                                    </h4>
                                    		<p style="width: 1165px;"></p>
										<div id="">
											<div class="bg p-xs b-r-xl titlediv" id="pasttitle"
												style="color:white; background: #79afc8;border-radius: 6px;">협진 기록</div>
											<div class="ibox-content" id="pastrecord"
												style="height: 200px; overflow: auto;"></div>

											<div class="bg p-xs b-r-xl titlediv"
												style="color:white; background: #79afc8; border-radius: 6px; margin-top: 5px;">소견서</div>
											<div class="ibox-content"
												style="height: 112px; overflow: auto;">
												<table class="table table-bordered recordresult">
													<tbody id="pastdiseasebody">


													</tbody>
												</table>



											</div>

											<div class="bg p-xs b-r-xl titlediv"
												style="color:white; background: #79afc8; border-radius: 6px; margin-top: 5px;">처방 내역</div>
											<div class="ibox-content"
												style="height: 160px; overflow: auto;">

												<table class="table table-bordered">

													<tbody id="pastdrug">
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


	<!-- datepicker 날짜만 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
	$('.datepicker').datepicker();

	function list_go(page){
		  url = "/history/cooperation_history.do";

		   subgoPage(url+"?page="+page+"&perPageNum=7");
		}


	function pastchart(mNo){
		var no ={"coNo" : coNo};
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
						$('#pasttitle').text("과거 진료 기록 (" + data.pastsymptom.mDate + ")")


						var template = Handlebars.compile($('#pastmaindisease').html());
						var dName = {"dName": data.pastsymptom.dName};
						var html = template(dName);

						$('#pastdiseasebody').html(html);



						var template = Handlebars
								.compile($('#pastdruglist').html());

						var html = template(data.orderdruglist);

						$('#pastdrug').html(html);


						printData(data.subDlist, 	$('#pastdiseasebody'),$('#pastsubdisease'))

					}
				})
			}
	</script>
</body>
</html>