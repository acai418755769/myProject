<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
  <head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/LpfManage/css/demo.css" rel="stylesheet" type="text/css" />

    <script src="/LpfManage/scripts/boot.js" type="text/javascript"></script>
    
    <link href="/LpfManage/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
  
   <link href="/LpfManage/css/bootstrap.min.css" rel="stylesheet">
   <script src="/LpfManage/scripts/jquery.min.js"></script>
   <script src="/LpfManage/scripts/bootstrap.min.js"></script>
  
  </head>
  
  <body bgcolor="">
  		<h3>上报事件信息如下：</h3>
  		
  		<s:set name="ev" value="#request.oneevent"></s:set>
  		<s:form  method="post">
  	
  			<table class="table table-bordered">
  			
  		        <tr>
  		             <td>桥梁名称</td>
  					<td ><s:property value="#ev.bname"/></td>
  					<td rowspan="5"><img src="getEventImage.action?id=<s:property value="#request.oneevent.id"/>" width="210"height="240"></td>
  		       </tr>
  				
  				<tr>
  					<td>上报人</td>
  					<td ><s:property value="#ev.h_name"/></td>
						
					</td>
				</tr>
				<tr>
					<td>上报内容</td>
  					<td><s:property value="#ev.h_content"/></td>
  				</tr>
  			<tr>
  					<td>上报时间：</td>
  					<td><s:property value="#ev.h_date" /></td>
  				</tr>
  			
  				<tr>
  					<td>手机号码</td>
  					<td ><s:property value="#ev.h_tel"/></td>
  				</tr>
  				
  			</table>	
  			
  		</s:form>
  		
  </body>
</html>
