<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<base href="<?php echo (C("BASE")); ?>" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title> 登录</title>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: Georgia, serif;
	background: url(img/login-page-bg.jpg) top center no-repeat
		#c4c4c4;
	color: #3a3a3a;
}

.clear {
	clear: both;
}

form {
	width: 430px;
	margin: 170px auto 0;
}

legend {
	display: none;
}

fieldset {
	border: 0;
}

#login-form img {
	width: 120px;
	margin-left: 5px;
	vertical-align: middle;
}

#login-form p {
	height: 30px;
	padding: 5px 0;
}

label {
	width: 115px;
	text-align: right;
	float: left;
	margin: 0 10px 0 0;
	padding: 9px 0 0 0;
	font-size: 16px;
}

input {
	width: 220px;
	padding: 4px;
	margin: 0 0 10px 0;
	font-size: 18px;
	color: #3a3a3a;
	font-family: Georgia, serif;
}

input[name='vcode'] {
	width: 100px;
}

input[name='remember'] {
	width: 20px;
	margin: 0;
}

.button {
	background: url(img/button-bg.png) repeat-x top center;
	border: 1px solid #999;
	margin: 10px 40px;
	-moz-border-radius: 5px;
	padding: 5px;
	color: black;
	font-weight: bold;
	-webkit-border-radius: 5px;
	font-size: 13px;
	width: 70px;
}

.button:hover {
	background: white;
	color: black;
}
</style>

</head>
<body>
	 
	<form id="login-form" action="" method="post" >
		<fieldset>
			<legend>Log in</legend>
			<p>
				<label for="login">用户名：</label>
				<input type="text" name="username" />
			</p>

			<div class="clear"></div>

			<p>
				<label for="password">密码：</label>
				<input type="password" name="password" />
			</p>

			<div class="clear"></div>

			<p>
				<label>验证码：</label>
				<input type="text" name="vcode" />
				<img src='/index.php/Admin/Login/getcode' onclick="this.src='/index.php/Admin/Login/getcode/time/'+Math.random()" />
			</p>
			<p>
				<label></label>
				<input type="checkbox" name="remember">
				记住我
				 
				<input type="submit" class="button" value="Log in"  />
			</p>
		</fieldset>

	</form>
<script src='ui/jquery.min.js'></script>
<script src='layer/layer.js'></script>
<script>
	var error="<?php echo ($error); ?>";
	if(error.length>0){
		layer.msg(error);
	}
	var codeStatus=false;
	$("input[name='vcode']").blur(function(){
		var code= $("input[name='vcode']").val();
		$.get('/index.php/Admin/Login/checkcode',{code:code},function(msg){
			if(msg!=1){
				codeStatus=false;
				layer.msg('验证码不对');
				 
			}else{
				codeStatus=true;
			}

		});

	});
 
	$('#login-form').submit(function(e){
		
		if(!codeStatus){
			layer.msg('验证码不对');
			//$("input[name='vcode']").focus();		
			return false;
		}

	}) 
 

</script>


</body>
</html>