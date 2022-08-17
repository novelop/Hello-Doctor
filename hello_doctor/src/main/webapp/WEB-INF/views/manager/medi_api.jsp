<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button class="btn btn-success update_btn" onclick="show()" style="max-height: 30px;">약품정보
					업데이트</button>
</body>
<script>
function show(){
	
	var xhr = new XMLHttpRequest();
	var url = 'http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService02/getDrugPrdtPrmsnInq02'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'11LiiJtZaLcAzEiITobhOrwAnEyD5DtIx42DklIMYnXw2jtn11ib8i2qiuCJ7A5nsXd7HhOBMg7zayIx1XvMSg%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('3'); /**/
	queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('xml'); /**/
	queryParams += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('entp_name') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('induty') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('prdlst_Stdr_code') + '=' + encodeURIComponent('2014'); /**/
	queryParams += '&' + encodeURIComponent('spclty_pblc') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('prduct_prmisn_no') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('order') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('entp_seq') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('entp_no') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent(''); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
	    }
	};

	xhr.send('');
	
	
	
}

</script>
</html>