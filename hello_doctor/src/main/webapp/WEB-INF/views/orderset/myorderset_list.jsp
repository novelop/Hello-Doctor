<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cri" value="${pageMaker.cri }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<style>
.table>tbody>tr>td {
	font-size: 15px;
	padding-top: 15px;
}

th:nth-child(2){  width: 45%;}
td:nth-child(2):hover {  color: grey;}



.title {
	font-size: 15px;
	margin-bottom: 30px;
	padding-top: 20px;
}

.clean {
	clear: both;
}

.titleright {
	float: right;
}

#mainname {
	font-weight: bold;
	font-size: 25px;
}

.inputinfo {
	    width: 18%;
    height: 46px;
    margin-top: 50px;
    margin-left: 79%;
    margin-right: 18px;
}

.collapsed {
	height: 15px;
}
	.mediname{
	width: 565px;
	}
	.medicine{
		width: 100%;
		margin: 0 auto;
		text-align: left;
	}
	.empty{
		padding: 0px !important;
	}
	#selectboxdiv{
	display: block;
	height: 15px;

	}
	.footable-visible{
    padding-right: 426px;
    padding-top: 50px;
	}

.title_2 {
	text-align: center;
	margin: 20px;
}
.search{
	float : right;
	margin-right : 20px;

}
.clickable{
height: 27px;
    font-size: 12px;
}
#registbutton{
font-size: 1.1em;display: inline-block;cursor: pointer;margin-left: 10px;width: 10%;
float:left;

}
.sweet-alert{
top: 25%;
}
</style>

</head>
<body>
	<div class="ibox" style="margin-bottom: 0" id="prescriptionbox">


			<div class="ibox-content">

	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-9">
			<h3 style="margin-top: 20px;">MY 오더세트</h3>
		</div>
	</div>

				<div class="title_2" style="margin-top: 11px;">
					<a id="registbutton" onclick="subgoPage('/orderset/myorderset_registForm.do')"> <i class="fa fa-plus-square-o" style="vertical-align: -3px; font-size: 23px;">&nbsp;</i><span style="font-size: 15px;">등록하기</span></a>

					&nbsp;&nbsp;
