<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<title>의료진 조직도</title>



<link
	href="<%=request.getContextPath()%>/resources/css/plugins/jsTree/style.min.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/chart.css"
	rel="stylesheet">

</head>

<body>



	<div id="wrapper">


		<div id="page-wrapper" class="gray-bg" style="width: 1100px;">
			<div class="header">
				<div class="displayinline padding10">
					<h3>의료진 조직도</h3>
				</div>
				<div class="displayinline floatright padding10">
					<button class="btn btn-white btn-sm " type="submit"  onclick="window.close();" >
						닫기 <i class="fa fa-window-close-o" aria-hidden="true"></i>
					</button>
				</div>
				<hr style="margin-top: -5px;">
			</div>

			<div class="wrapper wrapper-content animated fadeInRight">

				<div class="row">
					<div class="col-lg-4" style="max-width: 25%;">
						<div class="ibox ">

							<div class="ibox-content height700 cartscroll"
								style="width: 251px;">

								<div id="jstree1">
									<ul>
										<li class="jstree-open">진료과
											<ul>

												<li class="jstree-open">내과
													<ul>
														<li data-jstree='"type":"img"}'>호흡기내과</li>
														<li data-jstree='"type":"img"}'>순환기내과</li>
														<li data-jstree='"type":"img"}'>소화기내과</li>
														<li data-jstree='"type":"img"}'>혈액종양내과</li>
														<li data-jstree='"type":"img"}'>내분비대사내과</li>
														<li data-jstree='"type":"img"}'>알레르기내과</li>
														<li data-jstree='"type":"img"}'>신장내과</li>
														<li data-jstree='"type":"img"}'>감염내과</li>
														<li data-jstree='"type":"img"}'>류마티스내과</li>
														<li data-jstree='"type":"img"}'>내과(일반)</li>
													</ul>
												</li>
												<li class="jstree-open">외과
													<ul>
														<li data-jstree='"type":"js"}'>감담췌외과</li>
														<li data-jstree='"type":"js"}'>위장관외과</li>
														<li data-jstree='"type":"js"}'>대장항문외과</li>
														<li data-jstree='"type":"js"}'>유방내분비외과</li>
														<li data-jstree='"type":"js"}'>이식혈관외과</li>
														<li data-jstree='"type":"js"}'>외상외과</li>
														<li data-jstree='"type":"js"}'>외과(일반)</li>
													</ul>
												</li>
												<li data-jstree='"type":"html"}'>산부인과</li>
												<li data-jstree='"type":"html"}'>가정의학과</li>
												<li data-jstree='"type":"html"}'>마취통증의학과</li>
												<li data-jstree='"type":"html"}'>방사선종양학과</li>
												<li data-jstree='"type":"html"}'>병리과</li>
												<li data-jstree='"type":"html"}'>비뇨의학과(비뇨기과)</li>
												<li data-jstree='"type":"html"}'>성형외과</li>
												<li data-jstree='"type":"html"}'>신경과</li>
												<li data-jstree='"type":"html"}'>신경외과</li>
												<li data-jstree='"type":"html"}'>안과</li>
												<li data-jstree='"type":"html"}'>영상의학과</li>
												<li data-jstree='"type":"html"}'>응급의학과</li>
												<li data-jstree='"type":"html"}'>의공학과</li>
												<li data-jstree='"type":"html"}'>이비인후과</li>
												<li data-jstree='"type":"html"}'>임상약리학과</li>
												<li data-jstree='"type":"html"}'>임상유전체학과</li>
												<li data-jstree='"type":"html"}'>재활의학과</li>
												<li data-jstree='"type":"html"}'>정신건강의학과</li>
												<li data-jstree='"type":"html"}'>정형외과</li>
												<li data-jstree='"type":"html"}'>중환자의학과</li>
												<li data-jstree='"type":"html"}'>피부과</li>
												<li data-jstree='"type":"html"}'>흉부외과</li>
												<li data-jstree='"type":"html"}'>장기이식센터</li>
												<li data-jstree='"type":"html"}'>통증센터</li>
												<li data-jstree='"type":"html"}'>중증외상센터</li>
												<li data-jstree='"type":"html"}'>뇌하수체센터</li>
												<li data-jstree='"type":"html"}'>약물안전센터</li>
												<li data-jstree='"type":"html"}'>완화의료임상윤리센터</li>
												<li data-jstree='"type":"html"}'>입원의학센터</li>
												<li data-jstree='"type":"html"}'>공공진료센터</li>
												<li data-jstree='"type":"html"}'>태아센터</li>
												<li data-jstree='"type":"html"}'>융합의학과</li>
											</ul>
										</li>
									</ul>
								</div>

							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="ibox ">
							<div class="ibox-content height700 cartscroll"
								style="width: 521px">
								<div class="col-md-12">

									<div class="profile-image">
										<img src="<%=request.getContextPath()%>/resources/img/a4.jpg"
											class="rounded-circle circle-border m-b-md" alt="profile">
									</div>
									<div class="profile-info padding10">
										<div class="">
											<div>
												<h4>대장항문외과</h4>
												<h3 class="no-margins font-bold padding3">이의찬</h3>
												<span class="label margintop5 " style="color: grey;">세부전공</span>
												<p class="fontsize11 padding3">대장항문암, 유전성 대장암, 대장암수술,
													복강경수술</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">

									<div class="profile-image">
										<img src="<%=request.getContextPath()%>/resources/img/a4.jpg"
											class="rounded-circle circle-border m-b-md" alt="profile">
									</div>
									<div class="profile-info padding10">
										<div class="">
											<div>
												<h4>대장항문외과</h4>
												<h3 class="no-margins font-bold padding3">이의찬</h3>
												<span class="label margintop5 " style="color: grey;">세부전공</span>
												<p class="fontsize11 padding3">대장항문암, 유전성 대장암, 대장암수술,
													복강경수술</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">

									<div class="profile-image">
										<img src="<%=request.getContextPath()%>/resources/img/a4.jpg"
											class="rounded-circle circle-border m-b-md" alt="profile">
									</div>
									<div class="profile-info padding10">
										<div class="">
											<div>
												<h4>대장항문외과</h4>
												<h3 class="no-margins font-bold padding3">이의찬</h3>
												<span class="label margintop5 " style="color: grey;">세부전공</span>
												<p class="fontsize11 padding3">대장항문암, 유전성 대장암, 대장암수술,
													복강경수술</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">

									<div class="profile-image">
										<img src="<%=request.getContextPath()%>/resources/img/a4.jpg"
											class="rounded-circle circle-border m-b-md" alt="profile">
									</div>
									<div class="profile-info padding10">
										<div class="">
											<div>
												<h4>대장항문외과</h4>
												<h3 class="no-margins font-bold padding3">이의찬</h3>
												<span class="label margintop5 " style="color: grey;">세부전공</span>
												<p class="fontsize11 padding3">대장항문암, 유전성 대장암, 대장암수술,
													복강경수술</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">

									<div class="profile-image">
										<img src="<%=request.getContextPath()%>/resources/img/a4.jpg"
											class="rounded-circle circle-border m-b-md " alt="profile">
									</div>
									<div class="profile-info padding10">
										<div class="">
											<div>
												<h4>대장항문외과</h4>
												<h3 class="no-margins font-bold padding3">이의찬</h3>
												<span class="label margintop5 " style="color: grey;">세부전공</span>
												<p class="fontsize11 padding3">대장항문암, 유전성 대장암, 대장암수술,
													복강경수술</p>
											</div>
										</div>
									</div>
								</div>


							</div>
						</div>
					</div>

					<div class="col-lg-3">
						<div class="contact-box center-version">

							<a style="cursor: default;"> <img alt="image"
								class="rounded-circle widhei200"
								style="width: 200px; height: 200px;"
								src="<%=request.getContextPath()%>/resources/img/앙금.jpg">
								<p class="fontsize11 font-bold textcenter">
									<span><i class="fa fa-circle text-navy "></i> 접속중</span>
								</p>

								<h3 class="m-b-xs">
									<strong>노앙금</strong>
								</h3>

								<div class="font-bold">[호흡기내과]</div> <br> <span
								class="font-bold">세부전공</span>
								<div>비결핵항산균증,폐결핵</div>
								<address class="m-t-md">
									<strong>연락처</strong><br> 010-1234-1234<br>

								</address>
							</a>
							<h4 class="m-t-md textcenter">나와 협진한 내역</h4>
							<ol class="marginleft10" style="min-height: 122px;">
								<li>임현수/폐렴/2022-06-01</li>
								<li>고창석/기흉/2022-06-03</li>
							</ol>

							<div class="contact-box-footer">
								<div class="m-t-xs btn-group">
									<a href="" class="btn btn-xs btn-white"><i
										class="fa fa-wechat"></i> Chat </a> <a href=""
										class="btn btn-xs btn-white"><i class="fa fa-user-plus"></i>
										Coworker</a>
								</div>
							</div>

						</div>
					</div>


				</div>
				<div class="displayinline padding10">
					<h3>동료 의료진</h3>
				</div>
				<hr style="margin-top: -5px;">

				<div class="ibox">
					<div class="ibox-content " style="height: 178px;">
						<h3>Coworkers</h3>
						<div class="user-friends ">
							<div class="box">
								<div id="tab">
									<ul>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0 0 0 0;">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													<strong>강현수</strong> <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; ">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg" ></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle "  style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle "  style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle "  style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
										 			강현수 <br>호흡기내과
												</h5>
											</div>
										</li>
										<li>
											<div
												style="width: 70px; height: 50px; float: left; text-align: center; margin: 0px;">
												<a href=""><img alt="image" class="rounded-circle " style="margin: 0 0 0 0;"
													src="<%=request.getContextPath()%>/resources/img/a3.jpg"></a>
												<h5>
													강현수 <br>호흡기내과
												</h5>
											</div>
										</li>

									</ul>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>


		</div>
	</div>



	<!-- Mainly scripts -->
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

	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/jsTree/jstree.min.js"></script>

	<style>
