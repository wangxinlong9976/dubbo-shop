<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resource/bootstrap/css/bootstrap.min.css">

<style type="text/css">
	body{
		height:100%;
	}
</style>
</head>
<body>

<form class="form form-group" id="loginForm"  method="post">
	<div class="modal-dialog" style="margin-top: 13%;">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="text-left modal-title" id="loginTitle">商城后台登陆</h3>
			</div>
			<div class="modal-body">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="请输入用户名" autocomplete="off" name="username" id="" value="${username}"/>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="请输入密码" autocomplete="off" name="password" id="" value="${password}"/>
					</div>
					<div class="row form-ground checkbox">
						<p>
							 <span id="error" class="text-danger" style="float:left;margin-left:20px;width:310px"></span>		
	 						 <div class="form-group form-check ml-5 ">
							    <input type="checkbox" class="form-check-input" value="1" id="memoryCheck" name="memoryCheck">
							    <label class="form-check-label" for="exampleCheck1">记住密码</label>
							  </div>		
 						</p>
					</div>
					<div class="row form-ground">
						<p>
							
							<!-- <span style="float:right;margin-right:0px">没有账号?去<a href="/user/toRegister" class="text-primary">注册</a>一个</span> -->
						</p>
					</div>
			</div>
			<div class="modal-body loginBtnGroup">
				<div class="form-group">
					<input type="button" class="btn btn-primary form-control" id="loginBtn" value="登陆" style="margin-top:-30px"/>
				</div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="/resource/bootstrap/jquery.min.1.12.4.js"></script>
<script type="text/javascript" src="/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		$.post("/login",$('#loginForm').serialize(),function(obj){
			alert(JSON.stringify(obj));
			if(!obj.result){
				$('#error').html(obj.message);
			}else{
				location="/";
			}
		},"json");
	});
});
</script>
</body>
</html>