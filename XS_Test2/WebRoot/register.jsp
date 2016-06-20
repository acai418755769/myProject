<%@ page language="java" pageEncoding="utf-8"%>
<html>
		<head>
    		<title>用户注册</title>
  	</head>
  	<body bgcolor="#E3E3E3">
		<form action="register" method="post">
			<table>
			<caption>用户注册</caption>
				<tr><td>登录名：</td>
				<td><input type="text" name="xh"/></td>
				</tr>
				<tr><td>密码:</td>
				<td><input type="password" name="kl"/></td>
				</tr>
				<tr>
				<td>用户类型</td>
				 <td>
				<select name="flag" >
                         <option value=1>学生</option>
                         <option value=2>老师</option>
                        </select>
				 </td>
				</tr>
			</table>
				<input type="submit" value="注册"/>
				<input type="reset" value="重置"/>
		</form>
  	</body>
</html>
