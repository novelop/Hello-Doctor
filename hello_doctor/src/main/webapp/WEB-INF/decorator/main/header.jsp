<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

<style>

.hoverdown ul{
display:none;
height:auto;
border:0px;
position:absolute;
width:200px;
z-index:200;
/*top:1em;
/*left:0;*/
}
div, button, span, input, iframe{
color: transparent;
 text-shadow: 0 0 0 black;

}
.hoverdown:hover ul{
display:block;
}


.abcd{

background-image: url("/ddit/resources/img/headerLogo.png");
width="50px" height="50px"

}

.navbar-top-links .dropdown{

margin-left: 16px;


}


.dropdown:hover .dropdownspan{

	background: lightgrey;

}
.dropdownspan{
    padding: 4px;
    border-radius: 15px;
}

.headermargin{

margin-left: 2px;


}

.active{
background: lightgrey;

}


</style>





        <div id="" class="gray-bg dashbard-1">


	<div class="" style="margin-left: 5%; margin-bottom: -14px; margin-top: -5px;">
		<nav class="homeee" role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<!--             <form role="search" class="navbar-form-custom" action="search_results.html"> -->
				<!--                 <div class="form-group"> -->
				<!--                     <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search"> -->
				<!--                 </div> -->
				<!--             </form> -->
			</div>

			<ul class="nav navbar-top-links navbar-right" style="">
				<li class="nav-header" style="margin-left: -51px;">
					<!--                         <div class="dropdown profile-element"> --> <!--                         	<a href="indexPage.do"> --> <!--                         	</a> --> <!--                         </div> -->
					<div class="" style="">
						<img src="/ddit/resources/img/headerLogo2.png" width="50px" height="50px" onclick="location.href='/ddit/index.do'"
						style="margin-top: -8px; height: 39px;">
						<!--                             <span class="abcd"  onclick="location.href='/ddit/index.do'"></span> -->
						<!--                         	<p style="font-weight: bold;display: inline;">Hello Doctor </p> -->
					</div>




				</li>


				<li class="dropdown"><a  class="gopage" href="javascript:goPage('/main/index.do')">
				<span class="" style=" font-weight: bold;width: 92px;margin-left: -28px;margin-top: -6px; font-size: 15px">Hello Doctor</span></a></li>
			<div class="row" style="width: 732px;   text-align: center; font-weight: bold;">
				<li class="dropdown" style=" margin-left: 2px;width: 120px;" >
				<a href="javascript:goPage('/medi/chart.do')">
				<span class="dropdownspan" style=" margin-top: 2px; margin-left: 23px; width: 35px;">
				<i class="fa fa-stethoscope" style="font-size: 15px;"></i>
				<p style="display: inline;font-size: 15px;">진료</p>
				</span></a>
				</li>


