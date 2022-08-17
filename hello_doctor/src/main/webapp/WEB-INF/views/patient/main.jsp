<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | FooTable</title>

<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- FooTable -->
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/footable/footable.core.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">

</head>

<body>

<div class="row">
                <div class="col-lg-12">
                    <div class="ibox ">
                        <div class="ibox-title">
                            <h5>환자 정보</h5>
		<input type="button" onclick="regist()" value="환자 등록">
		<input type="button" onclick="labotary()" value="검사 실">

                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control form-control-sm m-b-xs" id="filter"
                                   placeholder="Search in table">

                            <table class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                <thead>
                                <tr>
                                    <th>이름</th>
                                    <th>주민번호</th>
                                    <th>성별</th>
                                    <th >전화번호</th>
                                    <th>환자코드</th>
                                </tr>
                                </thead>
                                <tbody>

							<c:forEach items="${patient }" var="i">
								<tr class="gradeX" onclick="reserve('${i.pNo }')">
									<td>${i.pName }</td>
									<td>${i.pRnum }</td>
									<td>${i.pSex }</td>
									<td class="center">${i.pTel }</td>
									<td class="center">${i.pNo }</td>
								</tr>

							</c:forEach>
						<tfoot>
							<tr>
                                    <td colspan="5">
                                        <ul class="pagination float-right"></ul>
                                    </td>
                                </tr>
						</tfoot>
					</table>
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

	<!-- FooTable -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/footable/footable.all.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

	<!-- Page-Level Scripts -->
	<script>
		$(document).ready(function() {

			$('.footable').footable();
			$('.footable2').footable();

		});
	</script>
<script type="text/javascript">

function regist(){
	window.open("<%=request.getContextPath()%>/patient/registForm",
			"", "width=900, height=600, left=600, top=150")

}
function reserve(pNo){
	window.open("<%=request.getContextPath()%>/patient/reservationForm?pNo="+pNo,
			"", "width=900, height=600, left=600, top=150")

}
function labotary(){
	window.open("<%=request.getContextPath()%>/patient/labotaryForm",
			"", "width=900, height=600, left=600, top=150")
}
</script>
</body>
</html>