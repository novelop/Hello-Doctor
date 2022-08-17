<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<style >
p{
    font-size: 13px;


}




</style>


<title>공지사항</title>
</head>
<body>
	<div class="card-header" style="background-color:rgb(194 231 223);">

						<div style="text-align: center;">
						<h4 style="font-weight: bold; color:black;display: inline-block;">${noticeVO.nTitle }

						</h4>
						</div>
					</div><!--end card-header  -->
	<table style="width: 100%" >
		<tr>
			<td>
				<hr>
			</td>
		</tr>
		<tr>
			<td>${noticeVO.nContent }</td>
		</tr>
	</table>
	<hr>
	<div style="float: right">
		<input id="ch" type="checkbox" onclick="closeWin()"><label>오늘하루 보지 않기</label>
	</div>
</body>
<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script src="~/Scripts/jquery_cookie.js" type="text/javascript"></script>
<script type="text/javascript">
window.onload = function(){
	if(document.querySelector('img')){
		document.querySelector('img').style.width = '100%';
	}
}


</script>
<script>
function setCookie(name, value)
{
    var todayDate = new Date();
    todayDate.setHours( 24 );
    document.cookie = name+ "=" + escape( value ) + "; path=/; expires=" +   todayDate.toGMTString() + ";";
}
function closeWin()
{
    if ($("input[id=ch]").attr("checked", true))
    {
        setCookie("name", "value" + "${noticeVO.nNo}");
        window.close();
    }
}
</script>

</html>