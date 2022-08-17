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
	width: 22%;
	height: 850px;
	float: left;
	margin-right: 5px;
}

#middle {
	width: 45%;
	height: 850px;
	float: left;
	margin-right: 5px;
	margin-left: 5px;
}

#right {
	width: 31%;
	height: 850px;
	float: left;
	margin-top: 15px;
}

#wating {
	width: 100%;
	height: 33%;
}

#recordlist {
	width: 100%;
	height: 23.3%;
}

#inputpic {
	width: 100%;
	height: 40%;
}

#info {
	display: inline-block;
	height: 6%;
	margin-left: 24%;
	width: 510px;
}

#chart {
	width: 100%;
	height: 40%;
}

#pastchart {
	width: 100%;
	height: 63.4%;
}

#buttonframe {
	height: 6%;
	display: inline-block;
	float: right;
	width: 30%;
	margin-top: 13px;
    margin-bottom: 7px;
    margin-right: 15px;
}

#orderset {
	width: 100%;
	height: 34%;
}

#order {
	width: 20px;
}

#watingtable {
	margin-bottom: 0;
}

#recordtable {
	display: block;
	width: 100%;
	overflow: auto;
	height: 170px;
	margin-bottom: 0;
}
#chartbox{
    height: 92%;
    top: -3px;
    position: relative;

}
#fileupload {


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
	height: 100px;
	margin-bottom: 0;
}

.ibox {
	height: 100%;
}

.ibox-content {
	padding: 0;
	overflow: auto;
}

.number {
	width: 50px;
	heigh: 30px;
}

.medicine {
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
	height: 18px;
	font-size: x-small;
	color: white;
	padding:0;
	margin:0;
	width: 76px;
    padding-top: 1px;
}

#pastrecord {
	display: block;
	overflow: auto;
	height: 311px;
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
#dieaseRegist{
    top: -2px;
    position: relative;
    height: 28px;
    padding-top: 3px;

}
#drugRegist{
    height: 29px;
    position: relative;
    top: -2px;

}
.uploadimg {
	width: 40%;
	height: 100px;
	float: left;
	margin-left: 10px;
	background-size: cover;
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
	height: 251px;
}

.titlediv {
	text-align: center;
	width: 100%;
	padding: 5px;
	background-color: rgb(26, 179, 148) !important;
	color: white;
	font-weight: bold;
	letter-spacing: 5px;
	font-size: 12px;
	word-spacing: 0px;
	border-radius: 5px;
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
	width: 26px;
	height: 26px;
	padding-top: 0;
	float: right;
	    position: relative;
    top: -5px;
}

#automodify {
	font-size: 17px;
	width: 25px;
	height: 25px;
	padding-top: 0;
	margin-right: 5px;
	float: right;
	position: relative;
    top: -3px;
}

.dropdown-menu {
	margin-left: 25px;
}
#textform{
height: 313px;
 resize: none;
  font-size: 14px;

}
.drugName{
	text-align: left;
width: 270px;
}
}
#hiddendata {
	display: none;
}

.reload {
	float: right;
	margin-right: 15px;
}

.red::before {
	color: red;
}

.pastimg {
	background-size: cover;
	width: 45%;
	height: 120px;
	float: left;
	display: inline-block;
	margin: 5px;
}

.pastfile {
	text-align: center;
	height: 20px;
}

.file {
	width: 45%;
	float: left;
	margin: 5px;
}

.file .icon {
	padding: 0;
	height: 80px;
}

