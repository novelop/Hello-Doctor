<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<style>

#durgTable th:nth-child(2){  width: 60%; text-align: left;}
#durgTable td:nth-child(2){  text-align: left;}
#durgTable th:nth-child(3){  width: 12%;}
#durgTable th:nth-child(4){  width: 12%;}
#durgTable th:nth-child(5){  width: 12%;}

#myDrugList th:nth-child(2){  width: 60%; text-align: left;}
#myDrugList td:nth-child(2){  text-align: left;}
#myDrugList th:nth-child(3){  width: 12%;}
#myDrugList th:nth-child(4){  width: 12%;}
#myDrugList th:nth-child(5){  width: 12%;}
.note-toolbar{
position: revert;} 
.note-editable{
width: 1000px;
}
</style>

<script type="text/x-handlebars-template"  id="drug-list-template" >

<table id="durgTable" class="table" style="width: 90%;margin-left: 25px;text-align: center;">
		<thead>
			<tr>
				<th></th>
				<th>추천약품명</th>
				<th>1회급여량</th>
				<th>하루 투약 횟수</th>
				<th>투약일</th>
			</tr>
	   </thead>
	   <tbody>

  {{#each .}}
	<tr>
		<td></td>
		<td>{{cureName}}</td>
		<td>{{pQuantity}}</td>
		<td>{{pAday}}</td>
		<td>{{pDays}}</td>
		<td> <a id="append_a" onclick="apendtr(this)"
				<i style="margin-right: 6px; font-size: 1.2em;" class="fa fa-plus-circle"></i>
			 </a>
		</td>
    </tr>
  {{/each}}

	  </tbody>
</table>
</script>

<script>

window.onload = function() {
	
	$('#the_iframe').attr("onload", "");
	
	
	summernote_go($('#content'), '<%=request.getContextPath()%>');



	var contextPath = "";

	function summernote_go(target, context) {
		contextPath = context;
		target.summernote({
			placeholder:'여기에 내용을 적으세요.',
			lang:'ko-KR',
			height:140,
			width:960,
			disableResizeEditor: true,
			callbacks:{
				onImageUpload : function(files, editor, welEditable) {
					for(var file of files){
						//alert(file.name);

						if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
							alert("JPG 이미지형식만 가능합니다.");
							return;
						}
						console.log(file.size)
						if(file.size > 1024*1024*5){
							alert("이미지는 5MB 미만입니다.");
							return;
						}

					}


					for (var file of files) {
						console.log(this);
						sendFile(file,this);
					}
				},
				onMediaDelete : function(target) {
					//alert(target[0].src);
					deleteFile(target[0].src);
				}
			}
		});
	}

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append("file", file);
		$.ajax({
			url: '<%=request.getContextPath()%>/uploadImg.do',
	    	data: form_data,
	    	type: "POST",
	    	contentType: false,
	    	entype: 'mutipart/form-data',
	    	processData: false,
	    	success: function(img_url) {
	    		 var image = $('<img>').attr({  src: img_url,
	    			  							style: "width : 50%;"});
                 $(el).summernote("insertNode", image[0]);

	    	},
	    	error:function(){

	    		alert(file.name+" 업로드에 실패했습니다.");
	    	}
		});
	}

	function deleteFile(src){
		var splitSrc = src.split("=");
		var fileName = splitSrc[splitSrc.length - 1];

		var fileData = {fileName:fileName};

		$.ajax({
			url: '<%=request.getContextPath()%>/deleteImg.do',
			data: JSON.stringify(fileData),
			type: "post",
			contentType:"application/json",
	    	success: function(res) {
	    		cosole.log(res);
	    	},
	    	error:function(){
	    		alert("이미지 삭제가 불가합니다.");
	    	}
		});
	}



}
function calcHeight(){

	//find the height of the internal page

	var the_height=

	document.getElementById('the_iframe').contentWindow.

	document.body.scrollHeight;



	//change the height of the iframe

	document.getElementById('the_iframe').height = the_height;



	document.getElementById('the_iframe').scrolling = "no";

	document.getElementById('the_iframe').style.overflow = "hidden";

	}

if($('#myDrugList >tbody tr').length == 0 ){
 	$('#myDrugList >tbody').append("<tr id='deftr'><td colspan='4' style='color: gray;'>처방내역을 추가하세요.</td></tr>")

}

function regist_go() {

	var deftr = document.getElementById("deftr");
	
	var form = document.registForm;
	if (form.oTitle.value == "") {
		alert("오더세트명을 입력해주세요.");
		return;
	}
	if (form.oDname.value == "") {
		alert("주상병을 입력해주세요.");
		return;
	}
	if (form.oTarget.options[form.oTarget.selectedIndex].text == "선택") {
		alert("급여대상을 선택해주세요.");
		return;
	}
	if(deftr!=null && deftr){
		alert("처방내역을 추가해주세요.");
		return;
	}

	if (form.oCaution.value == 0) {
		alert("주의사항을 입력해주세요.");
		return;
	}
	if (form.oResult.value == 0) {
		alert("결과를 입력해주세요.");
		return;
	}

	form.submit();
}



