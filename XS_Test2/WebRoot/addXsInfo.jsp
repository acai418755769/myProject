<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>

<html>
 <script type="text/javascript" src="images/calendar.js">
	 </script>
<head>
    <title>DataGrid 数据表格</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="css/demo.css" rel="stylesheet" type="text/css" />

    <script src="scripts/boot.js" type="text/javascript"></script>
</head>
	 
	<body bgcolor="">
		<h3>
			请填写学生信息
			
			
		</h3>
		<hr width="700" align="left">
		
		
		<s:form action="addXs" method="post"
			enctype="multipart/form-data" validate="true">
			<table border="0" cellspacing="0" cellpadding="1">
				<tr>
					<td>
						<s:textfield name="xs.xh" label="学号" value=""></s:textfield>
					</td>
				</tr>
				<tr>
					<td>
						<s:textfield name="xs.xm" label="姓名" value=""></s:textfield>
					</td>
				</tr>
				<tr>
					<td>性别</td>
					<td>
					<!--  <s:radio name="xs.xb" value="男" list="#{'1':'男','0 ':'女'}" label="性别" />-->	
						
						<select name="xs.xb" >
                         <option value="男">男</option>
                         <option value="女">女</option>
                        </select>
					</td>
				</tr>
				<tr>
          				 <td >出生时间：</td>
                <td >    
                    <input name="xs.cssj" class="mini-datepicker" required="true" emptyText="请选择日期"/>
                </td> 
          		
				</tr>
				
				<tr>
					<s:select  name="xs.zyb.id" list="list" listKey="id" listValue="zym"
					 headerKey="0" headerValue="--请选择专业--" label="专业"></s:select>
				</tr>
					<td>
						<s:textfield name="xs.zxf" label="总学分" value=""></s:textfield>
					</td>
				</tr>
				<tr>
					<td>
						<s:textfield name="xs.bz" label="备注" value=""></s:textfield>
					</td>
				</tr>
				  <tr>
					<td>
						<s:file name="zpfile" label="照片" value=""></s:file>
					</td>
				</tr>
			</table>
			<p>
				<input type="submit" value="添加" />
				<input type="reset" value="重置" />
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
