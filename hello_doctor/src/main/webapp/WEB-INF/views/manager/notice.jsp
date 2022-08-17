<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="notice" value="${dataMap.list }"></c:set>
<c:set var="pageMaker" value="${dataMap.pageMaker }"></c:set>
<c:set var="cri" value="${dataMap.pageMaker.cri }"></c:set>

<%@ include file="header.jsp" %>
<br>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h1 style="color:black; font-weight:bold; margin-top: 0px;">공지사항 관리</h1>
			</div>
			<div class="row" style="margin-right: 20px; max-height: 30px; margin-top: 2%; margin-left: 50%">


				<div class="input-group-append">
					<button class="btn btn-primary" onclick="location.href='registForm'" style="display:inline-block; margin-right: 10px; margin-left: 73px;">공지등록</button>
				</div>

					<select id="status" class="form-control" style="width: 105px; margin: 0; display:inline-block;" name="userChoice" onchange="list_go(1)">
	                     <option value="b" ${cri.userChoice eq 'b' ? 'selected' : '' }>전체</option>
	                     <option value="p" ${cri.userChoice eq 'p' ? 'selected' : '' }>팝업공지</option>
	                     <option value="f" ${cri.userChoice eq 'f' ? 'selected' : '' }>고정공지</option>
	                </select>

			</div>
		</div>

		<br>
		<div class="" style="margin-bottom:10px; ">
		<table class="table table-bordered" style="text-align: center; font-size: 1.0em; width: 100%">
			<thead>
				<tr style="border-top: 2px solid;">
					<th style="width: 5%; border-bottom: 1px solid;">번호</th>
					<th style="width: 50%; border-bottom: 1px solid;">제목</th>
					<th style="width: 10%; border-bottom: 1px solid;">등록일</th>
					<th style="width: 7%; border-bottom: 1px solid;">고정</th>
					<th style="border-bottom: 1px solid;">팝업설정</th>
					<th style="border-bottom: 1px solid;">팝업기간</th>
				</tr>
			</thead>
			<tbody >
				<c:if test="${!empty notice }">
					<c:forEach items="${notice }" var="notice">
<%-- 						<tr onclick="OpenWindow('notice_detail?nNo=N${notice.nNo}','',900,600)"> --%>
						<tr onclick="location.href = 'notice_detail?nNo=N${notice.nNo}'" style="cursor:pointer">
							<td style="width: 5%">
								<fmt:formatNumber value="${notice.nNo }" type="number" var="numberType" />
								${numberType }
							</td>
							<td style="text-align: left">
								${notice.nTitle }
							</td>
							<td style="width: 10%">
								<fmt:parseDate value="${notice.nDate }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
							</td>
							<td style="width: 7%">
								<c:if test="${notice.pickYn == 'Y'}">
									<span style="font-weight: bold; color: blue">활성화</span>
								</c:if>
								<c:if test="${notice.pickYn == 'N'}">
									<span style="font-weight: bold; color: red">비활성화</span>
								</c:if>
							</td>
							<td style="width: 7%">
								<c:if test="${notice.popYn == 'Y' }">
									<span style="font-weight: bold; color: blue">활성화</span>
								</c:if>
								<c:if test="${notice.popYn == 'N' }">
									<span style="font-weight: bold; color: red">비활성화</span>
								</c:if>
							</td>
							<td>
								<c:if test="${notice.popYn == 'Y' }">
									<fmt:parseDate value="${notice.popPeriodStart }" var="Sdate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:parseDate value="${notice.popPeriodEnd }" var="Edate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${Sdate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${Edate }" pattern="yyyy-MM-dd"/>
								</c:if>
								<c:if test="${notice.popYn == 'N' }">
									<span>X</span>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</div>
		<div>
		</div>
			<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
	</div>

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
	//팝업창들 뛰우기
	//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	   winleft = (screen.width - WinWidth) / 2;
	   wintop = (screen.height - WinHeight) / 2;
	   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", "
	                     +"height="+ WinHeight +", top="+ wintop +", left="
	                     + winleft +", resizable=yes, status=yes"  );
	   win.focus() ;
	}
	</script>

	<script>
	function list_go(page,url,dId){
		   if(!url) url="notice";
		   var jobForm=$('#jobForm');
		   jobForm.find("[name='page']").val(page);
		   var userChoice = jobForm.find("[name='userChoice']")
		   .val($('select[name="userChoice"]').val());
		   location.href = url+"?page="+page+"&perPageNum=9&userChoice="+userChoice.val();
		}
	</script>
</body>

</html>