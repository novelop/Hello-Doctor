<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/blueimp/css/blueimp-gallery.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<style>
* {
	font-size: small;
}

h4 {
	border: 1px solid #e2e2e2;
	margin: 0;
	text-align: center;
	background-color: #afedfa;
	font-size: 13px;
}

div {

}

body {
	margin-top: 5px;
	height: 850px;
}

.main {
	margin-bottom: 5px;
}

#left {
	width: 20%;
	height: 850px;
	float: left;
	margin-right: 5px;
}

#middle {
	width: 45%;
	height: 850px;
	float: left;
	margin-right: 5px;
}

#right {
	width: 33%;
	height: 850px;
	float: left;
}

#wating {
	width: 100%;
	height: 30%;
}

#recordlist {
	width: 100%;
	height: 25%;
}

#inputpic {
	width: 100%;
	height: 43%;
}

#info {
	width: 100%;
	height: 6%;
}

#chart {
	width: 100%;
	height: 40%;
}

#pastchart {
	width: 100%;
	height: 54%;
}

#buttonframe {
	width: 100%;
	height: 6%;
}

#orderset {
	width: 100%;
	height: 41%;
}

#order {
	width: 20px;
}

#watingtable {
	display: block;
	overflow: auto;
	height: 220px;
	margin-bottom: 0;
}

#recordtable {
	display: block;
	width: 100%;
	overflow: auto;
	height: 180px;
	margin-bottom: 0;
}

#fileupload {
	display: block;
	overflow: auto;
	height: 45px;
	margin-bottom: 0;
}

.recordtablelist {
	width: 500px;
	text-align: center;
	cursor: pointer;
}

.result {
	width: 84%;
	margin: 0 auto;
	margin-top: 5px;
	margin-left: 30px;
	background-color: #e2e2e2;
}

.fa-paperclip {
	display: block;
	border: 1px solid #e2e2e2
}

.lightBoxGallery {
	display: block;
	overflow: auto;
	height: 100px;
	margin-bottom: 0;
}

.ibox {
	height: 100%;
}

.ibox-content {
	padding: 0;
}

.number {
	width: 50px;
	heigh: 30px;
}

.medicine {
	display: block;
	overflow: auto;
	height: 210px;
	margin-bottom: 0;
}

td, th {
	text-align: center;
}

.closebutton {
	font-size: 20px;
	color: red;
}

.clear {
	clear: both;
}

.table-bordered {
	border: none;
}

#dur {
	float: right;
	height: 25px;
	font-size: small;
	color: white;
}

#pastrecord {
	display: block;
	overflow: auto;
	height: 250px;
	width: 100%;
}

.card-header, .card-body {
	padding: 0;
}

h5 {
	text-align: center;
}

.panel-body {
	display: block;
	overflow: auto;
	height: 200px;
	width: 100%;
}

.mediname {
	width: 300px;
}

.fa-medkit {
	float: right;
	font-size: 20px;
	cursor: pointer;
}

.fa-paperclip, .mediname {
	cursor: pointer;
}

.uploadimg {
	width: 180px;
    height: 130px;
}

#prescriptionbox {
	height: 250px;
}

.pastpic {
	width: 150px;
	height: 150px;
}

#ordersetbody {
	padding: 0;
	height: 306px;
}

.titlediv {
	text-align: center;
	width: 100%;
	padding: 5px;
	background-color: #e2f0ff !important;
	color: black;
}

.underchart {
	height: 54%;
	width: 100%;
}

.recordresult {
	padding: 0;
}

.selectbox {
	padding-top: 0;
	height: 22px;
}

.diseasename {
	width: 365px;
}

.secondpastresult {
	width: 60px;
}

#autocomplete {
	font-size: 20px;
	width: 30px;
	height: 30px;
	padding-top: 0;
	float: right;
}