.fa-ellipsis-v, .fa-pencil-square-o {
	color: white;
}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body class="light-skin pace-done">
	<div id="top">
		<div id="info">
			<div class="bg-primary p-xs b-r-xl"
				style="margin-top: 10px; text-align: center; background-color: #3492f6 !important ">${patientinfo.pName }
				<c:if test="${not empty taNo }">
					<i class="fa fa-users" style="color: black"></i>
				</c:if>
				| ${patientinfo.pRnum }세 | ${patientinfo.pSex } | ${patientinfo.pTel }
				| ${patientinfo.pInsurance } | ${patientinfo.pAddress }
			</div>
		</div>
		<div id="buttonframe">
			<p style="text-align: right">

				<c:if test="${not empty taNo}">
					<button class="btn  btn-warning" type="button"
						onclick="reservationDetail('${taNo}')" )>
						<i class="fa fa-handshake-o">예약확인</i>
					</button>
				</c:if>
				<button class="btn  btn-info " type="button"
					onclick="corequest()">
					<i class="fa fa-handshake-o">협진요청</i>
				</button>
				<c:if test="${not empty taNo}">
					<button class="btn btn-success  demo4" type="button">

						<i class="fa fa-sign-out ">진료완료</i>
					</button>
				</c:if>
				<c:if test="${empty taNo}">
					<button class="btn  btn-success " type="button"
						onclick="regist()">
						<i class="fa fa-sign-out ">진료완료</i>
					</button>
				</c:if>
			<p>
		</div>

	</div>
	<div id="right">
		<div id="pastchart">
			<div class="ibox" style="margin-bottom: 0">
				<div class="bg-primary p-xs b-r-xl titlediv" id="pasttitle">이전
					진료 기록 없음</div>
				<div class="ibox-content" id="pastrecord"></div>



					<div class="bg-primary p-xs b-r-xl titlediv">이전 진단</div>
					<div class="ibox-content" style="height: 50px;">
						<table class="table table-bordered recordresult">
							<tbody id="pastdiseasebody">


							</tbody>
						</table>



					</div>

						<div class="bg-primary p-xs b-r-xl titlediv">이전 처방</div>
						<div class="ibox-content" style="height: 94px;">

							<table class="table table-bordered" class="medicine">

								<tbody id="pastdrug">
								</tbody>
							</table>


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
											aria-controls="collapse${status.index}">${i.oTitle}</button>
										<i class="fa fa-medkit" onclick="allorderinput('${i.moNo}')"></i><span
											class="clear"></span>
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


					</div>
				</div>
			</div>
		</div>
			</div>

		</div>

	</div>


	<form id="chartform" action="regist" method="POST"	enctype="multipart/form-data">
		<div id="middle">

			<div id="chart">
				<div class="ibox" style="margin-bottom: 0">

					<div class="bg-primary p-xs b-r-xl titlediv">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 진료 차트


						<button data-toggle="dropdown" class="btn btn-circle"
							type="button" id="automodify">
							<i class="fa fa-ellipsis-v"></i>
							<ul class="dropdown-menu float-right" x-placement="bottom-start"
								style="position: absolute; top: 35px; left: 882px; will-change: top, left;">
								<li onclick="autoChoose()"><a>진료 폼 수정</a></li>
							</ul>

						</button>

						<button class="btn btn-circle " type="button" id="autocomplete">
							<i class="fa fa-pencil-square-o"></i>
						</button>
					</div>
					<div class="ibox-content" id="chartbox">

						<textarea name="chart" id="textform"
							class="form-control border-left"
							spellcheck="false">

                            </textarea>

					</div>
				</div>


			</div>

			<div class="underchart">
				<div class="ibox" style="margin-bottom: 0">

					<div class="bg-primary p-xs b-r-xl titlediv">진단</div>
					<div class="ibox-content" style="height: 170px;">


						<input type="text" placeholder="진단명을 입력해 주세요"
							class="typeahead_1 form-control" autocomplete="off"
							style="width: 70%; display: inline-block; margin-left: 30px; margin-top: 10px; margin-bottom: 10px;"
							id="diseasename">
						<button class="btn btn-info " id="dieaseRegist" type="button"
							onclick="diseaseregist()">
							<i class="fa fa-check"></i>&nbsp;등록
						</button>



						<table class="table table-bordered recordresult">
							<thead>
								<tr>
									<th class="diseasename">상병명</th>
									<th colspan="2">상병 구분</th>

								</tr>
							</thead>
							<tbody id="diseaseresult">


							</tbody>
						</table>


					</div>

					<div class="ibox" style="margin-bottom: 0" id="prescriptionbox">

						<div class="bg-primary p-xs b-r-xl titlediv">
							&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  처방 <a
								class="btn btn-danger btn-rounded" id="dur">DUR</a><span
								class="clear"></span>
						</div>

						<div class="ibox-content" style="height: 100%; padding-top: 10px">


							<input type="text" placeholder="의약품명을 입력해 주세요" id="medicinename"
								class="typeahead_2 form-control" autocomplete="off"
								style="width: 70%; display: inline-block; margin-left: 30px; margin-bottom: 10px;">
							<button class="btn btn-info " type="button" id="drugRegist"
								onclick="medicineregist()">
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
								<tbody id="medicineresult">

								</tbody>
							</table>


						</div>

					</div>
				</div>
			</div>
		</div>
		<div id="hiddendata">
			<input type="hidden" name="pNo" value="${patientinfo.pNo}">
			<input type="hidden" name="nextpNo" value="${patient[0].pNo}">
			<input type="hidden" name="nextptaNo" value="${patient[0].taNo}">
			<c:if test="${not empty patientinfo.coNo}">
				<input type="hidden" name="coNo" value="${patientinfo.coNo}">
				<input type="hidden" name="taNo" value="${taNo}">

			</c:if>
			<c:if test="${not empty patientinfo.rsvNo}">
				<input type="hidden" name="rsvNo" value="${patientinfo.rsvNo}">
			</c:if>
			<div id="ordersetused"></div>
		</div>
	</form>
	<div id="left">

		<div id="inputpic">
			<div class="ibox" style="hieght: 100% !important">
				<div class="bg-primary p-xs b-r-xl titlediv">자료 등록</div>
				<div class="ibox-content"
					style="text-align: center; padding-top: 5px; height: 92%">
					<button class="btn btn-info" style="width: 30%"
						onclick="webcapture()">
						<i class="fa fa-camera">촬영</i>
					</button>
					<button class="btn btn-info" style="width: 30%"
						onclick="uploadpic()">
						<i class="fa fa-file-image-o">등록</i>
					</button>
					<button class="btn btn-info" style="width: 30%"
						onclick="uploadfile()">
						<i class="fa fa-upload">등록</i>
					</button>
					<div class="hr-line-dashed"></div>
					<div class="lightBoxGallery" id="lightBoxGallery">


						<!-- The Gallery as lightbox dialog, should be a child element of the document body -->

					</div>

					<div id="fileupload"></div>
					<div></div>

				</div>
			</div>
		</div>

		<div id="recordlist">
			<div class="ibox">
				<div class="bg-primary p-xs b-r-xl titlediv">진료 내역</div>
				<div class="ibox-content">
					<table class="table table-bordered" id="recordtable">

						<tbody>
							<c:forEach items="${pastreco}" var="i">

								<tr>
									<td class="recordtablelist" onclick="pastchart('${i.mNo}')">${i.mDate}</td>

								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
		</div>
		<div id="wating" class="main">
			<div class="ibox">
				<div class="bg-primary p-xs b-r-xl titlediv">
					&nbsp; &nbsp; &nbsp;외래 대기 환자 <a class="fa fa-refresh reload"
						onclick="reload()"></a>
				</div>

				<div class="ibox-content"  style="height: 251px;">

					<table class="table" id="watingtable">
						<thead>

							<tr>
								<th id="order"></th>
								<th>성명</th>
								<th>주민번호</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody id="reloadPatient">
							<c:forEach items="${patient}" var="i" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${i.pName }<c:if test="${not empty i.taNo }">
											<i class="fa fa-users"></i>
										</c:if>
									</td>
									<td>${i.pRnum }</td>
									<td>${i.rsvName }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>





	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
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
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/typehead/bootstrap3-typeahead.min.js"></script>
	<script type="text/x-handlebars-template" id="orderlist">
	{{#each.}}

		<tr id="drugremove{{@index}}" class="medicinemove" >
		<td class="drugName">{{oDrug}}</td>
		<td>{{quantity}}</td>
		<td>{{dgAday}}</td>
		<td>{{dgDays}}</td>
	</tr>

    {{/each}}
</script>
	<script type="text/x-handlebars-template" id="watingList">
	{{#each.}}

	<tr>
			<td>{{math  @index "+" 1}}</td>
					<td>{{pName }}
				{{#if taNo}}
					<i class="fa fa-users"></i>
				{{/if}}
					</td>
					<td>{{pRnum }}</td>
					<td>{{rsvName }}</td>
	</tr>

    {{/each}}
</script>
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
	<script type="text/x-handlebars-template" id="diseaseinput">

		<tr>
							<td>{{diseasename}}
								<input type="hidden" name="diseaseName"  value="{{diseasename}}" >
								</td>
							<td class="secondresult" style="border-right:none"><select class="form-control selectbox" name="account" >
                                        <option value="주상병" selected>주상병</option>
                                        <option value="부상병">부상병</option>
                                    </select></td>
                                    <td style="border-left: none;"><button type="button" class="close" aria-label="Close">
									<span aria-hidden="true" class="closebutton">&times;</span>
								</button></td>
						</tr>


</script>
	<script type="text/x-handlebars-template" id="medicineinput">

<tr>
								<td class="drugName">{{medicinename}}</td>
								<td>
<input type="hidden" name="medicineName"  value="{{medicinename}}" >
<input type="number" class="form-control number" name = "quantity" value="{{quantity}}" min="1"></td>
								<td><input type="number" class="form-control number" name = "aday" value="{{dgAday}}" min="0"></td>
								<td style="border-right: none;"><input type="number"
									class="form-control number" name = "days" value="{{dgDays}}" min="0"></td>
								<td style="border-left: none;"><button type="button"
										class="close" aria-label="Close">
										<span aria-hidden="true" class="closebutton">&times;</span>
									</button></td>
							</tr>

</script>
	<script type="text/x-handlebars-template" id="medicineinput2">
{{#each.}}
<tr>
								<td  class="drugName">{{oDrug}}</td>
								<input type="hidden" name="medicineName"  value="{{oDrug}}" >
								<td><input type="number" class="form-control number" name = "quantity" value="{{quantity}}"></td>
								<td><input type="number" class="form-control number" name = "aday" value="{{dgAday}}"></td>
								<td style="border-right: none;"><input type="number"
									class="form-control number" name = "days" value="{{dgDays}}"></td>
								<td style="border-left: none;"><button type="button"
										class="close" aria-label="Close">
										<span aria-hidden="true" class="closebutton">&times;</span>
									</button></td>
							</tr>

 {{/each}}
</script>
	<script type="text/x-handlebars-template" id="pastmaindisease">
						<tr>
							<td>{{dName}}</td>
							<td class="secondpastresult"> 	주상병 	  </td>
						</tr>


</script>
	<script type="text/x-handlebars-template" id="pastsubdisease">
{{#each.}}
						<tr>
							<td>{{subDName}}</td>
							<td class="secondpastresult"> 부상병 	  </td>
						</tr>
 {{/each}}

</script>
	<script type="text/x-handlebars-template" id="pastpic">
{{#each.}}
						<div class='pastimg' style="background-image:url('getPic?mpNo={{mpNo}}')" onclick="detailImg('{{mpNo}}')"></div>

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
	<script type="text/x-handlebars-template" id="fileupload2">

<div class="file text{{filenum}}">
                                    <a>
                                        <span class="corner"></span>

                                        <div class="icon">
                                            <i class="fa fa-file"></i>
<button type="button" class="close text{{filenum}}" aria-label="Close" style="float: right" onclick="fileremove(this)">
		<span aria-hidden="true" class="closebutton">×</span>
	</button>
                                        </div>
                                        <div class="file-name">
                                           {{filename}}
                                        </div>
                                    </a>
                                </div>
</script>
	<script>
	function druglist(moNo, number){
		var here = "drughandle"+number;
		console.log(here)
		var no = {"moNo" : moNo}
		$.ajax({
			url: "<%=request.getContextPath()%>/medi/orderlist",
			type: 'post',
			data : JSON.stringify(no),
			contentType : 'application/json',
			success:function(data){
				var template=Handlebars.compile($('#orderlist').html());

				   var html = template(data);


				   $('#'+here).html(html);
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

		function detailImg(data){
			window.open("detailImg?mpNo="+data, "","width=800, height=700, left=500, top=200")
		}
		 $('.demo3').click(function () {
	            swal({
	                title: "과거에 협진 이력이 있습니다.",
	                text: "과거의 협진 이력을 확인하시겠습니까?",
	                type: "warning",
	                showCancelButton: true,
	                confirmButtonColor: "#DD6B55",
	                confirmButtonText: "OK",
	                closeOnConfirm: false
	            }, function (isConfirm) {
				if(isConfirm){
	            	swal.close();
	            	pastcopper();
				}else{
					swal.close();

				}
	            });
	        });

		 $('.demo4').click(function () {
	            swal({
	                title: "협진 중인 환자입니다.",
	                text: "진료기록을 협진 기록과 공유하시겠습니까?",
	                type: "warning",
	                showCancelButton: true,
	                confirmButtonColor: "#DD6B55",
	                confirmButtonText: "OK",
	                closeOnConfirm: false
	            }, function () {
	            	swal.close();
	            	issueregist()
	            });
	        });
		 function pastcopper(){
				window.open("pastcooper.do", "","width=900, height=500, left=500, top=300")
			}
		 function reservationDetail(taNo){
				window.open("<%=request.getContextPath()%>/cooperation/reservationDetail.do?taNo="+taNo, "","width=640, height=500, left=400, top=200")
			}
		 function issueregist(){
			 window.open("issueregist.do", "","width=500, height=500, left=600, top=300")

		 }
		 function automodify(){
			 window.open("automodify.do", "","width=500, height=500, left=600, top=300")

		 }
		function goChart(pNo){
			subgoPage("/medi/chart.do?pNo="+pNo);
		}


	</script>

	<script type="text/javascript">
$('.typeahead_1').typeahead({
	 autoSelect: true,
     minLength: 2,
     delay: 0,
	source : function(word, process) { //source: 입력시 보일 목록
		var text = {"deKo": word};
	     $.ajax({
	           url :"<%=request.getContextPath()%>/medi/searchdisease"
	         , type : "POST"
	         , dataType: "JSON"
	         , data : 	JSON.stringify(text)// 검색 키워드
	         , contentType : 'application/json'
	         , success : function(response){ 	// 성공
	        	return process(response);

	         }
	         ,error : function(){ //실패
	             alert("자동완성 실패");
	         }
	     });
	 }

});
$('.typeahead_2').typeahead({
	 autoSelect: true,
     minLength: 2,
     delay: 0,
	source : function(word, process) { //source: 입력시 보일 목록
		var text = {"meName": word};
	     $.ajax({
	           url :"<%=request.getContextPath()%>/medi/searchmedicine"
	         , type : "POST"
	         , dataType: "JSON"
	         , data : 	JSON.stringify(text)// 검색 키워드
	         , contentType : 'application/json'
	         , success : function(response){ 	// 성공
	        	return process(response);
	         }
	         ,error : function(){ //실패
	             alert("자동완성 실패");
	         }
	     });
	 }
});

function diseaseregist(){
	var temp = $('#diseasename').val();
	var diseasename = temp.replace(/,/gi, "")
	$('#diseasename').val('');
	var data ={"diseasename": diseasename}

	printData(data, $('#diseaseresult'),$('#diseaseinput'))

}

function medicineregist(){
	var medicinename = $('#medicinename').val();
	 $('#medicinename').val('');
	var data ={"medicinename": medicinename}
	printData(data, $('#medicineresult'),$('#medicineinput'))

}


$(document).on('click','.medicinemove' ,function(){

	var medicinename = $(this).find('td').eq(0).text();
	var quantity = $(this).find('td').eq(1).text();
	var aday = $(this).find('td').eq(2).text();
	var days = $(this).find('td').eq(3).text();
	var data = {"medicinename":medicinename,
				"quantity":quantity,
				"dgAday":aday,
				"dgDays":days
	}
	printData(data, $('#medicineresult'),$('#medicineinput'))

});

$(document).on('click','.close' ,function(){
 var test = $(this).parents('tr').remove();
})

$('#autocomplete').on('click',function(){
	$.ajax({
		url: "<%=request.getContextPath()%>/medi/docuinput",
		type: 'get',
		success:function(data){
			$('#textform').val(data);

		}
})


})



</script>
	<script type="text/javascript">
	$(document).ready(function(){
		pastchart('${pastreco[0].mNo}');

	})
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


					printData(data.subDlist, 	$('#pastdiseasebody'),$('#pastsubdisease'))

				}
			})
		}

function webcapture(){
	window.open("webcapture", "",
	"width=500, height=600, left=600, top=150")


}
function autoChoose(){
	window.open("autoChoose.do", "",
	"width=700, height=600, left=600, top=150")


}
function allorderinput(moNo){

	var no = {"moNo" : moNo}
	$.ajax({
		url: "<%=request.getContextPath()%>/medi/orderlist",
		type: 'post',
		data : JSON.stringify(no),
		contentType : 'application/json',
		success:function(data){
			$('#ordersetused').html("<input type='hidden' name='orderuse' value='"+moNo+"'>");
			printData(data, $('#medicineresult'),$('#medicineinput2'))
		}
})
}
	num = 1;
	filenum = 1;
	function uploadpic(){

		var str = "<input type='file' class='form-control inputpic pic"+num+"' style='display:none' name='pictureFile'>";

		$('#hiddendata').append(str);

        $('.pic'+num).trigger('click');



	}
	function uploadfile(){

		var str = "<input type='file' class='form-control inputtext text"+filenum+"' style='display:none' name='textFile'  >";

		$('#hiddendata').append(str);

        $('.text'+filenum).trigger('click');


	}

$(document).on("change",".inputpic", function() {
 	var picture = $(this);
 	console.log(picture)
	var fileFormat = picture.val().substr(picture.val().lastIndexOf(".")+1).toUpperCase();
	if(!(fileFormat=="JPG" || fileFormat=="JPEG"  || fileFormat=="PNG")){
   		alert("이미지는 jpg/jpeg 형식만 가능합니다.");
   		picture.remove();
   		return;
	}

	//이미지 파일 용량 체크
   if(picture[0].files[0].size>1024*1024*5){
      alert("사진 용량은 5MB 이하만 가능합니다.");
      picture.remove();
      return;
   };

	   var reader = new FileReader();
	   reader.onload = function(e) {
		   var result = reader.result
		 $("#lightBoxGallery").append("<div class='uploadimg pic"+num+"' style='background-image:url("+ result+")' > <button type='button' class='close pic"+num+"' aria-label='Close'  onclick='fileremove(this)'><span aria-hidden='true' class='closebutton'>×</span></button><div> ");
		num = num +1 ;
	   }
		reader.readAsDataURL(picture[0].files[0]);


	});
	$(document).on("change",".inputtext", function() {

 	var text = $(this);
	var fileFormat = text.val().substr(text.val().lastIndexOf(".")+1).toUpperCase();
	if(!(fileFormat=="TXT" || fileFormat=="PDF"  || fileFormat=="XML"  || fileFormat=="XLS" || fileFormat=="HWP")){
   		alert("이미지는 TXT/XML/PDF/XLS 형식만 가능합니다.");
   		text.remove();
   		return;
	}
	filename = text[0].files[0].name;
	result = {"filename" : filename,
				"filenum":filenum};
	printData(result, $('#fileupload'),$('#fileupload2'))
 	 filenum = filenum +1 ;
	});

	$(document).on('click', '#dur',function(){
		jsondata = [];

		var Objects = $(this).parents('.ibox').find('.drugName');
		for(let i=0; i<Objects.length ; i++){
			jsondata.push(Objects[i].innerText)

		}
		$.ajax({
			url : "durCheck",
			type: 'post',
			data : JSON.stringify(jsondata),
			contentType : 'application/json',
			success:function(data){
			if(data == 1 ){
			      swal({
		                title: "DUR점검 완료!",
		                text: "주의 약품이 없습니다.",
		                type: "success"
		            });

			}else{
				 swal({
		                title: "DUR점검 완료!",
		                text: "주의 약품이 존재합니다.",
		                type: "warning"
		            });
			}
		}
		})

	})
	function reload(){

		$.ajax({
			url : "watingList",
			type: 'get',
			success:function(data){
			var template = Handlebars.compile($('#watingList').html());
			var html = template(data);

				$('#reloadPatient').html(html);

			}
			})

	}
	Handlebars.registerHelper("math", function(lvalue, operator, rvalue, options) {
	    lvalue = parseFloat(lvalue);
	    rvalue = parseFloat(rvalue);

	    return {
	        "+": lvalue + rvalue,
	        "-": lvalue - rvalue,
	        "*": lvalue * rvalue,
	        "/": lvalue / rvalue,
	        "%": lvalue % rvalue
	    }[operator];
	});
	$(document).on('change', $('.overdose'),function(event){
		var that = event.target;

		var tr = 	that.parentNode.parentNode;
		var drugNm = tr.firstChild.nextElementSibling.textContent;
		var quantity = that.value;
		var jsondata = {"drugNm" : drugNm,
						"quantity": quantity
		}


		$.ajax({
			url : "overDose",
			type: 'post',
			data : JSON.stringify(jsondata),
			contentType : 'application/json',
			success:function(data){
				if(data == false){
					str = drugNm + "<i class='fa fa-warning red' data-toggle='tooltip' data-placement='top' title='약물 과다 처방'></i>"
					tr.firstChild.nextElementSibling.innerHTML = str;
				}else{
					str = drugNm;
					tr.firstChild.nextElementSibling.innerHTML = str;

				}
			}
			})


	} )
	function fileremove(e){
		 remove = $(e);
		 console.log(remove)
		className = remove.removeClass('close')
		className = remove.attr("class");

		 console.log(className)
			$("."+className).remove();
	}
	</script>
	<script type="text/javascript">
		function regist(){
			$('#chartform').submit();
		}

		function corequest(){
			window.open("<%=request.getContextPath()%>/cooperation/cooperationRegist?pNo=${patientinfo.pNo}",
							"", "width=620, height=800, left=600, top=150")
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