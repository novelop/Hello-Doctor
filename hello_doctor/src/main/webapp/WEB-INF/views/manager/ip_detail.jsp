<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>
				사용자
			</td>
			<td>
				상태
			</td>
			<td>
				진료실
			</td>
			<td>
				연구실
			</td>
		</tr>
		<tr>
			<td>
				${ip.dName }
			</td>
			<td>
				<c:if test="${ip.accountStatus == 1 }">
					재직
				</c:if>
				<c:if test="${ip.accountStatus == 2 }">
					정직
				</c:if>
				<c:if test="${ip.accountStatus == 3 }">
					퇴직
				</c:if>
			</td>
			<td>
				${ip.dName }
			</td>
			<td>
				${ip.dName }
			</td>
		</tr>
	</table>
</body>
</html>