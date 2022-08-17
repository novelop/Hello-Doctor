<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="myPaintList" value="${dataMap.myPaintList}"></c:set>
<c:set var="comRecoList" value="${comRecoDataMap.comRecoList}"></c:set>
<c:set var="pop" value="${dataMap.pop}"></c:set>
<%-- <c:set var="myPaintDetail" value="${myPaintDetailMap.myPaintDetail}"></c:set> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/fullcalendar/fullcalendar.print.css"
	rel='stylesheet' media='print'>

<link href="<%=request.getContextPath()%>/resources/css/chart.css"
	rel="stylesheet">


<style>

[data-tooltip]{position:relative;}
[data-tooltip]:before,
[data-tooltip]:after{visibility:hidden;opacity:0;position:absolute;left:50%;transform:translateX(-50%);white-space:nowrap;transition:all .2s ease;font-size:11px;font-family:dotum;letter-spacing:-1px;}
[data-tooltip]:before{content:attr(data-tooltip);height:22px;position:absolute;top:-20px;padding:5px 10px;border-radius:5px;color:#fff;background:#025272;box-shadow:0 3px 8px rgba(165, 165, 165, 0.5);}
[data-tooltip]:after{content: '';border-left:5px solid transparent;top:2px;border-right:5px solid transparent;border-top:5px solid #025272;}
[data-tooltip]:not([data-tooltip=""]):hover:before{visibility:visible;opacity:1;top:-30px}
[data-tooltip]:not([data-tooltip=""]):hover:after{visibility:visible;opacity:1;top:-8px}


.fc-scroller {
	overflow-y: hidden !important;
}

.width330 {
	width: 330px;
}

.fc-basic-view .fc-body .fc-row {
	min-height: 4em;
	height: 53px;
}

.fc-view-container {

}

#vertical-timeline {
	position: relative;
	padding: 0;
	margin-top: 2.5em;
	margin-bottom: 2em;
}

body {
	min-width: 1200px;
}

.mediTd {
	text-align: center;
}

.pastpic {
	width: 150px;
	height: 150px;
}

.pastfile {
	text-align: center;
	height: 20px;
}



.nonActive{
	border: 1px solid #dee2e6;
    background: #8080800f;
    color: #80808094;
}
.nav-tabs .nav-link {
    border: 1px solid #dee2e6;
  }
</style>



</head>

<body>
	<c:if test="${!empty pop }">
		<c:forEach items="${pop }" var="pop">
			<input type="hidden" value="${pop.nTitle }" id="title">
		</c:forEach>
	</c:if>

	<div class="row">

		<div class="col-md-4 ibox-content"
			style="margin-bottom: auto; height: 300px; padding-left: 13px; padding-right: 0px; padding-top: 10px; padding-bottom: 0px;">
			<div class="col-sm-12"
				style="margin-top: 1%; border-bottom: 1px solid #e7eaec; padding-bottom: 15px;">
				<img alt=""
					src="https://cdn-icons-png.flaticon.com/512/865/865969.png"
					style="width: 20px;">
				<p
					style="font-size: 15px; display: inline; margin-left: 2%; font-weight: bold; vertical-align: -2px;">환자상태</p>

				<div class="i-checks" style="display: inline-block; float: right;">
					<label class="checkbutton">
						<div class="icheckbox_square-green"
							style="position: relative; margin-right: 8px; vertical-align: 2px;"
							id="sessionId" userId="${dId}">
							<input type="checkbox" style="position: absolute; opacity: 0;">
							<ins class="iCheck-helper"
								style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
						</div>전체 진료
					</label>
				</div>





			</div>

			<div style="overflow-y: auto; max-height: 347px;">

				<table class="table table-hover" style="text-align: center">
					<thead>
						<tr>
							<th style="border-bottom: hidden;"><img
								src="/ddit/resources/img/siren.png"
								style="font-size: 18px; margin-left: 7px; color: #ed5565; width: 15px"></th>
							<th style="border-bottom: hidden;">환자명</th>
							<th style="border-bottom: hidden;">주민번호</th>
							<th style="border-bottom: hidden;">일시</th>
						</tr>
					</thead>
					<tbody id="paintbody">
						<c:forEach items="${myPaintList}" var="paint" varStatus="status">
							<tr onclick="medicaldetail('${paint.mNo}',event)" style="cursor:pointer;">
								<td style="padding-left: 16px;">
									<c:if test="${paint.issYn eq 'Y'}">
<%-- 										<i class="fa fa-circle" id="alarm${status.index}" --%>
<!-- 											style="color: #ed5565;"></i> -->
										<img id="alarm${status.index}" class="issuealarm"
								src="/ddit/resources/img/siren.png"
								style="font-size: 18px;width: 13px;display: inline;vertical-align: 0px;"
								/>
									</c:if>
									</td>
								<td>${paint.pName}</td>
								<td>${paint.pRnum}</td>
								<td><fmt:formatDate value="${paint.mDate}"
										pattern="yyyy.MM.dd HH:mm" /></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>


		</div>

<%-- <h5>${myPaintList.issYn}</h5> --%>

		<div class="col-md-4 ibox-content"
			style="margin-bottom: auto; height: 300px; padding-left: 0px; padding-right: 0px; padding-top: 9px; padding-bottom: 0px;">
			<div class="col-sm-12"
				style="margin-top: 1%; border-bottom: 1px solid #e7eaec; height: 39px;">
				<img alt=""
					src="https://cdn-icons-png.flaticon.com/128/6705/6705085.png"
					style="width: 20px;">
				<p
					style="font-size: 15px; display: inline; margin-left: 2%; font-weight: bold; vertical-align: -2px;">진료기록</p>
				<p id="paintNameReg"
					style="font-size: 14px; display: inline; margin-left: 6%; font-weight: bold; vertical-align: -1px;">
				<p id="paintmDate" style="display: inline; vertical-align: -1px;"></p>
				</p>
			</div>

			<div id="patientrecord"
				style="margin-left: 5px; overflow-y: auto; max-height: 248px;"></div>


		</div>
		<div class="col-md-4 ibox-content"
			style="padding: 0px; height: 300px">
			<div class="" style="height: 300px;">
				<div class="tabs-container">
					<ul class="nav nav-tabs" role="tablist">
						<li><a class="nav-link active" data-toggle="tab"
							href="#tab-1">처방전</a></li>
						<li><a class="nav-link " data-toggle="tab" href="#tab-2">자료실</a></li>
						<li id="paienIssueYN"><a class="nav-link " data-toggle="tab"
							href="#tab-3">
<!-- 							<i id="ialram" class="fa fa-circle" style="color: #ed5565;display: none;"></i> -->

								<img id="ialram"
								src="/ddit/resources/img/siren.png"
								style="font-size: 18px;margin-left: -12px;width: 13px;display: inline;margin-right: 2px;vertical-align: -1px;"
								>
							특이사항 	</a>

<%-- 							  <c:if test="${paint.issYn eq 'Y'}"> --%>
<!-- 								<i class="fa fa-circle"style="color: #ed5565;"></i> -->
<%-- 							  </c:if> --%>


					    </li>
					</ul>
					<div class="tab-content" style="max-width: 395px;">
						<div role="tabpanel" id="tab-1" class="tab-pane active"
							style="max-height: 258px; overflow-y: auto;">
							<div class="panel-body" style="height: 258px;padding: 0; padding-top: 15px; " >

								<table class="table table-bordered">
									<tbody id="patienMedi">



									</tbody>
								</table>

							</div>
						</div>
						<div role="tabpanel" id="tab-2" class="tab-pane"
							style="max-height: 258px; overflow-y: auto;">
							<div class="panel-body" style="height: 258px;; padding: 0; padding-top: 15px;">

								<div id="patienFile" style="margin-left: 5px;"></div>





							</div>
						</div>
						<div role="tabpanel" id="tab-3" class="tab-pane"
							style="max-height: 258px; overflow-y: auto;">
							<div class="panel-body" style="height:258px; padding: 0; padding-top: 15px;">

								<div id="patienIssue" style="margin-left: 5px; "></div>

							</div>
						</div>

					</div>

				</div>
			</div>
		</div>


		<div class="col-md-4" style="padding-right: 0px;">


			<div class="ibox-content inspinia-timeline cartscroll"
				id="ibox-content"
				style="height: 579px; padding-left: 13px; padding-right: 0px; padding-top: 10px; padding-bottom: 0px;">
				<div style="margin-bottom: 15px; margin-top: 1%;">
					<!-- <i class="fa fa-file-text-o" style="font-size: 1.3em;"></i> -->
					<img alt=""
						src="https://cdn-icons-png.flaticon.com/128/4706/4706857.png"
						style="width: 25px">
					<p
						style="font-size: 15px; display: inline; margin-left: 2%; font-weight: bold; vertical-align: -2px;">자주
						찾는 협진</p>
				</div>
				<div style="max-height: 525px; overflow-x: hidden; overflow-y: auto;">
					<c:forEach items="${coFreqList}" var="coFreq">
						<div class="timeline-item"
								onclick="subgoPage('/cooperation/detail.do?coNo=${coFreq.coNo}')" style="cursor: pointer;">
							<div class="row ">
								<div
									style="width: 120px;height: auto; text-align-last: center;padding-top: 8px;">
									<img alt="프로필DOC" src="<%=request.getContextPath()%>/doctor/getPic?dId=${coFreq.dId}"
									style="width: 60px;height: 60px;border-radius: 60%;vertical-align: 2px;border-style: none;">
											<br>
											<strong>주치의 &nbsp;${coFreq.dName}</strong>
								</div>
								<div class="content top-border"
									style="width: 66%; padding-left: 10px; min-height: 60px;">
									<p class="m-b-xs">
										<strong>  &nbsp;&ensp;&ensp;&ensp;환자명: &nbsp;&nbsp;${coFreq.pName}&nbsp;&nbsp;&lt;${fn:substring(coFreq.pRnum,0,8)}><br>
										         &ensp;&ensp;&ensp; 주상병:&nbsp;&nbsp;<span data-tooltip="${coFreq.coDisease}">${fn:substring(coFreq.coDisease,0,15) }</span><br><br>
										          최근진료일:&nbsp;&nbsp;${coFreq.cofRegdate}</strong>
									</p>
<!-- 									<p class="m-b-xs"> -->
<!-- 									<p style="display: inline; font-size: 10px;">최근 진료일</p> -->
<%-- 									${coFreq.cofRegdate} --%>
<!-- 									</p> -->
								</div>
							</div>
						</div>
					</c:forEach>
				</div>



			</div>
		</div>


		<div class="col-md-8" style="padding-left: 0px">
			<div class="ibox ">


				<div class="ibox-content ">
					<div style="margin-bottom: 30px;">
						<img alt=""
							src="https://cdn-icons-png.flaticon.com/128/6836/6836917.png"
							style="width: 25px">
						<p
							style="font-size: 15px; display: inline; margin-left: 1%; font-weight: bold; vertical-align: -2px;">협진
							스케줄러</p>
					</div>


					<div id="calendar" class="fc fc-unthemed fc-ltr"></div>
					<div style="margin-top: 8px;">
						<select class="form-control"
							style="height: 31px; width: 151px; text-align: center; font-size: 1em; display: inline-block; border-radius: 5px;"
							id="searhlist">
							<option value="all" selected>전체</option>
							<c:forEach items="${dataMap.selectbox }" var="i">
								<option value="${i.coNo }">${i.pName }(${fn:substring(i.coDisease,0,8) })</option>

							</c:forEach>
						</select>

						<div class="ibox-title" id="inputhide"
							style="display: inline-block;">
							<h5>내 일정</h5>
							<p style="display: inline;">
								<input type="checkbox" id="chk_select"
									style="display: inline; white-space: nowrap; zoom: 1.3; vertical-align: -3px;"
									type="checkbox" id="a">
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>



	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/fullcalendar/moment.min.js"></script>


	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

	<!-- jQuery UI  -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

	<!-- Full Calendar -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.6.2/fullcalendar.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.6.2/gcal.js"></script>



<script type="text/x-handlebars-template"  id="uncheckedpainList" >
{{#each.}}
<tr onclick="medicaldetail('{{mNo}}',event)">

							<td style="padding-left: 16px;">
{{#isFlag issYn 'Y' }}

<img id="alarm{{@index}}" class="issuealarm"
								src="/ddit/resources/img/siren.png"
								style="font-size: 18px;width: 13px;display: inline;vertical-align: 0px;"
								/>


{{/isFlag}}

							</td>

							<td>{{pName}}</td>
							<td>{{pRnum}}</td>
					<td>
{{formatTime mDate "YYYY-MM-DD HH:mm"}}
</td>

						</tr>
{{/each}}

</script>

<!-- <i class="fa fa-circle" id="alarm{{@index}}" style="color: #ed5565;"></i> -->





<script type="text/x-handlebars-template" id="patienMediList">

			<tr style="background : #efefef; text-align: center;">
				<th style="width: 180px;">약명</th>
				<th>수량</th>
				<th>일투수</th>
				<th>투약일</th>
			</tr>


	{{#each.}}
		<tr>
		<td class="mediTd" style="text-align: left;padding-left: 15px;"><span data-tooltip="{{cureName}}">{{trimString cureName}}</span></td>
		<td class="mediTd">{{pQuantity}}</td>
		<td class="mediTd">{{pAday}}</td>
		<td class="mediTd">{{pDays}}</td>
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
<div class="file" onclick="location.href='<%=request.getContextPath()%>/medi/getFile?mfNo={{mfNo}}'">
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

<script type="text/x-handlebars-template" id="patienIssueList">

		<h3>{{issContent}}</h3><br>

</script>

<script type="text/x-handlebars-template" id="patienImfo">

		&lt{{pName}} &nbsp; {{pRnum}}> &nbsp;&nbsp;

</script>

<script type="text/x-handlebars-template" id="patienmdateInfo">

{{formatTime mDate "YYYY-MM-DD HH:mm"}}

</script>


<script>
Handlebars.registerHelper('formatTime', function (date, format) {
    var mmnt = moment(date);
    return mmnt.format(format);
});

</script>

<script>

Handlebars.registerHelper('isFlag', function(arg1, arg2, options) {
	 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
});


</script>

<script>


Handlebars.registerHelper('trimString', function(passedString) {
    var theString = passedString.substring(0,12);
    return new Handlebars.SafeString(theString)
});


</script>




<script>


function medicaldetail(mNo,event){
	 alarmId = $(event.target).parent('tr').find('.issuealarm').attr('id');


	 data = {
			"mNo" : mNo,
		}

		$.ajax({
				url:"<%=request.getContextPath()%>/restmain/mypatient",
				type : "POST",
				data: JSON.stringify(data),
				contentType:'application/json',
				success:function(data){



					console.log("datata"+data)
				$('#patientrecord').html(data.pastsymptom.symptom+"<br>");
					printData(data.pic, $('#patientrecord'), $('#pastpic'))
					printData(data.file, $('#patienFile'), $('#pastfile'))



					if(data.issueYN){

					console.log("issueyn"+data.issueYN.issNo);

					$('#paienIssueYN').attr('onclick',"issueClick('"+data.issueYN.issNo+"','"+alarmId+"')")

						if(data.issueYN.issYn=='Y'){
							$('#ialram').css('display','inline');
						}else if(data.issueYN.issYn=='N'){

							$('#ialram').css('display','none');
							$(alarmId).css('display','none');
						}

					}else{
						$('#ialram').css('display','none');
					}


					var template = Handlebars.compile($('#patienMediList').html());
					console.log("template"+template);
					var html = template(data.orderdruglist);

					$('#patienMedi').html(html);

					console.log("약약약1"+data.orderdruglist);


					var template2 = Handlebars.compile($('#patienImfo').html());
					var html2 = template2(data.paieninfo);
					$('#paintNameReg').html(html2);

					var template3 = Handlebars.compile($('#patienmdateInfo').html());
					console.log("template"+template3);
					var html3 = template3(data.paieninfo);
					$('#paintmDate').html(html3);

					var temp =  Handlebars.compile($('#patienIssueList').html());
					console.log("temp"+temp);
					var htm = temp(data.paintIssue);

					$('#patienIssue').html(htm);


				},
				error:function(xhr){
					alert("오류:"+xhr)
				}

			})



}



</script>

	<script>
function issueClick(issNo,alarmId){


	data = {
			"issNo" : issNo
		}

	console.log("issyn"+data)

		$.ajax({
				url:"<%=request.getContextPath()%>/restmain/ynchange",
				type : "POST",
				data: JSON.stringify(data),
				contentType:'application/json',
				success:function(res){
					console.log("issueclick!!"+res)
// 					alert("성공"+res)
					$("#"+alarmId+"").remove();
// 					$("#"+alarmId+"").css('display','none');
// 					$('tbody#paintbody tr td img').remove();
					$('#ialram').css('display','none');

				},
				error:function(xhr){
					alert("오류:"+xhr)
				}

			})

}



</script>



<script type="text/javascript">

var undefined = 'undefined';

$('.i-checks').iCheck({

	checkboxClass : 'icheckbox_square-green',
	radioClass : 'iradio_square-green',
});


		$(document).ready(function() {
			allScheduler();
		 $('#paintbody').children()[0].click();

			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green'
			});
		})


			/* initialize the external events
			 -----------------------------------------------------------------*/

		function mediregist(data){

				day = $(data).attr('data-date') ;
				console.log(day);
// 				alert(day);
				OpenWindow('regist.do','업무 등록',700,650);



		}
		$('.ibox').ready(function(){
			$('.fc-view').find('.fc-bg').find("td").on("click", function(){
				 mediregist(this);
			})
			}

		);
		$('.ibox').ready(function(){
			  // 실행할 기능을 정의해주세요.
			$('.fc-button').on('click', function(){
				$('.fc-view').find('.fc-bg').find("td").on("click", function(){
					 mediregist();
				})
			})
		});



		 //아이체크 풀었을 때!//모든환자 (내가 주치의 아닌경우도 포)리스트 나오기 !
	    $('.i-checks').on('ifChecked',function(event){
	    	// alert("언체크 표시");
	    	 $.ajax({
	    		url : '<%=request.getContextPath()%>/restmain/AllPaintStatus',
	    		dataType:'json', //받는 타입
	    		type:'POST',
	    		success : function(data){
	    			$('tbody#paintbody tr').remove();
	    			var template=Handlebars.compile($('#uncheckedpainList').html());
	    			var html = template(data);
	    			$('tbody#paintbody').html(html);

	    		},
	    		error: function(){
	    			alert('실패');
	    		}

	    	})
	    });
	    //아이체크 풀었을 때!(나의 환자만 보기!)
	    $('.i-checks').on('ifUnchecked',function(event){
			// alert("wkrehd?");
	    	 $.ajax({
	    		url : '<%=request.getContextPath()%>/restmain/MyPaintStatus',

	    		dataType:'json', //받는 타입
	    		type:'POST',
	    		success : function(data){
	    			$('tbody#paintbody tr').remove();
	    			var template=Handlebars.compile($('#uncheckedpainList').html());
	    			var html = template(data);
	    			$('tbody#paintbody').html(html);


	    		},
	    		error: function(){
	    			alert('실패');
	    		}

	    	})
	    });



	    </script>

<script>
window.onload = function() {
	$('.nav-tabs > li > a').each(function() {
	    if($(this).is('.active')) {
	        // true
	    	console.log($(this).is('.active'));
	    } else {
	        // false
	        $(this).addClass('nonActive');
	    }
	})
}

$(document).on('click','.nav-link' ,function(){

	$('.nav-tabs > li > a').each(function() {
	    if($(this).is('.active')) {
	        // true
	    	console.log($(this).is('.active'));
	    } else {
	        // false
	        $(this).addClass('nonActive');
	    }
	})
})



</script>






<script type="text/javascript">

function mediregist(date){


	OpenWindow('registForm.do?date='+date,'업무 등록',850,700);
}
function mediregist2(date, coNo){
	OpenWindow('registForm2.do?date='+date+"&coNo="+coNo,'업무 등록',850,700);
}





$(document).on('change','#searhlist' ,function(){
		if($('#searhlist option:selected').val() == "all"){
			$('#calendar').fullCalendar('destroy');
			allScheduler();

		}else{

			coScheduler();
		}


})
$(document).on('click','#chk_select' ,function(){
	if($('#chk_select').is(':checked')){

		mycoScheduler();
	}else{

		coScheduler();
	}

})

function allScheduler(){
	$('#calendar').fullCalendar({
		googleCalendarApiKey: 'AIzaSyDY6Zo02hF0_WJoyNRWqBLdp8sspgstk-k',
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		titleFormat : 'YYYY - MM',
		timeFormat: 'HH:mm',
		lang:'ko', // 한국어 설정
		eventLimit: true,
		height: 450,
		dayClick: function(date, allDay, jsEvent, view) {
			   var yy=date.format("YYYY");
			   var mm=date.format("MM");
			   var dd=date.format("DD");
			   var ss=date.format("dd");
			   mediregist(yy+"-"+mm+"-"+dd);
			     },

		eventClick: function(info) {
			if(info.taNo){
			reservationDetail(info.taNo);
			}
		},
		events :
			function(start, end, timezone, callback){
			$.ajax({
				type: 'get'
				,url : "<%=request.getContextPath()%>/scheduler/schedulerMain"
				,success: function(data){
					console.log(data)
					callback(data);
					$('#inputhide').hide();
				}


			})
		}, eventSources :
            [{
                googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
                className : "koHolidays",
                color : "#ff8425",
                textColor : "#FFFFFF",
                      editable : false
            }],
          //공휴일 클릭 방지
          eventAfterRender: function( event, element, view  ) {
            $(".koHolidays").attr("href", "javascript:void(0);");
        }



	});


}
function coScheduler(){
	var coNo = $('#searhlist option:selected').val();
	var text = {"coNo" : coNo}
	console.log(coNo)
	$('#calendar').fullCalendar('destroy');
	$('#calendar').fullCalendar({
		googleCalendarApiKey: 'AIzaSyDY6Zo02hF0_WJoyNRWqBLdp8sspgstk-k',
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		titleFormat : 'YYYY - MM',
		timeFormat: 'HH:mm',
		locale : 'ko', // 한국어 설정
		eventLimit: true,
		height: 450,
		dayClick: function(date, allDay, jsEvent, view) {
			   var yy=date.format("YYYY");
			   var mm=date.format("MM");
			   var dd=date.format("DD");
			   var ss=date.format("dd");
			   mediregist2(yy+"-"+mm+"-"+dd, coNo);
			     },
		eventClick: function(info) {
			if(info.taNo){
				reservationDetail(info.taNo);
				}
		},
		events : function(start, end, timezone, callback){
			$.ajax({
				type: 'post'
				,data: JSON.stringify(text)
				,contentType : 'application/json'
				,url : "<%=request.getContextPath()%>/scheduler/CoScheduler"
				,success: function(data){
					callback(data);
					$('#inputhide').show();
				}


			})
		},
		 eventSources :
                [{
                    googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
                    className : "koHolidays",
                    color : "#ff8425",
                    textColor : "#FFFFFF",
                          editable : false
                }],

	});

}
function mycoScheduler(){
	var coNo = $('#searhlist option:selected').val();
	var text = {"coNo" : coNo}
	console.log(coNo)
	$('#calendar').fullCalendar('destroy');
	$('#calendar').fullCalendar({
		googleCalendarApiKey: 'AIzaSyDY6Zo02hF0_WJoyNRWqBLdp8sspgstk-k',
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		titleFormat : 'YYYY - MM',
		timeFormat: 'HH:mm',
		locale : 'ko', // 한국어 설정
		eventLimit: true,
		height: 450,
		dayClick: function(date, allDay, jsEvent, view) {
			   var yy=date.format("YYYY");
			   var mm=date.format("MM");
			   var dd=date.format("DD");
			   var ss=date.format("dd");
			   mediregist2(yy+"-"+mm+"-"+dd, coNo);
			     },
		eventClick: function(info) {

			if(info.taNo){
				reservationDetail(info.taNo);
				}

		},
		events : function(start, end, timezone, callback){
			$.ajax({
				type: 'post'
				,data: JSON.stringify(text)
				,contentType : 'application/json'
				,url : "<%=request.getContextPath()%>/scheduler/selectMyCoScheduler"
				,success: function(data){
					callback(data);
					$('#inputhide').show();
				}


			})
		},
		 eventSources :
                [{
                    googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
                    className : "koHolidays",
                    color : "#ff8425",
                    textColor : "#FFFFFF",
                          editable : false
                }],

	});



}
 function reservationDetail(taNo){
		window.open("<%=request.getContextPath()%>/cooperation/reservationDetail.do?taNo="+taNo, "","width=640, height=500, left=400, top=200")
}
</script>

<script type="text/javascript">
window.onload = function(){

	var openWin;
	var value = [];
	var is_expend = [];

	<c:if test="${!empty pop }">
		<c:forEach items="${pop }" var="pop" varStatus="status">

			var getCookie = function(name) {
				for(var i = 0; i < name.length; i++){
					value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');

					return value? value[i] : null;

				}

			};
				is_expend.push(getCookie("name"));

				var is_expend = getCookie("name");
			console.log("쿠키 is_expend변수에 저장된 값: "+is_expend);
			if(!is_expend){

// 				openWin = window.open("popUp?nNo=${pop.nNo}", "", "width=500; height=500");
				OpenWindow("popUp?nNo=${pop.nNo}","공지사항",500,500);
			}

		</c:forEach>
	</c:if>


};

</script>


</body>
</html>