$('.typeahead_1').typeahead({
 autoSelect: true,
 minLength: 2,
 delay: 0,
source : function(word, process) { //source: 입력시 보일 목록
	var text = {"deKo": word};
     $.ajax({
           url :"<%=request.getContextPath()%>/medi/searchdisease"
         , type : "POST"
         , dataType: "JSON"
         , data : 	JSON.stringify(text)// 검색 키워드
         , contentType : 'application/json'
         , success : function(response){ 	// 성공
        	return process(response);

         }
         ,error : function(){ //실패
             alert("자동완성 실패");
         }
     });
 }

});
$('.typeahead_2').typeahead({
 autoSelect: true,
minLength: 2,
delay: 0,
source : function(word, process) { //source: 입력시 보일 목록
	var text = {"meName": word};
     $.ajax({
           url :"<%=request.getContextPath()%>/medi/searchmedicine"
         , type : "POST"
         , dataType: "JSON"
         , data : 	JSON.stringify(text)// 검색 키워드
         , contentType : 'application/json'
         , success : function(response){ 	// 성공
        	return process(response);

         }
         ,error : function(){ //실패
             alert("자동완성 실패");
         }
     });
 }

});



//regist
function drug_list(){
	var keyword = $('#keyword').val();
	var data = {
			"keyword":keyword
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/orderset/drugList",
		type:'post',
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			var source = $('#drug-list-template').html();
			var template = Handlebars.compile(source);
			var html = template(data);
			$('#durgTable').remove();
			$('#drug_list').after(html);
			
			document.body.scrollIntoView(true);         
			parent.document.all.the_iframe.height = document.body.scrollHeight;
			
			if($('#durgTable >tbody tr').length == 0 ){
				 $('#durgTable').append("<tr><td colspan='4' style='color: gray;'>해당 상병명에 관한 추천약품이 존재하지 않습니다.</td></tr>")

			}
		},
		error:function(error){
			alert('실패했습니다.');
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function drugcheck(rname){
	var mydrugs=$('#myDrugList >tbody').find("tr");


	for(var i=0; i < mydrugs.length ; i++){
		var mydname = mydrugs.eq(i).find("td").eq(0).text();
		console.log("mydname : " + mydname);
		if(mydname == rname){
			alert("이미 추가한 약품입니다.");
			return false;
		}

	}


}



function apendtr(a) {
	var rname = $(a).parents("tr").find("td").eq(1).text();
	var mydrugs=$('#myDrugList >tbody').find("tr");


	
	for(var i=0; i < mydrugs.length ; i++){
		var mydname = mydrugs.eq(i).find("td").eq(1).text();
		console.log("mydname : " + mydname);
		if(mydname == rname){
			alert("이미 추가한 약품입니다.");
			return false;
		}

	}




	var tds = $(a).parents("tr").find("td");
	var c=[];

	for(var i=0 ; i < tds.length - 1 ; i++){
		c[i] = tds.eq(i+1).text();
	}

	var deftr = document.getElementById("deftr");

	if(deftr!=null && deftr){
			deftr.remove();
		}

	$('#myDrugList >tbody')
			.append(
					"<tr id='append_tr'><td></td><td><input type='hidden' name='oDrug' value='"+c[0]+ "' >"
							+ c[0]
							+ "</td><td><input type='number' name='quantity' value='"+c[1]+ "' >"
							+ "</td><td><input type='number' name='dgAday' value='"+c[2]+ "' >"
							+ "</td><td><input type='number' name='dgDays' value='"+c[3]+ "' >"
							+ "</td><td onclick='removetr(this)'><a><i style='margin-right: 6px; font-size: 1.2em;' class='fa fa-minus-circle'></i></a></td></tr>")
							
							document.body.scrollIntoView(true);         
							parent.document.all.the_iframe.height = document.body.scrollHeight;

}

function removetr(aa) {
	$(aa).parents("tr").remove();
	if($('#myDrugList >tbody tr').length == 0 ){
			 $('#myDrugList >tbody').append("<tr id='deftr'><td colspan='4' style='color: gray;'>처방내역을 추가하세요.</td></tr>")

		 }
}

function appendDrug(){
	   var meName = $(".typeahead_2").val();
		
	   
	   var mydrugs=$('#myDrugList >tbody').find("tr");
		

		for(var i=0; i < mydrugs.length ; i++){
			var mydname = mydrugs.eq(i).find("td").eq(1).text();
			console.log("mydname : " + mydname);
			if(mydname == meName){
				alert("이미 추가한 약품입니다.");
				return false;
			}

		}

		var deftr = document.getElementById("deftr");

		if(deftr!=null && deftr){
				deftr.remove();
			}

		$('#myDrugList >tbody')
				.append(
						"<tr id='append_tr'><td></td><td><input type='hidden' name='oDrug' value='"+meName+ "' >"
								+ meName
								+ "</td><td><input type='number' name='quantity' value='"+0+ "' >"
								+ "</td><td><input type='number' name='dgAday' value='"+0+ "' >"
								+ "</td><td><input type='number' name='dgDays' value='"+0+ "' >"
								+ "</td><td onclick='removetr(this)'><a><i style='margin-right: 6px; font-size: 1.2em;' class='fa fa-minus-circle'></i></a></td></tr>")
		
		document.body.scrollIntoView(true);         
		parent.document.all.the_iframe.height = document.body.scrollHeight;
	
	}
	
function medicheck(){
	
	var meName = $(".typeahead_2").val();
	
		var data = {
				"meName":meName
		}

	$.ajax({
		url:"<%=request.getContextPath()%>/orderset/medicineCheck",
		type:'post',
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
		
				appendDrug()

		},
		error:function(error){
			alert('해당 약품이 존재하지 않습니다..');
			
		}
	});
	
	return flag;
	
	
}	
	
	
</script>

