<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
  <head>
  
   <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/LpfManage/css/demo.css" rel="stylesheet" type="text/css" />

    <script src="/LpfManage/scripts/boot.js" type="text/javascript"></script>
    
    <link href="/LpfManage/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
  </head>
  <body bgcolor="">
			<h3>添加巡查人员信息</h3>
			<hr width="700" align="left">
			<s:form action="addWorker" method="post">
				 <table border="0" cellspacing="1" cellpadding="8" width="300">
				<tr>
					<s:textfield name="worker.name" label="姓名"></s:textfield>
				</tr>
				<tr>
					<s:textfield name="worker.age" label="年龄	"></s:textfield>
				</tr>
				<tr>
					<s:textfield name="worker.tel" label="手机号"></s:textfield>
				</tr>
				<tr>
					<td>性别</td>
					<td>
						<select name="worker.sex" >
                         <option value="男">男</option>
                         <option value="女">女</option>
                        </select>
					</td>
					</tr>
				<tr>
					 <td style="width:80px;">状态</td>
            <td style="width:150px;"><input name="worker.free"  class="mini-combobox" data="StateList" /></td>
				</tr>
			</table> 
			<p>
					<input type="submit" value="添加"/>
					<input type="reset" value="重置"/>
			</s:form>
			  <script type="text/javascript">

			  var StateList= [{ id: 0, text: '空闲' }, { id: 1, text: '忙碌 '}];
			  </script>
  </body>
</html>
