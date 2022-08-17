<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="bottomList" value="${dataMap.bottomList }"/>
<c:set var="major" value="${dataMap.major }"/>
<c:set var="top" value="${dataMap.top }"/>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

    <link href="<%=request.getContextPath()%>/resources/css/plugins/slick/slick.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/slick/slick-theme.css" rel="stylesheet">


<style>
.col-8 {
	max-width: 100%;
}

.img-responsive {
	width: 20px;
	height: 20px;
	object-fit: cover;
}

#pagediv {
	position: absolute;
	margin: -150px 0px 0px -200px;
	top: 108%;
	left: 57%;
	padding: 3px;
}

.contact-box {
	border-radius: 5%;
}

.slick-initialized .slick-slide {
	margin-right: 2%;
}

.slick-slide {
	margin: 0 30px;

}

.slick-list {
	margin: 0 -30px;

}

.slick-prev {
    z-index: 1;
}
p{
	margin-bottom: 0px;
}
hr{
	margin-bottom: 2px;
}


</style>

</head>
<body>

<!-- 	<div style="padding-top: 2%; margin-bottom: 2%;"> -->
<!-- 		<div class="col-sm-12" style="text-align: end;"> -->
<!-- 			<button type="button" class="btn btn-w-m btn-primary" onclick="subgoPage('/case/registForm')">의견공유</button> -->
<!-- 		</div> -->
<!-- 	</div> -->
<h3 style="margin-left: 10px; margin-top: 15px;">Case Discussion</h3>
		<hr style=" margin-top: 1px;"></hr>
	<div>
		<div class="row">
		<div class="col-sm-3">
				<label style="font-size: 18px; margin-top: 11px;">Hot issue</label>
			</div>
		<div class="col-sm-9" style="text-align: end; ">
			<button type="button" style="margin-right: 2%" class="btn btn-w-m btn-primary" onclick="subgoPage('/case/registForm')">의견공유</button>
		</div>
		</div>
		<div style="display: inline-block; width: 100%; margin-top: -27px;">
			<c:forEach items="${top }" var="top" begin="0" end="4" varStatus="status">
				<div style="float: left; width: 19%; margin-right: 1%; cursor: pointer;" onclick="subgoPage('/case/detail.do?from=list&disNo=${top.disNo}&dId=${doctorLogin.dId }')">
						<button class="btn btn-info btn-circle" style="transform : translateY(20px);  font-size: 15px;  font-weight: bold;  padding-top: 3px; ">${status.count }</button>
					<div class="contact-box" style="background: ; height: 90%" >
					<div>
						<h4 style="text-align: center; font-size: ; height: 50px; max-width: 100%; word-break : break-all;">
							<c:set var="title" value="${top.disTitle }"/>
<%-- 							${top.disTitle } --%>
							<strong>${fn:substring(title,0,60) }</strong>
						</h4>
						<p style="text-align: center; font-size: 12px; padding-top: 7%; word-break: break-all; height: 50px; overflow: hidden;">
							<strong>${top.disDName }</strong>
						</p>
						<table style="width: 100%">
							<tr>
								<td style="text-align: center">
									${top.maName }
								</td>
							</tr>
							<tr>
								<td style="text-align: center">
									${top.dName }
								</td>
							</tr>
							<tr>
								<td style="text-align: center">
									<i class="fa fa-calendar" style=""></i>
									<fmt:parseDate value="${top.disDate }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</table>
						<hr style="background-color: white;margin-top: 5px;margin-bottom: 5px;">
						<div class="row">
							<div class="col-sm-4" style="">
								<i class="fa fa-eye"></i>
								<h5 style="display: inline; margin-left: 7%;">
									${top.disCnt }
								</h5>
							</div>
							<div class="col-sm-4" style="">
								<i class="fa fa-comments-o"></i>
								<h5 style="display: inline; margin-left: 7%;">
									<fmt:parseNumber var="reply" value="${top.reply / 2 }" integerOnly="true"/>
									${reply }
								</h5>
							</div>
							<div class="col-sm-4" style="text-align: end;">
								<i class="fa fa-thumbs-o-up"></i>
								<h5 style="display: inline; margin-left: 7%;">
									<fmt:parseNumber var="recom" value="${top.recom / 2}" integerOnly="true"/>
									${recom }
								</h5>
							</div>
						</div>
					</div>
				</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="row" style="background: white; margin: 0px auto; padding-top: 2%;">
		<div class="col-sm-6">
			<label style="font-size: 1.2em;margin-left: 3%;">${doctorLogin.maName } 최신글</label>

		</div>
		<div class="col-sm-6" style="text-align: end;">
<!-- 			 <h5 style="margin-right: 1%;display: inline;margin-left: 81%;">전체보기</h5> -->
               <i class="fa fa-bars" style="display: inline;font-size: 16px; padding-right: 15px" onclick="subgoPage('/case/list.do')" type="button"></i>
		</div>
		<hr style="width: 95%">
			<div style="width: 95%; margin-left: 2.5%" id="accordion" >
				<c:if test="${!empty major }">
					<c:forEach items="${major }" var="major" varStatus="status">
						<div class="faq-item panel-body" >
                            <div class="row panel-group panel-default" >

                                <div class="col-md-6 panel">
									<a data-toggle="collapse"  data-parent="#accordion" href="#collapse${status.index }"  aria-expanded="false" class="collapsed clickable"><i class="fa fa-chevron-down" ></i></a>
									<a class="faq-question" style="font-size: 0.9em">${major.disDName }</a>

                                    <a class="faq-question" style="font-size: 1.2em" onclick="subgoPage('/case/detail.do?from=list&disNo=${major.disNo}&dId=${doctorLogin.dId }')">${major.disTitle }</a>

                                </div>
                                <div class="col-md-4">
                                	<br>
                                	<img class="rounded-circle" style="width:40px; height: 40px;" alt="image" src="<%=request.getContextPath()%>/doctor/getPic?dId=${major.dId }">
                                	<span class="">${major.maName}/${major.dName }</span><br>
                                </div>
                                <div class="col-md-2 text-right">
                                <br>
                                	<i class="fa fa-calendar" style=""></i>
                                    <fmt:parseDate value="${major.disDate }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/><br>

									<div><i class="fa fa-eye">${major.disCnt }</i>&nbsp;&nbsp;&nbsp;<i class="fa fa-comments-o"> ${major.reply }</i>&nbsp;&nbsp;&nbsp;<i class="fa fa-thumbs-o-up">${major.recom }</i></div>
                                </div>
                                <div id="collapse${status.index }" class="panel-collapse collapse in" data-parent="#accordion" style="max-height: 96px; overflow: hidden" >
                                     	<div class="panel-body">
												${major.disContent }
                                        </div>
                                   </div>
                            </div>
                        </div>

					</c:forEach>
				</c:if>

			</div>

	</div>
	<div style="height: 100px;"></div>
<br><br>

<script src="<%=request.getContextPath()%>/resources/js/plugins/slick/slick.min.js"></script>
<script>
        $(document).ready(function(){



            $('.slick_demo_2').slick({
                infinite: true,
                slidesToShow: 3,
                slidesToScroll: 1,
                centerMode: true,
                responsive: [
                    {
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3,
                            infinite: true,
                            dots: true
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });


        });


    </script>
	<script type="text/javascript">


     $(document).ready(function () {


    	 $('.collapsed').eq(0).click();
     });


	</script>
</body>
</html>