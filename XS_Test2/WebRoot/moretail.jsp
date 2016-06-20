<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
  <head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/XS_Test2/css/demo.css" rel="stylesheet" type="text/css" />

    <script src="/XS_Test2/scripts/boot.js" type="text/javascript"></script>
    
    <link href="/XS_Test2/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
  
  
  </head>
  
  <body bgcolor="">
  		<h3>学生信息如下：</h3>
  		<s:set name="xs" value="#request.xs"></s:set>
  		<s:form action="xsInfo.action" method="post">
  			<table border="0" cellpadding="5">
  				<tr>
  					<td>学号：</td>
  					<td width="100"><s:property value="#xs.xh"/></td>
  					<td rowspan="7"><img src="getImage.action?xs.xh=<s:property value="#xs.xh"/>" width="120"height="150"></td>
  				</tr>
  				<tr>
  					<td>姓名：</td>
  					<td width="100"><s:property value="#xs.xm"/></td>
  				</tr>
  				<tr>
  					<td>性别：</td>
  					<td width="100"><s:property value="#xs.xb"/></td>
						
					</td>
				</tr>
				<tr>
					<td>专业：</td>
  					<td width="100"><s:property value="#xs.zyb.zym"/></td>
  				</tr>
  			<tr>
  					<td>出生时间：</td>
  					<td width="100"><s:property value="#xs.cssj"/></td>
  				</tr>
  			
  				<tr>
  					<td>总学分</td>
  					<td width="100"><s:property value="#xs.zxf"/></td>
  				</tr>
  				<tr>
  					<td>备注</td>
  					<td width="100"><s:property value="#xs.bz"/></td>
  				</tr>
  				
  			</table>
  			
  		</s:form>
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
