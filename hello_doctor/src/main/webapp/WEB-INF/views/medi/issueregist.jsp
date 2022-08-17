<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Basic Form</title>


<style type="text/css">
	.ibox{
		width: 500px;
		height: 400px;
		margin: 0 auto;
		margin-top: 50px;
	}

	.ibox-title{
	 padding: 0;
	 padding-top: 5px;

    margin-top: 20px;


	}
	h4{
		background-color: #afedfa;
		text-align: center;
	}
	label{
		font-size: 15px;
		margin-right:5px;
	}
	#checkbox{
		margin-left:8px;
	}
	#issuelabel{
		margin-right: 25px;
		font-size: 14px;
		font-weight: bold;
	}
</style>
</head>

<body>
<div class="ibox ">
                        <div class="ibox-content">
                         <div class="bg-primary p-xs b-r-xl" style="float: left;">특이사항 등록</div>
                        <div style="text-align: right"> <div class="i-checks"><label id="issuelabel">특이사항 없음<input type="checkbox" id="checkbox"> </label>
                         		<button class="btn btn-success" type="button" onclick="submit()">
							<i class="fa fa-sign-out" >진료완료</i>
								</button>
								</div>
                                <div class="form-group row" style="display:block; margin-right: 10px" >
                                    <div class="col-lg-offset-2">


                                    </div>
                                </div>
                                </div>
 <textarea name="user-message" id="user-message" class="form-control" cols="20" rows="10" placeholder="특이사항을 입력해주세요." style="resize: none; border:1px solid gray"></textarea>
                        </div>
                    </div>

<script type="text/javascript">
function submit(){
	var text = $('#user-message').val();
	if($('#checkbox')[0].checked){
			window.opener.regist();
			window.close();
			return;
	}

var str = "<input type='hidden' name='issue'  value='"+text+"' >";

$('#hiddendata', opener.document).append(str);
window.opener.regist();
window.close();
}
</script>
</body>
</html>
