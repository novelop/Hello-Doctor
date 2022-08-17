<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- Toastr style -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">

<!-- Gritter -->
<link
	href="<%=request.getContextPath()%>/resources/js/plugins/gritter/jquery.gritter.css"
	rel="stylesheet">

<!-- 	수정 -->
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/animate2.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">


<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	background-color: #abd9e9;
	font-family: Arial;
	width: 760px;
}

#container {
	width: 750px;
	height: 600px;
	background: #eff3f7;
	margin: 0 auto;
	font-size: 0;
	border-radius: 5px;
	overflow: hidden;
}

aside {
	width: 260px;
	height: 800px;
	background-color: #5c77f0;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

main {
	width: 490px;
	height: 600px;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

aside header {
	padding: 30px 20px;
}

aside input {
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0 50px 0 20px;
	background-color: #5e616a;
	border: none;
	border-radius: 3px;
	color: #fff;
	background-image:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
	background-repeat: no-repeat;
	background-position: 170px;
	background-size: 40px;
}

aside input::placeholder {
	color: #fff;
}

aside ul {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 690px;
}

aside li {
	padding: 10px 0;
}

aside li:hover {
	background-color: #5e616a;
}

h2, h3 {
	margin: 0;
}

aside li img {
	border-radius: 50%;
	margin-left: 20px;
	margin-right: 8px;
}

aside li div {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
}

aside li h2 {
	font-size: 14px;
	color: #fff;
	font-weight: normal;
	margin-bottom: 5px;
}

aside li h3 {
	font-size: 12px;
	color: #7e818a;
	font-weight: normal;
}

.nav-tabs {
	height: 80px;
	overflow: hidden;
}

.status {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 7px;
}

.green {
	background-color: #58b666;
}

.orange {
	background-color: #ff725d;
}

.blue {
	background-color: #6fbced;
	margin-right: 0;
	margin-left: 7px;
}

main header {
	height: 110px;
	padding: 30px 20px 30px 40px;
}

main header>* {
	display: inline-block;
	vertical-align: top;
}

main header img:first-child {
	border-radius: 50%;
}

main header img:last-child {
	width: 24px;
	margin-top: 8px;
}

main header div {
	margin-left: 10px;
	margin-right: 145px;
}

main header h2 {
	font-size: 16px;
	margin-bottom: 5px;
}

main header h3 {
	font-size: 14px;
	font-weight: normal;
	color: #7e818a;
}

#chat {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height:  65%;
	border-top: 2px solid #fff;
	border-bottom: 2px solid #fff;
}

#chat li {
	padding: 10px 30px;
}

#chat h2, #chat h3 {
	display: inline-block;
	font-size: 13px;
	font-weight: normal;
}

#chat h3 {
	color: #bbb;
}

#chat .entete {
	margin-bottom: 5px;
}

#chat .message {
	padding: 20px;
	color: #fff;
	line-height: 25px;
	max-width: 90%;
	display: inline-block;
	text-align: left;
	border-radius: 5px;
}

#chat .me {
	text-align: right;
}

#chat .you .message {
	background-color: #58b666;
}

#chat .me .message {
	background-color: #6fbced;
}

#chat .triangle {
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 10px 10px 10px;
}

#chat .you .triangle {
	border-color: transparent transparent #58b666 transparent;
	margin-left: 15px;
}

#chat .me .triangle {
	border-color: transparent transparent #6fbced transparent;
	margin-left: 375px;
}

main footer {
	height: 10%;
	padding: 10px 20px 5px 10px;
}

main footer textarea {
	resize: none;
	border: none;
	display: block;
	width: 100%;
	height: 50px;
	border-radius: 3px;
	padding: 20px;
	font-size: 13px;
	margin-bottom: 13px;
}

main footer textarea::placeholder {
	color: #ddd;
}

main footer img {
	height: 30px;
	cursor: pointer;
}

main footer a {
	text-decoration: none;
	text-transform: uppercase;
	font-weight: bold;
	color: #6fbced;
	vertical-align: top;
	margin-left: 333px;
	margin-top: 5px;
	display: inline-block;
}

#logo {
	width: 100%;
	height: 10%;
	color: yellow;
	padding-top: 50px;
	padding-left: 60px;
}

h5 {
	padding: 0;
	margin: 2px;
}

.doctorinfo {
	margin: 0;
	width: 150px;
}

.tab-content {
	height: 470px;
}

.tab-pane, ul, .panel-body {
	height: 100%;
}

.ago {
	float: right;
}

.firstname {
	font-size: 30px;
	padding: 0;
	margin: 0;
}

.nav-tabs {
	height: 50px;
}

