<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if('${from}' == 'regist'){

	opener.location.reload();
	window.close();

	}

</script>
 <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">

</head>
<body>
<div class="row">
                <div class="col-lg-12">
                    <div class="ibox ">
                        <div class="ibox-title">
                            <h5>환자 등록</h5>
                        </div>
                        <div class="ibox-content">
                            <form method="get" action="patientRegist">
                            <input type="submit" value="등록">
                                <div class="form-group  row"><label class="col-sm-2 col-form-label">환자명</label>

                                    <div class="col-sm-10"><input type="text" class="form-control" name="pName"></div>
                                </div>
                                <div class="form-group  row"><label class="col-sm-2 col-form-label">성별</label>

                                    <div class="col-sm-10"><input type="text" class="form-control" name="pSex"></div>
                                </div>
                                <div class="form-group  row"><label class="col-sm-2 col-form-label">주민번호</label>

                                    <div class="col-sm-10"><input type="text" class="form-control" name="pRnum" placeholder="123456-1234567"></div>
                                </div>
                                <div class="form-group  row"><label class="col-sm-2 col-form-label">전화번호</label>

                                    <div class="col-sm-10"><input type="text" class="form-control" name="pTel" placeholder="010-1234-5678"></div>
                                </div>
                                <div class="form-group  row"><label class="col-sm-2 col-form-label">주소</label>

                                    <div class="col-sm-10"><input type="text" class="form-control" name="pAddress"></div>
                                </div>
                                <div class="hr-line-dashed"></div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>





 <!-- Mainly scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%=request.getContextPath()%>/resources/js/inspinia.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/resources/js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>
</body>
</html>