<!-- 				<li class="dropdown hoverdown"><a onclick="goPage('/colist/coworklist.do')" class="dropdown-toggle count-info" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-group" style="font-size: 1.5em;"></i> <span class="" -->
<!-- 						style="position: absolute; margin-top: 2px; width: 33px;">협진</span> </a> -->
<!-- 					<ul class="dropdown-menu dropdown-alerts" style="width: 150px; position: absolute; top: 52px; left: 0px; will-change: top, left;" "="" x-placement="bottom-start"> -->
<!-- 						<li><a href="javascript:goPage('/cooperation/coopermain.do')">My협진</a></li> -->
<!-- 					</ul></li> -->
				<li class="dropdown " style=" margin-left: -8px;     width: 120px;">
				<a  class="gopage" onclick="javascript:goPage('/cooperation/coopermain.do')"  >
				<span class="dropdownspan" style=" margin-top: 2px; width: 33px;">
				<i class="fa fa-group" style="font-size: 15px;"></i>
				<p style="display: inline;font-size: 15px;">협진</p></span> </a>
				</li>


				<li class="dropdown" style=" margin-left: 5px;     width: 120px;">
				<a  class="gopage" href="javascript:goPage('/scheduler/main.do')">
				<span class="dropdownspan" style=" margin-top: 2px; width: 76px; margin-left: -3px;">
				<i class="fa fa-calendar" style="font-size: 15px;"></i>
				<p style="display: inline;font-size: 15px;">스케줄</p></span>
				</a></li>


				<li class="dropdown hoverdown "style=" margin-left: 2px;    width: 120px;">
				<a   onclick="goPage('/orderset/main.do')" class="dropdown-toggle count-info gopage" >
				 <span class="dropdownspan"
						style="display: inline-block; margin-top: 2px; width: 87px; margin-left: -3px;">
						<i class="fa fa-flask" style="font-size: 15px;"></i>
						<p style="display: inline;font-size: 15px;">오더세트</p></span>

				</a>
					<ul class="dropdown-menu dropdown-alerts" style="width: 150px; position: absolute; top: 42px; left: 19px; will-change: top, left;" x-placement="bottom-start">
						<li><a href="javascript:goPage('/orderset/orderset_list.do')">공유오더세트</a></li>
						<li><a href="javascript:goPage('/orderset/myorderset_list.do')">My오더세트</a></li>
					</ul>
			   </li>


			   <li class="dropdown " style=" margin-left: -5px;     width: 120px;">
			   <a class="gopage" href="javascript:goPage('/case/main.do')">
				<span class="dropdownspan" style=" margin-top: 2px; width: 60px; margin-left: -3px;">
<!-- 				<img src="https://img.icons8.com/external-outline-design-circle/66/000000/external-discussion-activities-outline-design-circle.png" style="width: 25px; height: 25px;"> -->
				<i class="fa fa-comments" style="font-size:  15px;"></i>
				<p style="display: inline;font-size:  15px;">
				C.D</p></span> </a></li>


				<li class="dropdown "style=" margin-left: 2px;    width: 120px;">
				<a class="gopage" href="javascript:goPage('/history/main.do')">
				<span class="dropdownspan" style=" margin-top: 2px; width: 90px; margin-left: -3px;">
			     <i class="fa fa-history" style="font-size:  15px;"></i>
			     <p style="display: inline;font-size:  15px;">히스토리</p></span> </a>
<!-- 					<ul class="dropdown-menu dropdown-alerts" style="width: 150px; position: absolute; top: 52px; left: 6px; will-change: top, left;" x-placement="bottom-start"> -->
<!-- 						<li><a href="javascript:goPage('/history/diagnosis_history.do')">진료 히스토리</a></li> -->
<!-- 						<li><a href="javascript:goPage('/history/cooperation_history.do')">협진 히스토리</a></li> -->
<!-- 					</ul> -->
				</li>

			</div>
<!-- 				<li class="dropdown"> -->
<!-- 					<a class="dropdown-toggle count-info" href="javascript:openchat()"> -->