.jstree-open>.jstree-anchor>.fa-folder:before {
	content: "\f07c";
}

.jstree-default .jstree-icon.none {
	width: 0;
}
</style>

	<script>
		$(document).ready(function() {

			$('#jstree1').jstree({
				'core' : {
					'check_callback' : true
				},
				'plugins' : [ 'types', 'dnd' ],
				'types' : {
					'default' : {
						'icon' : 'fa fa-folder'
					},
					'html' : {
						'icon' : 'fa fa-file-code-o'
					},
					'svg' : {
						'icon' : 'fa fa-file-picture-o'
					},
					'css' : {
						'icon' : 'fa fa-file-code-o'
					},
					'img' : {
						'icon' : 'fa fa-file-image-o'
					},
					'js' : {
						'icon' : 'fa fa-file-text-o'
					}

				}
			});

			$('#using_json').jstree({
				'core' : {
					'data' : [ 'Empty Folder', {
						'text' : 'Resources',
						'state' : {
							'opened' : true
						},
						'children' : [ {
							'text' : 'css',
							'children' : [ {
								'text' : 'animate.css',
								'icon' : 'none'
							}, {
								'text' : 'bootstrap.css',
								'icon' : 'none'
							}, {
								'text' : 'main.css',
								'icon' : 'none'
							}, {
								'text' : 'style.css',
								'icon' : 'none'
							} ],
							'state' : {
								'opened' : true
							}
						}, {
							'text' : 'js',
							'children' : [ {
								'text' : 'bootstrap.js',
								'icon' : 'none'
							}, {
								'text' : 'inspinia.min.js',
								'icon' : 'none'
							}, {
								'text' : 'jquery.min.js',
								'icon' : 'none'
							}, {
								'text' : 'jsTree.min.js',
								'icon' : 'none'
							}, {
								'text' : 'custom.min.js',
								'icon' : 'none'
							} ],
							'state' : {
								'opened' : true
							}
						}, {
							'text' : 'html',
							'children' : [ {
								'text' : 'layout.html',
								'icon' : 'none'
							}, {
								'text' : 'navigation.html',
								'icon' : 'none'
							}, {
								'text' : 'navbar.html',
								'icon' : 'none'
							}, {
								'text' : 'footer.html',
								'icon' : 'none'
							}, {
								'text' : 'sidebar.html',
								'icon' : 'none'
							} ],
							'state' : {
								'opened' : true
							}
						} ]
					}, 'Fonts', 'Images', 'Scripts', 'Templates', ]
				}
			});

		});
	</script>


</body>

</html>