<div class="search" style="display: inline-block;width: calc(33% - 0px);text-align: right;">
						<select name="searchType" class="form-control" style="height: 31px; width: 140px; text-align: center; font-size: 1em; display: inline-block;" onchange="list_go(1, '/orderset/myorderset_list.do')">
							<option value="">정렬</option>
							<option value="sta" ${param.searchType eq 'sta' ? 'selected' : ''}>상태</option>
							<option value="da" ${param.searchType eq 'da' ? 'selected' : ''}>날짜(최신순)</option>
							<option value="dd" ${param.searchType eq 'dd' ? 'selected' : ''}   >날짜(오래된순)</option>
						</select>
						<input name="keyword" class="form-control" style="display: inline-block; height: 31px; width: 170px; vertical-align: 1px;" type="text" value="">
						<a onclick="list_go(1,'/orderset/myorderset_list.do');"><i style="font-size: 1.5em; " class="fa fa-search"></i></a>
					</div>
					</div>
				<div class="panel-body">
					<div class="panel-group" id="accordion">
						<div class="panel panel-default" style="border: none;">
						<table class="table table-hover">
							<thead>
								<tr>
									<th></th>
									<th>별칭(병명)</th>
									<th>사용여부</th>
									<th>상태</th>
									<th>작성일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
						<c:forEach items="${myOrderList}"  var="i" varStatus="status">
								<tr>
									<td>
											</td>
									<td  onclick="subgoPage('/orderset/myorderset_detail.do?moNo=${i.moNo}')" style="cursor: pointer;">
										<c:choose>
											<c:when test="${fn:length(i.oTitle) gt 21}">
												<c:out value="${fn:substring(i.oTitle, 0, 19)}.." >
		        								</c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${i.oTitle}">
												</c:out>
											</c:otherwise>
										</c:choose>
									</td >
									<td>${i.oTarget }</td>
									<td>
									<c:if test="${not empty i.oResult }">
									결과 작성 완료

									</c:if>
									<c:if test="${empty i.oResult }">
									결과 작성 미완료
									</c:if>

									</td>
									<td><fmt:formatDate value="${i.oRegdate}" pattern="yyyy-MM-dd"/></td>
									<td>
									<button type="button" data-toggle="collapse"
												data-parent="#accordion"
												style="border: none; background: none; margin-top: -5px; font-size: 13px;"
												href="#collapse${status.index}" class="collapsed clickable"
												aria-expanded="false"
												onclick="druglist('${i.moNo}','${status.index}',this)">
												<i class="fa fa-angle-down" style="font-size: 19px;"></i> 처방 내역</a>
											</button>
										</td>
								</tr>
								<tr>
									<td colspan="6" class="empty">
										<div id="collapse${status.index}" class="panel-collapse collapse in" data-parent="#accordion" style="    background: #8080800d;">
											<table class="medicine">
													<tbody id="drughandle${status.index}">

													</tbody>
														</table>
										</div>

									</td>
								</tr>
					  </c:forEach>

							</tbody>
						</table>
					</div>



			</div>

	<nav aria-label="Navigation">
				<ul class="pagination justify-content-center m-0">
					<li class="page-item">
						<a class="page-link" href="javascript:list_go(1);">
							<i class="fa fa-angle-double-left"></i>
						</a>
					<li class="page-item">
						<a class="page-link" href="javascript:list_go(1);">
							<i class="fa fa-angle-left"></i>
						</a>
					</li>

					<c:forEach var="pageNum" begin="${pageMaker.startPage }"
											 end="${pageMaker.endPage }" >
						<li class="page-item ${cri.page == pageNum?'active':''}">
							<a class="page-link" href="javascript:list_go('${pageNum}');" >${pageNum }</a>
						</li>

					</c:forEach>


					<li class="page-item">
						<a class="page-link" href="javascript:list_go(1);">
							<i class="fa fa-angle-right"></i>
						</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:list_go(${pageMaker.realEndPage });">
							<i class="fa fa-angle-double-right"></i>
						</a>
					</li>
				</ul>
			</nav>

		</div>

		</div>
	</div>
<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<c:if test="${from eq 'regist' }">
	<script>
	swal("", "My오더세트가 등록되었습니다.", "success");
	</script>
</c:if>
<c:if test="${from eq 'delete' }">
	<script>
	swal("", "My오더세트가 삭제되었습니다.", "success");
	</script>
</c:if>

	<script type="text/javascript">
	function list_go(page,url){

		url = '/orderset/myorderset_list.do';

		var searchType = $('select[name="searchType"]').val();
		var keyword = $('input[name="keyword"]').val();
		subgoPage(url+"?page="+page+"&perPageNum=10&searchType="+searchType+"&keyword="+keyword);

	}

	</script>
	<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
	<script type="text/x-handlebars-template" id="orderlist">
	{{#each.}}
		<tr>
		<td class="mediname">{{oDrug}}</td>
		<td>{{quantity}}</td>
		<td>{{dgAday}}</td>
		<td><span class="numbertd">{{dgDays}}</span>
		</td>
		</tr>
    {{/each}}
</script>


<script type="text/javascript">
var i = null;
function druglist(moNo, number,a){
	if(i){
		i.attr("class","fa fa-angle-down");
	}
	var here = "drughandle"+number;
	console.log(here)
	var no = {"moNo" : moNo}
	$.ajax({
		url: "<%=request.getContextPath()%>/medi/orderlist",
		type: 'post',
		data : JSON.stringify(no),
		contentType : 'application/json',
		success:function(data){
			var template=Handlebars.compile($('#orderlist').html());
			   var html = template(data);
			   $('#'+here).html(html);
			   i = $(a).find("i");
			   i.attr("class","fa fa-angle-up");
		}
})
}

</script>

</body>
</html>