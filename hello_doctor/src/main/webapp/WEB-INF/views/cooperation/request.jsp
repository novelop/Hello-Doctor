<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>협진요청</title>
<link href="css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<style>
.form-text{
border:1px solid lightgray;
border-radius: 10px;
 padding : 8px;
 display: block;
 height: 250px;
 overflow:auto;
 padding-left: 20px;
}

.ibox-title{
text-align:center;
padding:10px;

}

.buttons{
text-align:center;
}

.hr-line-dashed{
margin:5px;
}

.ibox-content{
padding-left:20px;
}
.form-group {
    margin-bottom: -1rem;
}
.doctors{
	background-color : #FCF8E8; 
	border-radius: 10px;
	padding : 8px;
 	display: block;
 	height: 100px;
 	overflow:auto;
}
.form-text_modal{
 border:1px solid lightgray;
 border-radius: 10px;
 display: block;
 height: 120px;
 overflow:auto;
 padding-left: 3px;
}



</style>
</head>

<body>
                    <div class="ibox ">
                        <div class="ibox-title">
                            <h3 style="padding-left: 100px;">노혜지 님의 협진요청입니다.<img alt="중요도" src="<%=request.getContextPath()%>/resources/img/siren.png" style="width:20px; height:20px;"><span style="float: right; font-size: 0.8em;">2022-07-04 16:57</span></h3>
                            <div class="buttons" >
										<!-- <button type="button" class="btn btn-w-m btn-success">수락</button>&nbsp; -->
	                                    <button class="btn btn-success  dim" type="button">수락</button>
	                                    <!--<button type="button" class="btn btn-w-m btn-warning" data-toggle="modal" data-target="#myModal5" >거절</button> -->
	                                    <button class="btn btn-warning  dim" type="button">거절</button>
										<button class="btn btn-default  dim " type="button">보류</button>
	                         </div>         
                        </div>
                        <div class="ibox-content" >

                                <div class="form-group row"><label class="col-sm-2 col-form-label">환자명</label>
                                	<h4>김민수</h4>                        
                                </div>
                               <hr>
								<div class="form-group row"><label class="col-sm-2 col-form-label">증상</label>
                                	<h4>급성폐렴</h4>                        
                                </div>
                                <hr>

                                <div class="form-group row"><label class="col-sm-3 col-form-label">주치의소견</label><br>
                                </div>
                                <br>
                                
                                
                                <div class="form-text" >										
									
									 <h4>안녕하세요. 급성폐렴환자입니다. 협진요청합니다.</h4>		
									<img alt="병" src="<%=request.getContextPath()%>/resources/img/lungs.jpg" style="width:200px; height:200px;">						
							
								</div>

                                <hr>

                                <div class="form-group row"><h4>&emsp;&nbsp;협진요청 받은 의료진</h4>
								</div>
								<br>
								

								<div class="doctors" style="width:640px;">
									<div style="width:70px; height:50px; float:left; text-align:center;">
									<img alt="프로필" src="<%=request.getContextPath()%>/resources/img/user.png" style="width:40px; height:40px;">
									<h5>강현수 <br>호흡기내과</h5>
									</div>
									&nbsp;
									 <div style="width:70px; height:50px; float:left; text-align:center;">
									<img alt="프로필" src="<%=request.getContextPath()%>/resources/img/user.png" style="width:40px; height:40px;">
									<h5>조현영 <br>호흡기내과</h5>
									</div>
									<div style="width:70px; height:50px; float:left; text-align:center;">
									<img alt="프로필" src="<%=request.getContextPath()%>/resources/img/user.png" style="width:40px; height:40px;">
									<h5>이의찬 <br>호흡기내과</h5>
									</div>
									&nbsp;
									 <div style="width:70px; height:50px; float:left; text-align:center;">
									<img alt="프로필" src="<%=request.getContextPath()%>/resources/img/user.png" style="width:40px; height:40px;">
									<h5>이의찬 <br>호흡기내과</h5>
									</div>
								</div>
											
                                </div>

                       </div>

	<div class="modal inmodal fade" id="myModal5" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<h3 class="font-bold" style="padding-left: 25px; padding-top: 20px">
					<i class="fa fa-pencil-square-o"></i>&nbsp;협진거절 사유를 입력해주세요
				</h3>
				<div class="modal-body">
					<div class="ibox-content">
						<div class="form-text_modal">
							<h4>일정이 너무 많아서 협진거절합니다. 죄송합니다.</h4>
							<!-- 			<textarea class="form-control" name="content" id="content" rows="5" placeholder=""></textarea>						 -->
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-w-m btn-success">전송</button>
					&nbsp;
					<button type="button" class="btn btn-w-m btn-default"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


	<!-- SUMMERNOTE -->
    <script src="<%=request.getContextPath() %>/resources/js/plugins/summernote/summernote-bs4.js"></script>
    <script>
 

  	function request_deny(){
			window.open("http://localhost/ddit/cooperation/request_deny.do", "","width=600, height=400, left=500, top=300")
		}

//   	function request_deny(){
// 			window.open("http://localhost/ddit/cooperation/request_deny.do", "","width=600, height=400, left=500, top=300")
// 		}

  	</script>
</body>
</html>