#automodify {
	font-size: 17px;
	width: 30px;
	height: 30px;
	padding-top: 0;
	margin-right: 5px;
	float: right;
}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body class="light-skin pace-done">


	<div id="left">

		<div id="wating" class="main">
			<div class="ibox">
				<div class="bg-primary p-xs b-r-xl titlediv">외래 대기 환자</div>



				<div class="ibox-content">

					<table class="table" id="watingtable">
						<thead>

							<tr>
								<th id="order"></th>
								<th>성명</th>
								<th>주민번호</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${patient}" var="i" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${i.pName }</td>
									<td>${i.pRnum }</td>
									<td>${i.rsvName }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>

		<div id="recordlist">
			<div class="ibox">
				<div class="bg-primary p-xs b-r-xl titlediv">진료 내역</div>
				<div class="ibox-content">
					<table class="table table-bordered" id="recordtable">

						<tbody>

						</tbody>
					</table>

				</div>
			</div>
		</div>
		<div id="inputpic">
			<div class="ibox" style="hieght: 100% !important">
				<div class="bg-primary p-xs b-r-xl titlediv">자료 등록</div>
				<div class="ibox-content"
					style="text-align: center; padding-top: 10px; height: 100%">
					<button class="btn-primary" style="width: 30%" onclick="webcapture()">
						<i class="fa fa-camera">촬영</i>
					</button>
					<button class="btn-primary" style="width: 30%">
						<i class="fa fa-file-image-o">등록</i>
					</button>
					<button class="btn-primary" style="width: 30%">
						<i class="fa fa-upload">등록</i>
					</button>
					<div class="hr-line-dashed"></div>
					<div class="lightBoxGallery" id="lightBoxGallery" style="height: 250px;">


						<!-- The Gallery as lightbox dialog, should be a child element of the document body -->

					</div>
					<div id="fileupload">

						<span class="clear"></span>

					</div>
					<div></div>

				</div>
			</div>


		</div>

	</div>

	<div id="middle">
		<div id="info">
			<div class="bg-primary p-xs b-r-xl"
				style="margin-top: 10px; text-align: center">
				다음 진료 환자 : ${patient[0].pName}  | ${patient[0].pRnum} | ${patient[0].rsvName}
		</div>
		</div>
		<div id="chart">
			<div class="ibox" style="margin-bottom: 0">

				<div class="bg-primary p-xs b-r-xl titlediv">
					진료 기록




					<button data-toggle="dropdown" class="btn btn-circle" type="button"
						id="automodify">
						<i class="fa fa-ellipsis-v"></i>
						<ul class="dropdown-menu float-right" x-placement="bottom-start"
							style="position: absolute; top: 35px; left: 882px; will-change: top, left;">
							<li onclick="automodify()"><a>진료 폼 수정</a></li>
						</ul>

					</button>

					<button class="btn btn-circle " type="button" id="autocomplete">
						<i class="fa fa-pencil-square-o"></i>
					</button>
				</div>

				<div class="ibox-content" style="height: 95%;">

					<textarea class="form-control border-left"
						style="height: 320px; resize: none; font-size: 14px;"
						spellcheck="false">

                            </textarea>

				</div>
			</div>


		</div>

		<div class="underchart">
			<div class="ibox" style="margin-bottom: 0">

				<div class="bg-primary p-xs b-r-xl titlediv">진단</div>
				<div class="ibox-content" style="height: 170px;">


					<br> <input type="text" placeholder="진단명을 입력해 주세요"
						class="typeahead_2 form-control"
						style="width: 70%; display: inline-block; margin-left: 30px">
					<button class="btn btn-primary " type="button">
						<i class="fa fa-check"></i>&nbsp;등록
					</button>



					<table class="table table-bordered recordresult">
						<thead>
							<tr>
								<th class="diseasename">상병명</th>
								<th colspan="2">상병 구분</th>

							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>


				</div>

				<div class="ibox" style="margin-bottom: 0" id="prescriptionbox">

					<div class="bg-primary p-xs b-r-xl titlediv">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
						&nbsp; &nbsp; &nbsp; 처방 <a class="btn btn-danger btn-rounded"
							id="dur">DUR점검</a><span class="clear"></span>
					</div>

					<div class="ibox-content" style="height: 94%;">


						<input type="text" placeholder="의약품명을 입력해 주세요"
							class="typeahead_2 form-control"
							style="width: 70%; display: inline-block; margin-left: 30px; margin-bottom: 10px; margin-top: 20px;">
						<button class="btn btn-primary " type="button">
							<i class="fa fa-plus-circle"></i>&nbsp;추가
						</button>
						<table class="table table-bordered medicine">
							<thead>
								<tr>
									<th class="mediname">약명</th>
									<th>수량</th>
									<th>일투수</th>
									<th colspan="2">투약일</th>

								</tr>
							</thead>
							<tbody>




							</tbody>
						</table>


					</div>

				</div>
			</div>
		</div>
	</div>
	<div id="right">
		<div id="buttonframe">
			<p style="text-align: right">
				<c:if test="${!empty patient[0].taNo}">
					<button class="btn btn-outline btn-success dim" type="button"
						onclick="gocoChart('${patient[0].pNo}','${patient[0].taNo}')">
						<i class="fa fa-sign-out ">진료시작</i>
					</button>
				</c:if>
				<c:if test="${empty patient[0].taNo}">
					<button class="btn btn-outline btn-success dim" type="button"
						onclick="goChart('${patient[0].pNo}')">
						<i class="fa fa-sign-out ">진료시작</i>
					</button>
				</c:if>
			<p>
		</div>
		<div id="pastchart">
			<div class="ibox" style="margin-bottom: 0">
				<div class="bg-primary p-xs b-r-xl titlediv">과거 진료
					기록</div>
				<div class="ibox-content" id="pastrecord">


				</div>


				<div class="ibox" style="margin-bottom: 0">

					<div class="bg-primary p-xs b-r-xl titlediv">진단</div>
					<div class="ibox-content" style="height: 35px;">
						<table class="table table-bordered recordresult">
							<tbody>
								<tr>


								</tr>

							</tbody>
						</table>



					</div>
					<div class="ibox" style="margin-bottom: 0">

						<div class="bg-primary p-xs b-r-xl titlediv">처방</div>
						<div class="ibox-content" style="height: 75px;">

							<table class="table table-bordered" class="medicine">

								<tbody>

								</tbody>
							</table>


						</div>

					</div>
				</div>

			</div>


		</div>
		<div id="orderset">
			<div class="tabs-container">
				<div class="bg-primary p-xs b-r-xl titlediv">오더세트</div>
				<div class="panel-body" id="ordersetbody">
					<div id="accordion">
						<c:forEach items="${orderset}" var="i" varStatus="status">
							<div class="card">
								<div class="card-header" id="headingOne"
									onclick="druglist('${i.moNo}','${status.index}')">
									<h5 class="mb-0">
										<button class="btn btn-link" data-toggle="collapse"
											data-target="#collapse${status.index}" aria-expanded="true"
											aria-controls="collapse${status.index}">
											${i.dName}</button>
										<i class="fa fa-medkit"></i><span class="clear"></span>
									</h5>
								</div>

								<div id="collapse${status.index}" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">
										<table class="table table-bordered" class="medicine">
											<tbody id="drughandle${status.index}">

											</tbody>

										</table>

									</div>
								</div>
							</div>
						</c:forEach>
						<div class="card">
							<div class="card-header" id="headingTwo">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapse2" aria-expanded="false"
										aria-controls="collapseTwo">접촉성 피부염</button>
									<i class="fa fa-medkit"></i><span class="clear"></span>
								</h5>
							</div>
							<div id="collapse2" class="collapse" aria-labelledby="headingTwo"
								data-parent="#accordion">
								<div class="card-body">
									<table class="table table-bordered" class="medicine">
										<tbody>
											<tr>
												<td class="mediname">항히스타민제</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
											<tr>
												<td class="mediname">스테로이드제</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
										</tbody>
									</table>

								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingThree">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapse3" aria-expanded="false"
										aria-controls="collapseThree">알레르기</button>
									<i class="fa fa-medkit"></i><span class="clear"></span>
								</h5>
							</div>
							<div id="collapse3" class="collapse"
								aria-labelledby="headingThree" data-parent="#accordion">
								<div class="card-body"></div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingTwo">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapse4" aria-expanded="false"
										aria-controls="collapseTwo">화상</button>
									<i class="fa fa-medkit"></i><span class="clear"></span>
								</h5>
							</div>
							<div id="collapse4" class="collapse" aria-labelledby="headingTwo"
								data-parent="#accordion">
								<div class="card-body">
									<table class="table table-bordered" class="medicine">
										<tbody>
											<tr>
												<td class="mediname">항히스타민제</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
											<tr>
												<td class="mediname">스테로이드제</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
										</tbody>
									</table>

								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingTwo">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapse5" aria-expanded="false"
										aria-controls="collapseTwo">아토피(영유아)</button>
									<i class="fa fa-medkit"></i><span class="clear"></span>
								</h5>
							</div>
							<div id="collapse5" class="collapse" aria-labelledby="headingTwo"
								data-parent="#accordion">
								<div class="card-body">
									<table class="table table-bordered" class="medicine">
										<tbody>
											<tr>
												<td class="mediname">항히스타민제</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
											<tr>
												<td class="mediname">스테로이드제</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
										</tbody>
									</table>

								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingTwo">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed" data-toggle="collapse"
										data-target="#collapse6" aria-expanded="false"
										aria-controls="collapseTwo">여드름</button>
									<i class="fa fa-medkit"></i><span class="clear"></span>
								</h5>
							</div>
							<div id="collapse6" class="collapse" aria-labelledby="headingTwo"
								data-parent="#accordion">
								<div class="card-body">
									<table class="table table-bordered" class="medicine">
										<tbody>
											<tr>
												<td class="mediname">항히스타민제</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
											<tr>
												<td class="mediname">스테로이드제</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>


	</div>



	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>


	<!-- Peity -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/peity/jquery.peity.min.js"></script>


	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

	<!-- Peity -->
	<script
		src="<%=request.getContextPath()%>/resources/js/demo/peity-demo.js"></script>

	<!-- blueimp gallery -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
	<!-- Sweet alert -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

	<script type="text/x-handlebars-template" id="orderlist">
	{{#each.}}

		<tr id="drugremove{{@index}}">
		<td class="mediname">{{oDrug}}</td>
		<td>{{quantity}}</td>
		<td>{{aday}}</td>
		<td>{{days}}</td>
	</tr>

    {{/each}}
</script>
	<script>

	function druglist(moNo, number){
		var here = "drughandle"+number;
		console.log(here)
		var no = {"moNo" : moNo}
		$.ajax({
			url: "<%=request.getContextPath()%>/medi/orderlist",
				type : 'post',
				data : JSON.stringify(no),
				contentType : 'application/json',
				success : function(data) {
					printData(data, $('#' + here), $('#orderlist'),
							$('#drugremove' + number));
				}
			})

		}

		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});

		});

		$.get('js/api/typehead_collection.json', function(data) {
			$(".typeahead_2").typeahead({
				source : data.countries
			});
		}, 'json');

		function detailImg() {
			window.open("detailImg", "",
					"width=800, height=700, left=500, top=200")
		}
		$('.demo3').click(function() {
			swal({
				title : "과거에 협진 이력이 있습니다.",
				text : "과거의 협진 이력을 확인하시겠습니까?",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "OK",
				closeOnConfirm : false
			}, function() {
				swal.close();
				pastcopper();
			});
		});

		$('.demo4').click(function() {
			swal({
				title : "협진 중인 환자입니다.",
				text : "진료기록을 협진 기록과 공유하시겠습니까?",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "OK",
				closeOnConfirm : false
			}, function() {
				swal.close();
				issueregist()
			});
		});
		function pastcopper() {
			window.open("pastcooper.do", "",
					"width=900, height=500, left=500, top=300")
		}
		function issueregist() {
			window.open("issueregist.do", "",
					"width=500, height=500, left=600, top=300")

		}
		function automodify() {
			window.open("automodify.do", "",
					"width=500, height=500, left=600, top=300")

		}
		function goChart(pNo) {
			subgoPage("/medi/chart.do?pNo=" + pNo);
		}
		function webcapture(){
			window.open("webcapture", "",
			"width=500, height=600, left=600, top=150")


		}
		function gocoChart(pNo, taNo){
			subgoPage("/medi/cochart.do?pNo=" + pNo+"&taNo="+taNo);
		}
	</script>
</body>

</html>