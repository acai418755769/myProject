<%@ page contentType="text/html;charset=utf8"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.model.Dlb" %>
<%@page import="org.model.Xsb" %>
<html>
	<head>
	 <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/XS_Test2/css/demo.css" rel="stylesheet" type="text/css" />

    <script src="/XS_Test2/scripts/boot.js" type="text/javascript"></script>
    
    <link href="/XS_Test2/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
    	<title>留言板</title>
  	</head>
  	<body bgcolor="">
  	<center>
  	 <%
                 Dlb user=new Dlb();
                      user=(Dlb) request.getSession().getAttribute("user");
                   String xh1=user.getXh();
                               %>
  	  	<form action="addLy.action?xh=<%=xh1 %>" method="post">
  			<table border="1">
  			
  			<caption>填写留言信息</caption>
  			<tr>
  			<td>留言标题:</td>
  				<td><input type="text" name="title"/></td>
  			</tr>
  			<!--  <tr> 
  			 <td>留言日期：</td>
            <td> <input name="date" class="mini-datepicker" required="true" emptyText="请选择日期"/></td>
            </tr>
  		    --> 	
  			<tr>
  			<td>留言内容:</td>
  			<td><textarea name="content" rows="5" cols="35"></textarea></td>
			</tr>
  			</table>
  		<input type="submit" value="提交"/>
  		<input type="reset" value="重置"/>
  	</form>
	</center>
	<script type="text/javascript">
	  var winAlert=window.alert;
  	window.alert=function(e){
  		if(e!=null&&e.indexOf("试用")>=1){
  		}else{
  			winAlert(e);
  		}
  	}
	</script>
</body>
</html>