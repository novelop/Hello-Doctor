<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="member" value="${ dataMap.member}"></c:set>
<c:set var="pop" value="${ dataMap.pop}"></c:set>
<c:set var="fix" value="${dataMap.fix }"></c:set>
<c:set var="rec" value="${dataMap.recent }"></c:set>
<c:set var="rCount" value="${dataMap.retireCount }"></c:set>
<c:set var="mCount" value="${dataMap.memberCount }"></c:set>
<c:set var="dor" value="${dataMap.dormant }"></c:set>
<c:set var="uD" value="${dataMap.updateMed }"></c:set>
		<%@ include file="header.jsp" %>

			<br>

			<div class="div_body" style="height: 37%">
				<div class="div_title" style="width: 39%; margin-right: 2px;">
					<div class="" style="margin: 10px">
						<table>
							<tr>
								<td style="text-align: left">
									<h3>신규가입</h3>
								</td>
								<td style="text-align: right">
									<span>※IP등록 요망</span>
								</td>
								<td style="text-align: right">
									<i class="fa fa-bars" onclick="location.href='doctor'" style="cursor: pointer;"></i>
								</td>
							</tr>
						</table>
					</div>
					
					<div style="max-height: 89%; overflow: hidden;">
						<table class="manager_table table table-bordered" style="width: 100%">
							<thead>
								<tr>
									<th>이름</th>
									<th>아이디</th>
<!-- 									<th>연구실</th> -->
									<th>IP</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty member }">
									<c:forEach items="${member }" var="member" begin="1" end="6">
										<tr>
											<td>${member.dName }</td>
<%-- 											<td>${member.dOffice }</td> --%>
											<td>${fn:substring(member.dId,0,5) }**
											</td>
											<td>
											<button style="padding: 1px" class="btn btn-success" onclick="OpenWindow('./ip_manager?dId=${member.dId}','IP추가/변경', 350,500)">등록</button>
