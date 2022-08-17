<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
<!--                         <div class="dropdown profile-element"> -->
<!--                         	<a href="indexPage.do"> -->
<%-- 	                            <img alt="image" class="rounded-circle" src="<%=request.getContextPath()%>/resources/css/img/logo2.png" width="70px" height="70px"/> --%>
<!--                         	</a> -->
<!--                         </div> -->
                        <div class="logo-element">
                            <img src="<%=request.getContextPath()%>/resources/img/logo2.png" width="50px" height="50px" onclick="location.href='/ddit/index.do'">
<!--                         	<p style="font-weight: bold;display: inline;">Hello Doctor </p> -->
                        </div>
                    </li>
                    <li>
                        <a href="javascript:goPage('/main/index.do')"><i class="fa fa-home" style="font-size: 1.3em;"></i> <span class="nav-label">홈</span> </a>
                    </li>
                    <li>
                        <a href="javascript:goPage('/medi/chart.do')"><i class="fa fa-stethoscope" style="font-size: 1.3em;"></i> <span class="nav-label">진료</span></a>
                    </li>
                    <li>
                        <a onclick="goPage('/colist/coworklist.do')"><i class="fa fa-group" style="font-size: 1.3em;"></i> <span class="nav-label">협진</span><span class="fa arrow" ></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="javascript:goPage('/cooperation/coopermain.do')">My협진</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:goPage('/scheduler/main.do')"><i class="fa fa-calendar" style="font-size: 1.3em;"></i> <span class="nav-label">스케줄러</span></a>
                    </li>
                    <li>
                        <a href="javascript:goPage('/case/main.do')"><img src="https://img.icons8.com/external-outline-design-circle/66/000000/external-discussion-activities-outline-design-circle.png" style="width:25px; height: 25px"/><span class="nav-label">Case Discussion</span></a>
                    </li>
                    <li>
                        <a onclick="goPage('/orderset/main.do')"><i class="fa fa-flask" style="font-size: 1.3em;"></i> <span class="nav-label">오더세트</span> <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                        	<li><a href="javascript:goPage('/orderset/orderset_list.do')">오더세트</a>
                        	<li><a href="javascript:goPage('/orderset/myorderset_list.do')">My오더세트</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:goPage('/history/main.do')"><i class="fa fa-user-circle" style="font-size: 1.3em;"></i> <span class="nav-label">마이페이지</span></a>
                    </li>
                </ul>

            </div>
        </nav>