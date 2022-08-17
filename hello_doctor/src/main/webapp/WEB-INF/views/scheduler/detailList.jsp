<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<h4 class="col-md-8" style="width: 92%; display: inline-block;">예약 상세</h4>

						
						<div class="card-tools" style="display: inline-block;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button"
								style="border: none;background: none;"
								onclick="window.close();">
								<i class="fa fa-times-rectangle" aria-hidden="true" style="color: #3E5476;
    font-size: 23px;
    vertical-align: -8px;"></i>
							</button>

						</div>
					</div><!--end card-header  -->
					<div class="card-body pad" style="min-height: 584px; height: auto;">
						<div class="ibox-content">

                            <table class="table table-bordered">
                                <thead>
                                <tr >
                                    <th>담당의</th>
                                    <th>협진명</th>
                                    <th>의료행위</th>
                                    <th>예약날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr onclick="location.href='detail.do'" style="cursor: pointer;">
                                    <td>노혜지 / 흉부외과</td>
                                    <td>이정규(간이식)</td>
                                    <td>외래진료</td>
                                    <td>2022-07-11 13:00</td>
                                </tr>
                                <tr onclick="location.href='detail.do'" style="cursor: pointer;">
                                    <td>노혜지 / 흉부외과</td>
                                    <td>이정규(간이식)</td>
                                    <td>외래진료</td>
                                    <td>2022-07-11 13:00</td>
                                </tr>
                                <tr onclick="location.href='detail.do'" style="cursor: pointer;">
                                    <td>노혜지 / 흉부외과</td>
                                    <td>이정규(간이식)</td>
                                    <td>외래진료</td>
                                    <td>2022-07-11 13:00</td>
                                </tr>
                                <tr onclick="location.href='detail.do'" style="cursor: pointer;">
                                    <td>노혜지 / 흉부외과</td>
                                    <td>이정규(간이식)</td>
                                    <td>외래진료</td>
                                    <td>2022-07-11 13:00</td>
                                </tr>
                                <tr onclick="location.href='detail.do'" style="cursor: pointer;">
                                    <td>노혜지 / 흉부외과</td>
                                    <td>이정규(간이식)</td>
                                    <td>외래진료</td>
                                    <td>2022-07-11 13:00</td>
                                </tr>
                               
                                </tbody>
                            </table>

                        </div>
						
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
        </script>

</body>
</html>