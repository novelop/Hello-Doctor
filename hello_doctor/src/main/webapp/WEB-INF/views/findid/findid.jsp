<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<meta charset="utf-8">
<title>아이디/비밀번호 찾기</title>
<style type="text/css">
li {
	width: 50%;
}

a {
	text-align: center;
}

table {
	text-align: center;
	margin: 5px;
}
td{
	padding: 5px;
}
input {
	background-color: #ffffff;
	background-image: none;
	border: 1px solid #e5e6e7;
	border-radius: 1px;
	padding: 6px 12px;
}
.user_input{
	width: 200px;
}
</style>
</head>
<body>
	<div class="wrapper wrapper-content animated fadeIn">

		<div class="row">
			<div class="col-lg-6">
				<div class="tabs-container">
					<ul class="nav nav-tabs" role="tablist">
						<li><a class="nav-link active" data-toggle="tab"
							href="#tab-1"> 아이디 찾기</a></li>
						<li><a class="nav-link" data-toggle="tab" href="#tab-2">비밀번호
								찾기</a></li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" id="tab-1" class="tab-pane active">
							<div class="panel-body">
								<form>
									<table>
										<tr>
											<td style="padding-left: 55px;"><span>이름</span></td>
											<td><input type="text" placeholder="이름을 입력해주세요" name="myname" id="myname"
												class="user_input"
												style="float: left; width: 79%; margin-left: 10px;">
											</td>
										</tr>
										<tr>
											<td style="width: 100px;"><span>주민등록번호</span></td>
											<td><input maxlength="6"
												oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
												type="text" class="form-control"
												style="width: 36%; float: left; margin-left: 10px;"
												name="idfirstRnum" id="idfirstRnum" required="">
												<p
													style="position: absolute; margin-left: 150px; margin-top: 8px;">─</p>
												<input maxlength="7"
												oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
												type="password" class="form-control"
												style="width: 36%; float: left; margin-left: 24px;"
												name="idsecondRnum" id="idsecondRnum" required="">
												<button class="btn btn-success" onclick="idfind()" type="button">확인</button></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
						<div role="tabpanel" id="tab-2" class="tab-pane">
							<div class="panel-body">
								<form>
									<table>
										<tbody>
											<tr>
												<td style="padding-left: 40px;"><span>아이디</span></td>
												<td><input type="text" placeholder="아이디를 입력해주세요"  id="passId" name="passId"
													class="user_input"
													style="float: left; width: 79%; margin-left: 10px;">
												</td>
											</tr>
											<tr>
												<td style="padding-left: 55px;"><span>이름</span></td>
												<td><input type="text" placeholder="이름을 입력해주세요"
													class="user_input"  id="passName" name="passName"
													style="float: left; width: 79%; margin-left: 10px;">
												</td>
											</tr>
											<tr>
												<td style="width: 100px;"><span>주민등록번호</span></td>
												<td><input maxlength="6"
													oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
													type="text" class="form-control"
													style="width: 36%; float: left; margin-left: 10px;"
													name="passfirstRnum" id="passfirstRnum" required="">
													<p
														style="position: absolute; margin-left: 150px; margin-top: 8px;">─</p>
													<input maxlength="7"
													oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
													type="password" class="form-control"
													style="width: 36%; float: left; margin-left: 24px;"
													name="passsecondRnum" id="passsecondRnum" required="">
													<button class="btn btn-success" type="button" onclick="passFind()">확인</button></td>
											</tr>
										</tbody>
									</table>
								</form>
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


<script>
function idfind(){

	var myname = $('#myname').val();
	var idfirstRnum = $('#idfirstRnum').val();
	var idsecondRnum = $('#idsecondRnum').val();


	data = {
		"myname": myname,
		"idfirstRnum" : idfirstRnum,
		"idsecondRnum" : idsecondRnum
	}


	$.ajax({
		url:"<%=request.getContextPath()%>/doctorstatus/idfind",
		type:"POST",
		data :JSON.stringify(data),
		contentType :'application/json',
		success :function(res){
			if(res !=""){
				alert("가입한 아이디: "+res);
				window.close();
			}else{
				alert("가입한 아이디가 없습니다.");
				window.close();
			}
		},
		error:function(xhr){
			alert("오류:"+xhr)
		}

	})

}


function passFind(){

	var passId = $('#passId').val();
	var passName = $('#passName').val();
	var passfirstRnum = $('#passfirstRnum').val();
	var passsecondRnum = $('#passsecondRnum').val();


	data = {
		"passId": passId,
		"passName": passName,
		"passfirstRnum" : passfirstRnum,
		"passsecondRnum" : passsecondRnum
	}


	$.ajax({
		url:"<%=request.getContextPath()%>/doctorstatus/passfind",
		type:"POST",
		data :JSON.stringify(data),
		contentType :'application/json',
		success :function(res){
			if(res !=""){
				alert("가입한 이메일로 비밀번호를 확인해 주세요.");
				window.close();
				location.href = "<%=request.getContextPath()%>/mail/send?email="+res+"&dId="+passId;
<%-- 				location.href = "<%=request.getContextPath()%>/mail/send?email="+res; --%>
			}else{
				alert("가입한 아이디가 없어 비밀번호를 찾을 수 없습니다.");
				location.href = "<%=request.getContextPath()%>/mail/send?email="+res+"&dId="+passId;
				window.close();
			}
			RL("http://www.test.com/login.jsp?id="+id+"&pass="+pass);

		},
		error:function(xhr){
			alert("오류:"+xhr)
		}

	})



}


</script>


</body>
</html>