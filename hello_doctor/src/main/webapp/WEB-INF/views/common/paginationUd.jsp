<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

   			<nav aria-label="Navigation">
				<ul class="pagination justify-content-center m-0">
					<li class="page-item">
						<a class="page-link" href="javasdcript:list_go2(1);">
							<i class="fa fa-angle-double-left"></i>
						</a>
					<li class="page-item">
						<a class="page-link" href="javasdcript:list_go2(1);">
							<i class="fa fa-angle-left"></i>
						</a>
					</li>

					<c:forEach var="pageNum" begin="${dpageMaker.startPage }"
											 end="${dpageMaker.endPage }" >
						<li class="page-item ${dcri.page == pageNum?'active':''}">
							<a class="page-link" href="javasdcript:list_go2('${pageNum}');" >${pageNum }</a>
						</li>

					</c:forEach>


					<li class="page-item">
						<a class="page-link" href="javasdcript:list_go2(1);">
							<i class="fa fa-angle-right"></i>
						</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javasdcript:list_go2(${dpageMaker.realEndPage });">
							<i class="fa fa-angle-double-right"></i>
						</a>
					</li>
				</ul>
			</nav>


			<form id="jobForm">
				<input type='hidden' name="page" value="" />
				<input type='hidden' name="perPageNum" value="9"/>
				<input type='hidden' name="searchType" value="" />
				<input type='hidden' name="keyword" value="" />
				<input type="hidden" name="userFilter" value=""/>
				<input type="hidden" name="userChoice" value=""/>
			</form>