.center {
	padding-left: 30px;
}
</style>
</head>
<body class="pace-done body-small">
	<div id="container">

		<aside>
			<div id="logo">Hello Doctor Talk</div>
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li><a class="topnav nav-link active" data-toggle="tab"
						href="#tab-3" style="padding: 13px; color: black"> <i
							class="fa fa-wechat"></i>개인
					</a></li>
					<li><a class="topnav nav-link " data-toggle="tab"
						href="#tab-4" style="padding: 13px; color: black"><i
							class="fa fa fa-wechat"></i>단체</a></li>
					<li><a class="topnav nav-link" data-toggle="tab" href="#tab-5"
						style="padding: 13px; color: black"><i
							class="fa fa-address-book-o">주소록</i></a></li>
				</ul>

				<div class="tab-content">
					<div id="tab-3" class="tab-pane active">
						<div class="panel-body" style="padding: 0">
							<ul style="height: 100%">
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>강현수</h5>
										<h5>
											정신의학과<span class="ago">2분전</span>
										</h5>
										<h5>안녕하세요~~~</h5>
									</div></li>
							</ul>
						</div>
					</div>
					<div id="tab-4" class="tab-pane" style="padding: 0">
						<div class="panel-body" style="padding: 0">


							<ul style="height: 100%">
								<li class="center">

									<div class="avatar-sm align-self-center firstname">
										<span class="badge badge-pill badge-secondary">강</span>
									</div>

									<div class="doctorinfo">
										<h5>강현수 환자</h5>

										<h5>
											3members<span class="ago">2분전</span>
										</h5>
										<h5>안녕하세요~~~</h5>

									</div>
								</li>
							</ul>

						</div>
					</div>
					<div id="tab-5" class="tab-pane">
						<div class="panel-body" style="padding: 0">
							<ul style="height: 100%">
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>강현수</h5>
										<h5>정신의학과</h5>
										<h5>
											<span class="status orange"></span> 비접속
										</h5>
									</div></li>
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_02.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>김현수</h5>
										<h5>비뇨기과</h5>
										<h5>
											<span class="status green"></span> 접속
										</h5>
									</div></li>
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_03.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>이현수</h5>
										<h5>흉부외과</h5>
										<h5>
											<span class="status orange"></span> 비접속
										</h5>
									</div></li>
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_04.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>장현수</h5>
										<h5>정신의학과</h5>
										<h5>
											<span class="status green"></span> 접속
										</h5>
									</div></li>
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_05.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>박태정</h5>
										<h5>소아정신의학과</h5>
										<h5>
											<span class="status green"></span> 접속
										</h5>
									</div></li>
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_06.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>노혜지</h5>
										<h5>피부과</h5>
										<h5>
											<span class="status green"></span> 접속
										</h5>
									</div></li>
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_07.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>이의찬</h5>
										<h5>항문외과</h5>
										<h5>
											<span class="status green"></span> 접속
										</h5>
									</div></li>
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_08.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>유정민</h5>
										<h5>가정의학과</h5>
										<h5>
											<span class="status green"></span> 접속
										</h5>
									</div></li>
								<li><img
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_09.jpg"
									alt="">
									<div class="doctorinfo">
										<h5>이정규</h5>
										<h5>산부인과</h5>
										<h5>
											<span class="status green"></span> 접속
										</h5>
									</div></li>

							</ul>
						</div>
					</div>
				</div>
			</div>

		</aside>
		<main> <header>
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg"
				alt="">
			<div>

				<h2>강현수</h2>
				<h2>정신의학과</h2>
			</div>

		</header>
		<ul id="chat">
			<li class="you">
				<div class="entete">
					<span class="status green"></span>
					<h2>Vincent</h2>
					<h3>10:12AM, Today</h3>
				</div>
				<div class="triangle"></div>
				<div class="message">Lorem ipsum dolor sit amet, consectetuer
					adipiscing elit. Aenean commodo ligula eget dolor.</div>
			</li>
			<li class="me">
				<div class="entete">
					<h3>10:12AM, Today</h3>
					<h2>Vincent</h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">Lorem ipsum dolor sit amet, consectetuer
					adipiscing elit. Aenean commodo ligula eget dolor.</div>
			</li>
			<li class="me">
				<div class="entete">
					<h3>10:12AM, Today</h3>
					<h2>Vincent</h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">OK</div>
			</li>
			<li class="you">
				<div class="entete">
					<span class="status green"></span>
					<h2>Vincent</h2>
					<h3>10:12AM, Today</h3>
				</div>
				<div class="triangle"></div>
				<div class="message">Lorem ipsum dolor sit amet, consectetuer
					adipiscing elit. Aenean commodo ligula eget dolor.</div>
			</li>
			<li class="me">
				<div class="entete">
					<h3>10:12AM, Today</h3>
					<h2>Vincent</h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">Lorem ipsum dolor sit amet, consectetuer
					adipiscing elit. Aenean commodo ligula eget dolor.</div>
			</li>
			<li class="me">
				<div class="entete">
					<h3>10:12AM, Today</h3>
					<h2>Vincent</h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">OK</div>
			</li>
		</ul>
		<footer>
			<div class="p-3 chat-input-section">
                                        <div class="row">
                                            <div class="col">
                                                <div class="position-relative">
                                                    <input type="text" class="form-control chat-input" placeholder="메세지를 입력하세요">

                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <button type="submit" class="btn btn-primary chat-send w-md"><span class="d-none d-sm-inline-block me-2">Send</span> <i class="mdi mdi-send float-end"></i></button>
                                            </div>
                                        </div>
                                    </div>
		</footer> </main>
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
</body>
</html>