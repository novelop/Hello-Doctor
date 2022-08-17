<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Chartist</title>

    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">


    <link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
	  <!-- c3 Charts -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/c3/c3.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/plugins/chartist/chartist.min.css" rel="stylesheet">
	  <!-- orris -->
    <link href="<%=request.getContextPath()%>/resources/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>

<div class="row">

                <div class="col-lg-6" >
                    <div class="ibox ">
                        <div class="ibox-title">
                            <h5><span class="label label-success">1</span>&nbsp;&nbsp;협진한 의료진 </h5>
                        </div>
                        <div class="ibox-content" style="height:400px;">
                            <div id="ct-chart4" class="ct-perfect-fourth"><svg xmlns:ct="http://gionkunz.github.com/chartist-js/ct" width="100%" height="90%" class="ct-chart-bar ct-horizontal-bars" style="width: 100%; height: 100%;"><g class="ct-labels"><foreignObject style="overflow: visible;" y="314.14285714285717" x="10" height="49.857142857142854" width="60"><span class="ct-label ct-vertical ct-start" style="height: 50px; width: 60px" xmlns="http://www.w3.org/1999/xhtml">Sunday</span></foreignObject><foreignObject style="overflow: visible;" y="264.28571428571433" x="10" height="49.857142857142854" width="60"><span class="ct-label ct-vertical ct-start" style="height: 50px; width: 60px" xmlns="http://www.w3.org/1999/xhtml">Saturday</span></foreignObject><foreignObject style="overflow: visible;" y="214.42857142857142" x="10" height="49.857142857142854" width="60"><span class="ct-label ct-vertical ct-start" style="height: 50px; width: 60px" xmlns="http://www.w3.org/1999/xhtml">Friday</span></foreignObject><foreignObject style="overflow: visible;" y="164.57142857142858" x="10" height="49.857142857142854" width="60"><span class="ct-label ct-vertical ct-start" style="height: 50px; width: 60px" xmlns="http://www.w3.org/1999/xhtml">Thursday</span></foreignObject><foreignObject style="overflow: visible;" y="114.71428571428572" x="10" height="49.857142857142854" width="60"><span class="ct-label ct-vertical ct-start" style="height: 50px; width: 60px" xmlns="http://www.w3.org/1999/xhtml">Wednesday</span></foreignObject><foreignObject style="overflow: visible;" y="64.85714285714286" x="10" height="49.857142857142854" width="60"><span class="ct-label ct-vertical ct-start" style="height: 50px; width: 60px" xmlns="http://www.w3.org/1999/xhtml">Tuesday</span></foreignObject><foreignObject style="overflow: visible;" y="15.000000000000036" x="10" height="49.857142857142854" width="60"><span class="ct-label ct-vertical ct-start" style="height: 50px; width: 60px" xmlns="http://www.w3.org/1999/xhtml">Monday</span></foreignObject><foreignObject style="overflow: visible;" x="80" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">0</span></foreignObject><foreignObject style="overflow: visible;" x="134.625" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">1.25</span></foreignObject><foreignObject style="overflow: visible;" x="189.25" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">2.5</span></foreignObject><foreignObject style="overflow: visible;" x="243.875" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">3.75</span></foreignObject><foreignObject style="overflow: visible;" x="298.5" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">5</span></foreignObject><foreignObject style="overflow: visible;" x="353.125" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">6.25</span></foreignObject><foreignObject style="overflow: visible;" x="407.75" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">7.5</span></foreignObject><foreignObject style="overflow: visible;" x="462.375" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">8.75</span></foreignObject><foreignObject style="overflow: visible;" x="517" y="369" width="54.625" height="20"><span class="ct-label ct-horizontal ct-end" style="width: 55px; height: 20px" xmlns="http://www.w3.org/1999/xhtml">10</span></foreignObject></g><g class="ct-grids"><line y1="364" y2="364" x1="80" x2="517" class="ct-grid ct-vertical"></line><line y1="314.14285714285717" y2="314.14285714285717" x1="80" x2="517" class="ct-grid ct-vertical"></line><line y1="264.2857142857143" y2="264.2857142857143" x1="80" x2="517" class="ct-grid ct-vertical"></line><line y1="214.42857142857144" y2="214.42857142857144" x1="80" x2="517" class="ct-grid ct-vertical"></line><line y1="164.57142857142858" y2="164.57142857142858" x1="80" x2="517" class="ct-grid ct-vertical"></line><line y1="114.71428571428572" y2="114.71428571428572" x1="80" x2="517" class="ct-grid ct-vertical"></line><line y1="64.85714285714289" y2="64.85714285714289" x1="80" x2="517" class="ct-grid ct-vertical"></line><line x1="80" x2="80" y1="15" y2="364" class="ct-grid ct-horizontal"></line><line x1="134.625" x2="134.625" y1="15" y2="364" class="ct-grid ct-horizontal"></line><line x1="189.25" x2="189.25" y1="15" y2="364" class="ct-grid ct-horizontal"></line><line x1="243.875" x2="243.875" y1="15" y2="364" class="ct-grid ct-horizontal"></line><line x1="298.5" x2="298.5" y1="15" y2="364" class="ct-grid ct-horizontal"></line><line x1="353.125" x2="353.125" y1="15" y2="364" class="ct-grid ct-horizontal"></line><line x1="407.75" x2="407.75" y1="15" y2="364" class="ct-grid ct-horizontal"></line><line x1="462.375" x2="462.375" y1="15" y2="364" class="ct-grid ct-horizontal"></line><line x1="517" x2="517" y1="15" y2="364" class="ct-grid ct-horizontal"></line></g><g class="ct-series ct-series-a"><line y1="344.07142857142856" y2="344.07142857142856" x1="80" x2="254.8" class="ct-bar" ct:value="4"></line><line y1="294.2142857142857" y2="294.2142857142857" x1="80" x2="342.2" class="ct-bar" ct:value="6"></line><line y1="244.35714285714286" y2="244.35714285714286" x1="80" x2="254.8" class="ct-bar" ct:value="4"></line><line y1="194.50000000000003" y2="194.50000000000003" x1="80" x2="298.5" class="ct-bar" ct:value="5"></line><line y1="144.64285714285717" y2="144.64285714285717" x1="80" x2="473.3" class="ct-bar" ct:value="9"></line><line y1="94.78571428571429" y2="94.78571428571429" x1="80" x2="167.4" class="ct-bar" ct:value="2"></line><line y1="44.92857142857146" y2="44.92857142857146" x1="80" x2="211.1" class="ct-bar" ct:value="3"></line></g><g class="ct-series ct-series-b"><line y1="334.07142857142856" y2="334.07142857142856" x1="80" x2="211.1" class="ct-bar" ct:value="3"></line><line y1="284.2142857142857" y2="284.2142857142857" x1="80" x2="517" class="ct-bar" ct:value="10"></line><line y1="234.35714285714286" y2="234.35714285714286" x1="80" x2="298.5" class="ct-bar" ct:value="5"></line><line y1="184.50000000000003" y2="184.50000000000003" x1="80" x2="385.9" class="ct-bar" ct:value="7"></line><line y1="134.64285714285717" y2="134.64285714285717" x1="80" x2="211.1" class="ct-bar" ct:value="3"></line><line y1="84.78571428571429" y2="84.78571428571429" x1="80" x2="254.8" class="ct-bar" ct:value="4"></line><line y1="34.92857142857146" y2="34.92857142857146" x1="80" x2="298.5" class="ct-bar" ct:value="5"></line></g></svg></div>
                        </div>
                    </div>
                </div>

		<div class="col-lg-6" >
			<div class="ibox ">
				<div class="ibox-title">
					<h5><span class="label label-success">2</span>&nbsp;&nbsp;분기별진단명</h5>
				</div>
				<div class="ibox-content" style="height:400px;">
					<div>
						<div id="stocked"></div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="row">

	<div class="col-lg-6" >
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5><span class="label label-success">3</span>&nbsp;&nbsp;병명별 완치 비율</h5>

                    </div>
                    <div class="ibox-content" style="height:400px;padding-top: 140px;">
                            <div class="flot-chart">
                                <div class="flot-chart-content" id="flot-bar-chart"></div>
                            </div>
                    </div>
                </div>
            </div>

                     <div class="col-lg-6" >
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5><span class="label label-success">4</span>&nbsp;&nbsp;월별 협진 현황 </h5>

                    </div>
                    <div class="ibox-content" style="height:400px;">
                        <div id="morris-bar-chart"></div>
                    </div>
                </div>
            </div>

	</div>

                <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

     <!-- Custom and plugin javascript -->
    <script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

    <!-- Chartist -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/chartist/chartist.min.js"></script>
 <!-- Flot -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/flot/jquery.flot.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/flot/jquery.flot.time.js"></script>


    <!-- d3 and c3 charts -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/d3/d3.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/c3/c3.min.js"></script>

    <!-- Flot demo data -->
    <script src="<%=request.getContextPath()%>/resources/js/demo/flot-demo.js"></script>

      <!-- ChartJS-->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/chartJs/Chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/demo/chartjs-demo.js"></script>

