<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<title>스케줄러</title>


<link
	href="<%=request.getContextPath()%>/resources/css/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/fullcalendar/fullcalendar.print.css"
	rel='stylesheet' media='print'>

<style>
.fc-scroller {
	overflow-y: hidden !important;
}
.width330{
	width: 330px;
}
body{
	width: 100%;
}
.dropdown-menu{
width: 240px;
left: 647.8px !important;
overflow: hidden;
}
.fc-day-grid{
cursor:pointer;
}
</style>



</head>
<body>
	<h3 style="margin-left: 10px; margin-top: 15px;">스케줄</h3>
		<hr style=" margin-top: 1px;"></hr>
<div class="row animated fadeInDown" style="margin-top: 15px;" >
<div class="col-lg-3">
                <div class="ibox ">
                    <div class="ibox-content inspinia-timeline cartscroll" style=" height:679px; width: 280px; overflow-x: hidden;">
					<div style="margin-bottom: 30px;">
						<h3>오늘 예약 일정</h3>
					</div>
                        <c:forEach items="${result}" var="i">
	                        <div class="timeline-item width330">
	                            <div class="row">
	                                <div class="col-4 date" style="max-width: 27.333333%;">
	                                    <i class="fa fa-user-md"></i>
	                                     ${i.reservedate}
	                                    <br>

	                                </div>
	                                <div class="col-6 content">
	                                    <p class="m-b-xs"><strong>${i.pName}
	                                    	<c:if test="${i.taNo != null }">
									<i class="fa fa-users" style="color:black"></i>
											</c:if>

										 | ${i.pRnum}
	                                    </strong></p>
	                                    <strong><${i.rsvName}></strong>
	                                    <c:if test="${i.taContent != null }">
									 <p>${i.taContent}</p>
											</c:if>


	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>


                    </div>
                </div>
            </div>

	<div class="col-lg-9" style="margin-left: -20px;">
		<div class="ibox ">
			<div class="ibox-content" style="height: 680px;" >
				<div style="margin-bottom: 30px;">
						<div><span style="font-size: 17px; font-weight: bold ">협진 스케줄러</span>
							<input type="text" placeholder="환자 검색"
							class="typeahead_1 form-control" autocomplete="off"
							style="width: 28%; display: inline-block; margin-left: 30px; float:right;"
							id="patientInfo">
							<div id="inputhide" style="display: inline-block; margin-left: 48%;">
						<span>내 일정</span>
						<p style="display: inline;">
							<input type="checkbox" id="chk_select"
								style="display: inline; white-space: nowrap; zoom: 1.3; vertical-align: -3px;"
								type="checkbox" id="a">
						</p>
					</div>


					</div>


						</div>



					<div id="calendar" class="fc fc-unthemed fc-ltr">

				</div>
				<div style="margin-top: 8px;">



				</div>
				<input type="hidden" id="searchlist">
				</div>
		</div>
	</div>
</div>

	<!-- Mainly scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/fullcalendar/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.6.2/fullcalendar.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.6.2/gcal.js"></script>
 <script
		src="<%=request.getContextPath()%>/resources/js/plugins/typehead/bootstrap3-typeahead.min.js"></script>
	<script>



		$(document).ready(function() {
			allScheduler();
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green'
			});

		});
		function mediregist(date){
				OpenWindow('registForm.do?date='+date,'업무 등록',850,700);
		}
		function mediregist2(date, coNo){
				OpenWindow('registForm2.do?date='+date+"&coNo="+coNo,'업무 등록',850,700);
		}

			$(document).on('change','#searhlist' ,function(){
					if($('#searchlist').val() == ""){
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
					height: 550,
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

				var coNo = $('#searchlist').val();
				var text = {"coNo" : coNo}
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
					height: 550,
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
				var coNo = $('#searchlist').val();
				var text = {"coNo" : coNo}
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
					height: 550,
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

			$(document).ready(function(){

			 $('.typeahead_1').typeahead({
				 autoSelect: true,
			     minLength: 1,
			     delay: 0,
				source : function(word, process) { //source: 입력시 보일 목록
					var text = {"pName": word};
				     $.ajax({
				           url :"<%=request.getContextPath()%>/scheduler/searchselectbox"
				         , type : "POST"
				         , dataType: "JSON"
				         , data : 	JSON.stringify(text)// 검색 키워드
				         , contentType : 'application/json'
				         , success : function(response){ 	// 성공
				         process($.map(response, function(item){

				        		return{
				        			name : item.pName+"("+item.coDisease +")",
				        			label : item.coNo

				        		}
				        	}));
				        	}
				         ,error : function(){ //실패
				             alert("자동완성 실패");
				         }
				     });
				 },
				 updater :function(event,ui){
					console.log(event.label)
					 $('#searchlist').val(event.label);
					if($('#chk_select').is(':checked')){

						mycoScheduler();
					}else{

						coScheduler();
					}
					  }
			 })
			 });


			function fn_javaListToJson(obj){

				var resultJson = [];

				var str = obj.split('[{').join('').split('}]').join(''); //양끝 문자열 제거
				var rows = str.split('}, {'); //str는 배열

				for(var i = 0; rows.length > i; i++){ // rows 배열만큼 for돌림

					var cols = rows[i].split(', ');
					var rowData = {};

					for(var j = 0; cols.length > j; j++){

						var colData = cols[j];
						colData = colData.trim();


						var key = colData.substring(0, colData.indexOf("="));
						var val = colData.substring(colData.indexOf("=") +1);

						rowData[key] = val;
					}

					resultJson.push(rowData);
				}

				return resultJson;
			}
	</script>

</body>
</html>