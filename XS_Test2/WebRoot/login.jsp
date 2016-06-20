
<%@ page language="java" pageEncoding="utf8"%>
<html>
  <head>
     <title>学生成绩管理系统 </title>
  </head>
  <body bgcolor="#E3E3E3">
		<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<form  action="login" method="post" class="form-horizontal">
				<div class="control-group">
					 <label class="control-label" for="inputEmail">用户名</label>
					<div class="controls">
						<input type="text" name="dl.xh" size=”20” type="text" />
					</div>
				</div>
				<div class="control-group">
					 <label class="control-label" for="inputPassword">密码</label>
					<div class="controls">
						<input type="password" name="dl.kl" size=”21” type="password" />
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						 <label class="checkbox"><input type="checkbox" /> Remember me</label>
						
					</div>
					<div>
					
					 <button type="submit" class="btn">登陆</button>
					</div>
				</div>
			</form>
			如果没注册点击<a href="register.jsp">这里</a>注册！
		</div>
	</div>
</div>
		
  </body>
</html>