<!-- Morris -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/morris/morris.js"></script>
 <!-- Morris demo data-->
    <script src="<%=request.getContextPath()%>/resources/js/demo/morris-demo.js"></script>
<script>
$(document).ready(function(){
 // Stocked horizontal bar

            new Chartist.Bar('#ct-chart4', {
                labels: ['노혜지', '이의찬', '박태정', '유정민', '이정규', '강현수', '이종민','최민규','강정인','김민지'],
                series: [
                    [5, 4, 3, 7, 5, 10, 3,4,9,10]

                ]
            }, {
                seriesBarDistance: 10,
                reverseData: true,
                horizontalBars: true,
                axisY: {
                    offset: 70
                }
            });

 //분기별진단명분포
            c3.generate({
                bindto: '#stocked',
                data:{
                    columns: [
                        ['data1', 30,200,100,400,150,250],
                        ['data2', 50,20,10,40,15,25],
                        ['data3', 50,20,10,40,15,25],
                        ['data4', 50,20,10,40,15,25]
                    ],
                    colors:{
                        data1: '#1ab394',
                        data2: '#BABABA',
                        data3: '#005732',
                        data4: '#002600'
                    },
                    type: 'bar',
                    groups: [
                        ['data1', 'data2','data3','data4']
                    ]
                }
            });

          //Flot Bar Chart//병명별 완치 비율
            $(function() {
                var barOptions = {
                    series: {
                        bars: {
                            show: true,
                            barWidth: 0.4,
                            fill: true,
                            fillColor: {
                                colors: [{
                                    opacity: 0.8
                                }, {
                                    opacity: 0.8
                                }]
                            }
                        }
                    },
                    xaxis: {
                        tickDecimals: 0
                    },
                    colors: ["#1ab394"],
                    grid: {
                        color: "#999999",
                        hoverable: true,
                        clickable: true,
                        tickColor: "#D4D4D4",
                        borderWidth:0
                    },
                    legend: {
                        show: false
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: "x: %x, y: %y"
                    }
                };
                var barData = {
                    label: "bar",
                    data: [
                        [1, 34],
                        [2, 25],
                        [3, 19],
                        [4, 34],
                        [5, 32],
                        [6, 44]
                    ]
                };
                $.plot($("#flot-bar-chart"), [barData], barOptions);

            });
          //월별 협진 현황
            Morris.Bar({
                element: 'morris-bar-chart',
                data: [
                	{ y: '1', a: 60, b: 50 ,c:36},
                    { y: '2', a: 75, b: 65,c:33 },
                    { y: '3', a: 50, b: 40 ,c:39},
                    { y: '4', a: 75, b: 65 ,c:28},
                    { y: '5', a: 50, b: 40 ,c:50},
                    { y: '6', a: 75, b: 65 ,c:12}
                    ],
                xkey: 'y',
                ykeys: ['a', 'b','c'],
                labels: ['진행중', '완료','신규'],
                hideHover: 'auto',
                resize: false,
                barColors: ['#1ab394', '#cacaca','#EB4747'],
            });


});

</script>

</body>
</html>