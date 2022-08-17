<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.ibox-content{
width: 700px;
}
#name{
    width: 20%;
    display: inline
}
.namespan{
	font-size: 15px;
	margin: 15px;

}
.registnum{
	width: 20%;
	display: inline
}
.ibox-title{
	width: 100%;

}
#bar{
	font-size: 15px;
	margin: 5px;
}

    hr{
        height: 1px;
        background-color: #ccc;
        border: none;
    }

</style>
</head>
<body>
<div class="ibox">


                        <div class="ibox-content">
                            <div class="row">

                          <div class="ibox-title">
                          <div id="patientinfo">
                          <span class="namespan" style="margin-left:70px;">이름</span><input type="text" value="이정규" class="form-control" id="name" disabled>
                          <span class="namespan">주민번호</span>
                          <input type="text" value="930718" class="form-control registnum"  disabled> <span id="bar">-</span>
                          <input type="text" value="1******" class="form-control registnum"  disabled>
                          </div>
                          </div>
                            </div>
                              <hr>
                            <div class="table-responsive">
                            <div><h2 style="float:left; margin-top:15px;">협진 이력</h2> <div style="float:right"><button type="button" class="btn btn-outline btn-info">이력 등록하기</button><button type="button" class="btn btn-outline btn-warning" style="margin:10px;">닫기</button> </div> </div>
                                <table class="table table-striped">
                                    <thead>
                                    <tr>

                                        <th></th>
                                        <th>병명 </th>
                                        <th>주치의 </th>
                                        <th>생성 날짜</th>
                                        <th>종료 날짜</th>
                                        <th>종료 사유</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input type="checkbox"  checked class="i-checks" name="input[]"></td>
                                        <td>당뇨병</td>
                                        <td>이익준</td>
                                        <td>2005-02-06</td>
                                        <td>2007-03-27</td>
                                        <td>치료중단</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" class="i-checks" name="input[]"></td>
                                        <td>천식</td>
                                        <td>최선미</td>
                                        <td>2008-07-18</td>
                                        <td>2010-10-10</td>
                                        <td>완치</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" class="i-checks" name="input[]"></td>
                                        <td>갑상선 저하증</td>
                                        <td>안정원</td>
                                        <td>2011-01-07</td>
                                        <td>2013-10-12</td>
                                        <td>완치</td>
                                    </tr>

                                    <tr>
                                        <td><input type="checkbox" class="i-checks" name="input[]"></td>
                                        <td>골다공증</td>
                                        <td>양석형</td>
                                        <td>2014-12-13</td>
                                        <td>2016-11-10</td>
                                        <td>치료중단</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
</body>
</html>