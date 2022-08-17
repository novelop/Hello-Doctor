<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
	<style type="text/css">

	.mainform{
		width: 200px;
		}
	.table-hover{
		text-align: center;
	}
	.title{
		text-align: left;
		font-size: 15px;
	}

	#formmodify{
		padding-left: 5%;
		padding-right: 5%;

	}
	</style>
<script type="text/javascript">

</script>

</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox ">
				<div class="ibox-title">
					<h2 style="text-align: center">진료 폼</h2>
				</div>
				<div class="ibox-content">
					<form method="get" action="patientRegist">
					<div style="text-align: right">
						<button type="button" class="btn btn-primary"><i class="fa fa-check-square-o"></i>적용</button>
						<button type="button" class="btn btn-warning" ><i class="fa fa-plus-square-o"></i>진료 폼 추가</button>
						</div>
						<div class="ibox-content">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="mainform">Main form</th>
										<th>제목</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${docu }" var="i">
										<tr>
											<td>
												<div class="i-checks">
													<label> <input type="radio" <c:if test="${i.doMain eq 'Y'}">checked </c:if> value="option2"
														name="a"> <i></i>
													</label>
												</div>
											</td>
											<td class="title">${i.doName }</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						    <div class="bg-primary p-xs b-r-xl" style="float: left; margin-top: 25px;">진료 폼 수정</div>
                        <div style="text-align: right; margin-top: 25px;">
                         		<button class="btn btn-success " type="button">
							<i class="fa fa-sign-out ">수정 하기</i>
								</button>
                                </div>
 <textarea class="form-control border-left" id="formmodify" style="height: 320px; resize: none; font-size: 14px; " spellcheck="false">
c/c)
Onset)
Cause)
P/I)
P.M.Hx.)
HTN(-)DM(-)Tbc(-)Heeatitis(-)
F/C/C/S/R(-/-/-/-/-)
A/N/V/C/D(-/-/-/-/-)
Abdmoinal Pain(-)
Lab)
Imp)
                            </textarea>
					</form>

				</div>

			</div>

		</div>
	</div>





	<!-- Mainly scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});
	</script>
</body>
</html>