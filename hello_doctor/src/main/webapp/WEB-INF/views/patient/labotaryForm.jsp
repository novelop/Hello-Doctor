<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <h5>검사 대기</h5>
		<input type="button" onclick="regist()" value="환자 등록">
		<input type="button" onclick="labotary()" value="검사 실">

                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control form-control-sm m-b-xs" id="filter"
                                   placeholder="Search in table">

                            <table class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                <thead>
                                <tr>
                                    <th>하위업무 코드</th>
                                    <th>하위업무명</th>
                                    <th>하위업무일</th>
                                    <th >검사 완료</th>
                                </tr>
                                </thead>
                                <tbody>


							<c:forEach items="${subTask }" var="i">
								<tr class="gradeX">
									<td>${i.subNo }</td>
									<td>${i.subName }</td>
									<td><fmt:formatDate value="${i.subDate}" pattern="yyyy-MM-dd" /></td>
									<td class="center"><input type="button" value="검사완료" onclick="update('${i.subNo }')"></td>

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
function update(subNo){
	 jsondata = {"subNo" : subNo}
	  $.ajax({
          url :"<%=request.getContextPath()%>/patient/labotaryRegist"
        , type : "POST"
        , data : 	JSON.stringify(jsondata)// 검색 키워드
        , contentType : 'application/json'
        , success : function(response){ 	// 성공
        	location.reload()
        }
})
}
</script>
</body>
</html>