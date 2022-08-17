<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="feedbackList" value="${dataMap.feedbackList }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세</title>

<style>



</style>

</head>
<body>
	<section style="padding: 0px;" class="content container-fluid">
		<div class="justify-content-center">
			<div class="col-md-13" style="padding : 3px">
				<div class="card card-outline card-info">
				<div class="card-header row" style="margin-right: 0px;">
						<h4 class="col-md-8" style="width: 92%; display: inline-block;"><i class="fa fa-share-alt"></i>&nbsp;공유 받은 오더세트</h4>

						<button type="button"
								style="border: none;background: none;"
								onclick="window.close();">
								<i class="fa fa-times-rectangle" aria-hidden="true" style="color: #3E5476;
    font-size: 23px;
    vertical-align: -8px; margin-left: 9px;"></i>
							</button>
						<div class="card-tools" style="display: inline-block;">
							&nbsp;&nbsp;&nbsp;&nbsp;


						</div>
					</div><!--end card-header  -->




		<div class="col-lg-6"  style="margin-left: 1px; border-radius: 0px; min-height: 506px; height: auto; padding: 20px;">
			<div style="height: 418px;">
			<c:forEach items="${feedbackList}" var="feed" begin="0" end="3"
					step="1">
					<div class="feed-element"
						style="cursor: pointer; padding-bottom: 0px;"
						onclick="subgoPage('/orderset/orderset_detail.do?from=list&oNo=${feed.oNo}#top');">
						<a class="float-left"> <img alt="image" class="rounded-circle"
							src="<%=request.getContextPath()%>/doctor/getPic?dId=${feed.dId}">
						</a>
						<div class="media-body ">
							<%--                                             <small class="float-right"><i class="fa fa-clock-o"></i> ${feed.fbRegdate}</small> --%>
							<strong>${feed.dName}/${feed.maName}</strong>님이 <strong>${feed.oTitle}</strong>
							오더세트에 사용 후기를 등록하였습니다.<br> <small class="text-muted"><i
								class="fa fa-clock-o"></i> ${feed.fbRegdate}</small>
							<div class="well">
								<c:choose>
									<c:when test="${fn:length(feed.fbResult) gt 76}">
										<c:out value="${fn:substring(feed.fbResult, 0,75)}..">
				        								</c:out>
									</c:when>
									<c:otherwise>
										<c:out value="${feed.fbResult}">
										</c:out>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:if test="${empty feedbackList}">
						<div
							style="text-align: center; font-size: 18px; color: #c6cace; padding: 69px; height: 187px;">
							<p>새로운 사용 후기 알림이 없습니다.</p>
						</div>
				</c:if>

			</div>
			<nav aria-label="Navigation" style="    margin-top: 16px;">
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
					<div class="card-footer" style="display:none">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>

        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });

        	function list_go(page){
      		  url = "/orderset/MainReplyList.do";
      		   subgoPage(url+"?page="+page+"&perPageNum=4");
      		}
        </script>

</body>
</html>