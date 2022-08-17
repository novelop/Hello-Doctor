<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | E-commerce</title>

<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/summernote/summernote-bs4.css"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">



</head>

<body>

	<div class="input-group date">
		<span class="input-group-addon"><i class="fa fa-calendar"></i></span><input
			type="text" class="form-control" value="07/01/2014">
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

	<!-- SUMMERNOTE -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/summernote/summernote-bs4.js"></script>

	<!-- Data picker -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<script>
		$(document).ready(function() {

			$('.summernote').summernote();

			$('.input-group.date').datepicker({
				todayBtn : "linked",
				keyboardNavigation : false,
				forceParse : false,
				calendarWeeks : true,
				autoclose : true
			});

		});
	</script>

</body>

</html>
