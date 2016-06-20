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
  		<s:set name="ta" value="#request.onetask"></s:set>
  		<s:form  method="post">
  			<table class="table table-bordered">
  		
  			<tr>
  				<tr>
  					<td width="100">桥梁名称：</td>
  					<td width="100"><s:property value="#ta.bname"/></td>
  					<td width="100">状态：</td>
  					<td width="100"><s:property value="#request.state"/>
  				
  				
  					
  					</td>
  					<!-- 	<s:iterator id="xs" value="#request.list1">
								<option value="<s:property value="#xs.xh"/>">
									<s:property value="#xs.xm" />
								</option>
							</s:iterator> -->
  				</tr>
  				<tr>
  					
  					<td width="100">派工时间：</td>
  					<td ><s:property value="#ta.senddate" /></td>
  				</tr>
  			</tr>
  		
  			<tr>
  				
  				<table  class="table table-bordered">
  				  	<tr>
					<td width="100">上报人:</td>
  					<td width="100"><s:property value="#ta.h_name"/></td>
  					<td rowspan="4"><img src="getTaskHphoto.action?id=<s:property value="#request.onetask.id"/>" width="230"height="170"></td>
  				    </tr>
  				    <tr>
					<td width="100">上报内容:</td>
  					<td width="100"><s:property value="#ta.h_descript"/></td>
  				    </tr>
  				    <tr>
					<td width="100">上报时间:</td>
  					<td width="100"><s:property value="#ta.h_date"/></td>
  				    </tr>
  				    <tr>
					<td width="100">上报手机:</td>
  					<td width="100"><s:property value="#ta.h_tel"/></td>
  				    </tr>
  				    <tr>
  					
  					 </tr> 
  				</table>
  			</tr>	
  			<tr>	
  				
  				  <table  class="table table-bordered">
  				  <tr>
					<td width="100">核查人:</td>
  					<td width="100"><s:property value="#ta.w_name"/></td>
  					<td rowspan="4"><img src="getTaskWphoto.action?id=<s:property value="#request.onetask.id"/>" width="230"height="170"></td>
  				
  				    </tr>
  				    <tr>
					<td width="100">核查内容:</td>
  					<td width="100"><s:property value="#ta.w_descript"/></td>
  				    </tr>
  				    <tr>
					<td width="100">核查时间:</td>
  					<td width="100"><s:property value="#ta.w_date"/></td>
  				    </tr>
  				    <tr>
					<td width="100">核查手机:</td>
  					<td width="100"><s:property value="#ta.w_tel"/></td>
  				    </tr>
	  				    
  				  </table>
  				
  				
  			</tr>
  			
  				
  			</table>
  			
  		</s:form>
  		  <script type="text/javascript">
  		  var StateList = [{ id: 1, text: '未回复' }, { id: 2, text: '已回复'}];
  		  
  		  </script>
  </body>
</html>