<%-- 											<a onclick="OpenWindow('./ip_manager?dId=${member.dId}','IP추가/변경', 350,500)">등록</a> --%>
											</td>
										</tr>
									</c:forEach>
								</c:if>


							</tbody>
						</table>
					</div>
				</div>
				<div class="div_title" style="width: 59%; margin-left: 2px;">
					<div style="padding: 15px 10px 10px 15px;">
						<div class="tabs-container">
                        <ul class="nav nav-tabs" role="tablist">
                            <li><a class="nav-link active" data-toggle="tab" href="#tab-1">최근공지</a></li>
                            <li><a class="nav-link" data-toggle="tab" href="#tab-2">팝업공지</a></li>
                            <li><a class="nav-link" data-toggle="tab" href="#tab-3">고정공지</a></li>
                            <li style="margin-left: 380px"><i class="fa fa-bars" onclick="location.href='notice'" style="cursor: pointer;"></i></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" id="tab-1" class="tab-pane active">
                                <div class="panel-body" style="height: 261px; overflow: hidden; padding: 0px">
									<c:choose>
                                		<c:when test="${!empty rec }">
	                                			<table style="width: 100%" class="table table-bordered">
	                                				<thead>
		                                				<tr>
		                                					<th style="width: 7%">
		                                						번호
		                                					</th>
		                                					<th style="width: 75%">
		                                						공지제목
		                                					</th>
															<th>
																등록일
															</th>
		                                				</tr>
	                                				</thead>
                                			<c:forEach items="${rec }" var="rec" >
	                                				<tr onclick="location.href='notice_detail?nNo=${rec.nNo}'" style="cursor:pointer">
	                                					<td style="width: auto">
	                                						<fmt:formatNumber value="${fn:substring(rec.nNo,1,5) }" type="number" var="no"/>
	                                						${no }
	                                					</td>
	                                					<td style="width: 51%; text-align: left" >
	                                						${fn:substring(rec.nTitle,0,35) }
	                                					</td>
														<td>
															${rec.nDate }
														</td>
	                                				</tr>
                                			</c:forEach>
	                                			</table>
                                		</c:when>
                                		<c:when test="${empty rec }">
                                			<div style="margin-top:27%">
	                                			<span style="text-align: center;">최근 등록한 공지가 없습니다.</span>
                                			</div>
                                		</c:when>
                                	</c:choose>
                                </div>
                            </div>
                            <div role="tabpanel" id="tab-2" class="tab-pane" style="text-align: center; max-height: 100%">
                                <div class="panel-body" style="height: 261px; overflow: hidden; padding: 0px">
                                	<c:choose>
                                		<c:when test="${!empty pop }">
                                			<c:forEach items="${pop }" var="pop">
	                                			<table style="width: 100%" class="table table-bordered">
	                                				<thead>
		                                				<tr>
		                                					<th style="width: 7%">
		                                					번호
		                                					</th>
		                                					<th style="width: 60%">
		                                						공지제목
		                                					</th>
															<th>
																팝업기간
															</th>
		                                				</tr>
	                                				</thead>
	                                				<tr onclick="location.href='notice_detail?nNo=${pop.nNo}'" style="cursor:pointer">
	                                					<td style="width: auto;">
	                                						<fmt:formatNumber value="${fn:substring(pop.nNo,1,5) }" var="pno" type="number"/>
	                                						${pno }
	                                					</td>
	                                					<td style="text-align: left">
	                                						${fn:substring(pop.nTitle,0,30) }
	                                					</td>
	                                					<td >
	                                						${pop.popPeriodStart } ~ ${pop.popPeriodEnd }
	                                					</td>
	                                				</tr>
	                                			</table>
                                			</c:forEach>
                                		</c:when>
                                		<c:when test="${empty pop }">
                                			<div style="margin-top:27%">
	                                			<span style="text-align: center;">현재 등록된 팝업 공지가 없습니다.</span>
                                			</div>
                                		</c:when>
                                	</c:choose>

                                </div>

                            </div>
                            <div role="tabpanel" id="tab-3" class="tab-pane">
                                <div class="panel-body" style="height: 261px; padding: 0px; overflow: hidden;">
									<c:choose>
                                		<c:when test="${!empty fix }">
	                                			<table style="width: 100%" class="table table-bordered">
	                                				<thead>
		                                				<tr>
		                                					<th style="width:7%">
		                                						번호
		                                					</th>
		                                					<th style="width: 68%">
		                                						공지제목
		                                					</th>
		                                					<th>
		                                						등록일
		                                					</th>
		                                				</tr>
	                                				</thead>
                                			<c:forEach items="${fix }" var="fix" begin="1" end="6">
	                                				<tr onclick="location.href='notice_detail?nNo=${fix.nNo}'" style="cursor:pointer">
	                                					<td style="width: auto;">
	                                						<fmt:formatNumber value="${fn:substring(fix.nNo,1,5) }" var="fno" type="number"/>
	                                						${fno }
	                                					</td>
	                                					<td style="width: 68%; text-align: left">
	                                						${fn:substring(fix.nTitle,0,30) }
	                                					</td>
	                                					<td>
	                                						${fix.nDate }
	                                					</td>
	                                				</tr>
                                			</c:forEach>
	                                			</table>
                                		</c:when>
                                		<c:when test="${empty fix }">
                                			<div style="margin-top:27%">
	                                			<span style="text-align: center;">현재 등록된 고정 공지가 없습니다.</span>
                                			</div>
                                		</c:when>
                                	</c:choose>
                                </div>
                            </div>
                        </div>


                    </div>
					</div>
				</div>

			</div>

			<div class="row" style="margin-left: 10px; margin-right: 10px; margin-top: 10px ">
				<div class="col-sm-4 ibox-content">
				<table>
					<tr style="border: none">
						<td style="text-align: left">
							<h3>휴면계정</h3>
						</td>
						<td style="text-align: right; opacity: 1">
							※90일 이상 미접속 계정
						</td>
					</tr>
				</table>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>
									이름
								</th>
								<th>
									아이디
								</th>
								<th>
									최근 접속일
								</th>
							</tr>
						</thead>
							<c:if test="${!empty dor}">
								<c:forEach items="${dor }" var="dor">
									<c:if test="${dor.dId != null}">
								<tr>
									<td>
										${dor.dName }
									</td>
									<td>
										${fn:substring(dor.dId,0,5) }**
									</td>
									<td>
										${dor.inDate }
									</td>
								</tr>
								</c:if>
								</c:forEach>
							</c:if>
					</table>
				</div>
				<div class="col-sm-8 ibox-content">
					<div class="row">
						<table>
							<tr>
								<td style="text-align: left;">
									<h3>업데이트 약품</h3>
								</td>
								<td style="text-align: right">
									<i class="fa fa-bars" style="font-weight: bold; cursor: pointer;" onclick="location.href='dUpdate'"></i>
								</td>
							</tr>
						</table>
						
					<table class="table table-bordered">
					<thead>
							<tr>
								<th>
									약품명
								</th>
								<th>
									약품 일련번호
								</th>
								<th>
									약품회사
								</th>
								<th style="width: 10%">
									급여여부
								</th>
								<th style="width: 12%">
									등록일
								</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${!empty uD}">
							<c:forEach items="${uD }" var="u" begin="1" end="6">
								<tr>
									<td style="text-align: left;">
										${fn:substring(u.meName,0,25) }
									</td>
									<td >
										${u.meCode }
									</td>
									<td style="text-align: left">
										${fn:substring(u.meCompany,0,11) }
									</td>
									<td >
										<c:if test="${empty u.meInserance }">
											급여
										</c:if>
									</td>
									<td>
										<fmt:parseDate value="${u.mePermitdate }" pattern="yyyyMMdd" var="per"/>
										<fmt:formatDate value="${per }" pattern="yyyy-MM-dd"/>

									</td>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
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

	<!-- Flot -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/flot/jquery.flot.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/flot/jquery.flot.resize.js"></script>


	<!-- Peity -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/peity/jquery.peity.min.js"></script>
	<!-- Peity demo -->
	<script
		src="<%=request.getContextPath()%>/resources/js/demo/peity-demo.js"></script>
	<!-- chart js -->
	<script
		src="<%=request.getContextPath()%>/resources/js/plugins/chartJs/Chart.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/commons.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/hs.js"></script>




</body>
</html>