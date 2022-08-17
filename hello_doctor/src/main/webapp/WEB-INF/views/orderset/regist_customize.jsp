<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">


<link href="<%=request.getContextPath() %>/resources/css/plugins/dualListbox/bootstrap-duallistbox.min.css" rel="stylesheet">

<link href="<%=request.getContextPath() %>/resources/css/animate.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<style>
.info{
	color : #ffffff00;
}
.bootstrap-duallistbox-container{
	margin-top: -18px;
}
</style>
</head>
<body>
	<div class="row">
					<div class="col-lg-12">
						<div class="">
							<div class="ibox-title">
								<h3>처방내역 커스터마이징</h3>
							</div>
							<div class="ibox-content" style="height: 380px;">
								<p>My 오더세트에 등록할 처방내역을 선택해주세요.</p>
					<div
						style="display: inline-block; width: 51%; margin-left: 11px; font-size: 14px; font-weight: 600;">처방
						내역</div>
					<div
						style="display: inline-block; width: 30%; font-size: 14px; font-weight: 600;">추가할
						처방 내역</div>
					<select id="selectDrug" class="form-control dual_select" multiple="" style="display: none;">
									<c:forEach items="${drugList}" var="drug">
								
										<option >${drug.oDrug}</option>
									</c:forEach>
									</select>
								<div style="text-align: center; margin-top: 22px;">
									<button type="button" class="btn btn-success" onclick="drugcheck()">My 오더세트에 추가하기</button>
								</div>
							</div>
						</div>
					</div>

				</div>

<form role="form" method="post" action="go_myorderset_registForm.do" name="registForm">
<table id="drugfrom" style="display: none;">
	<c:forEach items="${drugList}" var="drug">
		<tr>
			<td>${drug.oDrug}<input type="hidden" name="oDrug" value="${drug.oDrug}"></td>
			<td><input type="hidden" name="quantity" value="${drug.quantity}"></td>
			<td><input type="hidden" name="dgAday" value="${drug.dgAday}"></td>
			<td><input type="hidden" name="dgDays" value="${drug.dgDays}"></td>
		</tr>
	</c:forEach>
</table>
</form>
	<!-- Mainly scripts -->
    <script src="<%=request.getContextPath() %>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%=request.getContextPath() %>/resources/js/inspinia.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/plugins/pace/pace.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>




    <!-- Dual Listbox -->
    <script src="<%=request.getContextPath() %>/resources/js/plugins/dualListbox/jquery.bootstrap-duallistbox.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/open.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script>
    $(document).ready(function(){
    	
       var demo= $('.dual_select').bootstrapDualListbox({
            selectorMinimalHeight: 160
        });
       
       $('.filter').attr("placeholder","약품을 입력하세요.")

    });
    var rname = null;
    $("#selectDrug").change(function(){
    	 rname=$('#selectDrug').val();
		console.log(rname.length)
		});

    function drugcheck(){
    	console.log("rname" + rname)
    	if(rname==null || rname.length==0){
    		alert("처방내역을 선택해주세요.")
			return false;
		}
    	var mydrugs=$('#drugfrom').find("tr");

    	var	tr=[];
    	cnt = 0;
    	for(var i=0; i < mydrugs.length ; i++){
    		flag = false;
    		var mydname = mydrugs.eq(i);
    		console.log("mydname : " + mydname);
    		for(var j=0; j<rname.length; j++){
    			r = rname[j];
    			m= mydname.find("td").eq(0).text()
    			console.log(r)
    			console.log(m)
    			if(mydname.find("td").eq(0).text() == r){
    				flag = true;
    			}

    		}
			console.log(flag);
    		if(!flag){
    			tr[cnt++] = mydname.remove();
    		}
    	}

    	 swal({
	            title: "My오더세트 추가",
	            text: "선택한 처방내역을 가져가시겠습니까?",
	            type: "warning",
	            showCancelButton: true,
	            confirmButtonColor: "#DD6B55",
	            confirmButtonText: "확인",
	            closeOnConfirm: false,
	            closeOnCancel : true
	        }, function (isConfirm) {
		        if (isConfirm) {
		        	swal("", "My오더세트 등록페이지로 이동합니다.", "success");
		            setTimeout(function(){

		            	window.opener.name = "parentPage"; // 부모창의 이름 설정
		            	    document.registForm.target = "parentPage"; // 타켓을 부모창으로 설정
		            	    document.registForm.submit();

		            	    self.close();

		            },1000);
				}else{
					if(tr==null){
						return false;
					}
					for(var i=0; i < tr.length; i++){
						$('#drugfrom').append(tr[i]);
					}

				}


	        });






    }


    </script>
</body>
</html>