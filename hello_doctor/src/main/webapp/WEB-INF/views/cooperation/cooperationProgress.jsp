<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>협진요청</title>
<link href="<%=request.getContextPath()%>/resources/css/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<style>
.form-text {
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 8px;
	display: block;
	height: 250px;
	overflow: auto;
	padding-left: 20px;
}

.ibox-title {
	text-align: center;
	padding: 10px;
}

.buttons {
	text-align: center;
}

.hr-line-dashed {
	margin: 5px;
}

.ibox-content {
	padding-left: 70px;
}

.form-group {
	margin-bottom: -1rem;
}

.doctors {
	background-color: #FCF8E8;
	border-radius: 10px;
	padding: 8px;
	display: block;
	height: 121px;
	overflow: auto;
}

#tab ul {
	overflow-y: hidden;
	white-space: nowrap;
	overflow-x: auto;
	margin-left: -10px;
	padding: 10px 10px;
	width: 400px;
	height: 115px;
}

#tab ul li {
	display: inline-block;
	padding: 10px 10px;
	margin-right: 10px;
}

.doctors::-webkit-scrollbar {
	width: 10px;
}

.doctors::-webkit-scrollbar-thumb {
	background-color: #FF8C25;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.doctors::-webkit-scrollbar-track {
	background-color: #e0e0e0;;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}
</style>
</head>

<body style="width: 900px;">

	<div class="ibox ">
		<div class="ibox-title">
			<h3 style="padding-left: 80px;">
				협진 요청
				<img alt="중요도" src="<%=request.getContextPath()%>/resources/img/siren.png" style="width: 20px; height: 20px;">
			</h3>
				<span style="margin-left: 570px; width: 208px; margin-top: -37px; position: absolute; right: 20px;">
					<button class="btn btn-primary dim" type="button">협진 생성</button>

					<button class="btn btn-warning dim" type="button">생성 취소</button>
				</span>

		</div>
		<div class="ibox-content">


			<div class="form-group row">
				<label style="font-weight: bold; font-size: 1.1em;" class="col-sm-2 col-form-label">환자명</label>
				<h4>고덕찬</h4>

			</div>




			<hr>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">주상병</label>
				<h4>급성폐렴</h4>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">부상병</label>
				<h4>당뇨,루마티스관절염,탈모,관상동맥 죽상경화증</h4>
			</div>
			<hr>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">시작날짜</label>
				<div class="form-group" id="data_1">
					<div class="input-group date">
						<span class="input-group-addon"><i id="datepick" class="fa fa-calendar"></i></span><input type="text" class="form-control" value="03/04/2014">
					</div>
				</div>
				<span> <label>공개여부</label> <select name="fruit">
						<option value="바나나">공개</option>
						<option value="사과">비공개</option>
				</select>
				</span>




			</div>



			<br>
			<hr>

			<br>


				<label >주치의 소견</label> <br>
				<br>
				<textarea class="textarea" name="content" id="content" rows="20" placeholder="1000자 내외로 작성하세요." style="display: none;">
										</textarea>

			<br>
			<hr>




			<div class="form-group row">
				<h4>&emsp;&nbsp;협진 요청 의료진</h4>
				<i class="fa fa-plus-square"></i>
			</div>
			<br>


			<div class="doctors" id="tab" style="width: 320px; float: left; overflow-y: hidden; display: inline-block; height: 125px; margin-right: 40px; margin-top: 10px;">
				<ul>
					<li>
						<div style="width: 70px; height: 50px; float: left; text-align: center;">
							<img alt="프로필" src="/ddit/resources/img/user.png" style="width: 40px; height: 40px;">
							<h5>
								강현수 <br>호흡기내과
							</h5>
						</div>
					</li>
					<li>
						<div style="width: 70px; height: 50px; float: left; text-align: center;">
							<img alt="프로필" src="/ddit/resources/img/user.png" style="width: 40px; height: 40px;">
							<h5>
								강현수 <br>호흡기내과
							</h5>
						</div>
					</li>
					<li>
						<div style="width: 70px; height: 50px; float: left; text-align: center;">
							<img alt="프로필" src="/ddit/resources/img/user.png" style="width: 40px; height: 40px;">
							<h5>
								강현수 <br>호흡기내과
							</h5>
						</div>
					</li>
					<li>
						<div style="width: 70px; height: 50px; float: left; text-align: center;">
							<img alt="프로필" src="/ddit/resources/img/user.png" style="width: 40px; height: 40px;">
							<h5>
								강현수 <br>호흡기내과
							</h5>
						</div>
					</li>
					<li>
						<div style="width: 70px; height: 50px; float: left; text-align: center;">
							<img alt="프로필" src="/ddit/resources/img/user.png" style="width: 40px; height: 40px;">
							<h5>
								강현수 <br>호흡기내과
							</h5>
						</div>
					</li>

				</ul>

				<!-- 									<div style="width:70px; height:50px; float:left; text-align:center;"> -->

				<!-- 									<h5>강현수 <br>호흡기내과</h5> -->
				<!-- 									</div> -->
				<!-- 									&nbsp; -->
				<!-- 									 <div style="width:70px; height:50px; float:left; text-align:center;"> -->

				<!-- 									<h5>조현영 <br>호흡기내과</h5> -->
				<!-- 									</div> -->
				<!-- 									<div style="width:70px; height:50px; float:left; text-align:center;"> -->

				<!-- 									<h5>이의찬 <br>호흡기내과</h5> -->
				<!-- 									</div> -->
				<!-- 									&nbsp; -->
				<!-- 									 <div style="width:70px; height:50px; float:left; text-align:center;"> -->

				<!-- 									<h5>이의찬 <br>호흡기내과</h5> -->
				<!-- 									</div> -->
			</div>
			<div class="ibox " style="display: inline;">
				<table class="table" style="width: 50%;">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>


			</div>






		</div>



	</div>
	<!-- SUMMERNOTE -->

	<script src="<%=request.getContextPath()%>/resources/js/plugins/summernote/summernote-bs4.js"></script>
	<script>

  	function request_deny(){
			window.open("http://localhost/ddit/cooperation/request_deny.do", "","width=600, height=400, left=500, top=300")
		}
  	</script>
	<script>
        $(document).ready(function(){

            $('.summernote').summernote();

       });

        window.onload = function() {
        	summernote_go($('#content'), '<%=request.getContextPath()%>');
		}

		function regist_go() {
			var form = document.registForm;
			if (form.title.value == "") {
				alert("제목은 필수입니다.");
				return;
			}

			form.submit();

		}
	</script>
</body>
</html>