<!-- 						 <span class="" style="margin-top: 2px; width: 90px; margin-left: -3px; font-size: 1.0em; "> -->
<!-- 						 <i class="fa fa-wechat" style="font-size: 1.0em;"></i>채팅</span> -->
<!-- 					</a> -->
<!-- 				</li> -->
				<li class="dropdown" style="margin-left: 91px;">
				 <a class="dropdown-toggle count-info" href="javascript:OpenWindow('/ddit/doctorChart/chartform.do','조직도',1100,700);"
				 style=" padding-right: 0px;">

				  <span class="" style="margin-top: 2px; width: 90px; margin-left: -3px;">
				  <i class="fa fa-sitemap" aria-hidden="true" style="font-size: 1.2em;"></i>
				  <p style="display: inline;font-size: 11px;">조직도</p></span>
				</a>
				</li>


				<li class="dropdown">
				<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#" style="padding-left: 0px;">

				<c:if test="${count > 0  }" >
					 <span class="label label-primary" id="notinum" style="margin-right: 30px;">${count } </span>
				 </c:if>
				<c:if test="${count == 0}" >
					 <span class="label label-primary" id="notinum" style="display: none">${count } </span>
				 </c:if>
				 <span class="" style="margin-top: 2px; width: 90px; margin-left: -3px;" >
				 <i class="fa fa-bell" style="font-size: 1.2em;"></i>
				 <p style="display: inline;font-size: 11px;">알림</p></span>




				</a>
					<ul class="dropdown-menu dropdown-alerts " id="notimenu">

					<c:forEach items="${noti }" var="i">

					<li class="dropdown-divider"></li>
						<li>
						<a onclick="window.open('<%=request.getContextPath()%>/cooperation/cooperationRequest.do?notiNo=${i.notiNo}','','width=800, height=700, left=500, top=100');">

								<div><img alt="중요도" src="/ddit/resources/img/siren.png" style="width: 15px; height: 15px;">
									&nbsp;&nbsp;
									<span  style="font-weight: bold;">${i.reqdId }</span>님의 협진요청입니다<br> 진단명 :
									<span  style="font-weight: bold;">${i.coDisease }</span>
									<span  class="float-right text-muted small">${i.ago }</span>
								</div>
					</a></li>


					</c:forEach>
						<li class="dropdown-divider"></li>
						<li>
							<div class="text-center link-block">
								<a href="notifications.html" class="dropdown-item"> <strong>전체 협진 요청조회</strong> <i class="fa fa-angle-right"></i>
								</a>
							</div>
						</li>
					</ul></li>


				<!-- 상태변경 -->
				<li class="dropdown hoverdown" style="margin-left: 0px; margin-top: -10px;"><a >

						<div class="profile-image" style="width: 0px; margin-right: 65px;">

							<img id="profileborder" alt="프로필" src="<%=request.getContextPath()%>/doctor/getPic?dId=${doctorLogin.dId}" style="width: 60px; height: 60px; border: 2px solid rgb(35, 175, 67);" class="rounded-circle circle-border m-b-md">
							<i id="profile"
							class="fa fa-circle" style="width: 25px; height: 25px; font-size: 20px; position: absolute; top: 65px; color: rgb(220, 53, 69); left: 46px;"></i>

						</div>
				</a>
					<ul class="dropdown-menu dropdown-alerts" style="width: 150px; position: absolute; top: 86px; left: 0px; will-change: top, left;" x-placement="bottom-start">
						<li><a onclick="status('1')"> <i class="fa fa-circle" style="width: 15px; height: 15px; color: #23af43; font-size: 15px;"></i>
								<h5 class="profile_change" style="float: right;">진료중</h5>
						</a></li>

						<li class="dropdown-divider"></li>
						<li><a onclick="status('2')"> <i class="fa fa-circle" style="width: 15px; height: 15px; color: #dc3545; font-size: 15px;"></i>
								<h5 class="profile_change" style="float: right;">수술중</h5>
						</a></li>
						<li class="dropdown-divider"></li>
						<li><a onclick="status('3')"> <i class="fa fa-circle" style="width: 15px; height: 15px; color: #1c84c6; font-size: 15px;"></i>
								<h5 class="profile_change" style="float: right;">자리비움</h5>
						</a></li>
						<li class="dropdown-divider"></li>
						<li>
						<a onclick="window.open('<%=request.getContextPath()%>/myinfo/main.do?dId=${doctorLogin.dId}','','width=800, height=700, left=500, top=100');">
						<i class="fa fa-vcard" style="width: 15px; height: 15px; font-size: 17px;"></i>
								<h5 class="profile_change" style="float: right;">내 정보</h5>
						</a></li>
						<li class="dropdown-divider"></li>
						<li><a onclick="status('0')">
								<div>
									&nbsp;<img alt="로그아웃" src="/ddit/resources/img/logout.png" style="width: 17px; height: 17px;">
									<h5 class="profile_change" style="float: right;">로그아웃</h5>
								</div>
						</a></li>
					</ul></li>
			</ul>

		</nav>
	</div>
	<script type="text/javascript">

	var flag = null;
	$(document).on('click','.gopage' ,function(){
		if(flag!=null){
			flag.removeClass('active');
		}
		a = $(this).find('.dropdownspan').addClass('active');
		 flag = a;
	})

	$('.homeee').click(function(){
		if(flag!=null){
			flag.removeClass('active');
		}

	});

	</script>