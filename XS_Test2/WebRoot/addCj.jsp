<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib uri="/struts-tags" prefix="s"%>
<html>
	<body bgcolor="">
		<h3>
			请填写要修改或增加的学生成绩信息
		</h3>
		<hr>
		<form action="addorupdateXscj.action" method="post">
			<table border="1" cellspacing="1" cellpadding="8" width="400">
				  
				<tr>
					<td width="100">
						请选择学生：
					</td>
					<td>
						<select name="cj.xh">
							<s:iterator id="xs" value="#request.list1">
								<option value="<s:property value="#xs.xh"/>">
									<s:property value="#xs.xm" />
								</option>
							</s:iterator>
						</select>
					</td>
				</tr>
				
			
				<tr>
					<td width="100">
						请选择课程：
					</td>
					<td>
						<select name="cj.kch">
							<s:iterator id="kc" value="#request.list2">
								<option value="<s:property value="#kc.kch"/>">
									<s:property value="#kc.kcm" />
								</option>
							</s:iterator>
						</select>
					</td>
				</tr>
				<tr>
					<s:textfield label="成绩" name="cj.cj" value="" size="15"></s:textfield>
				</tr>
			</table>
			<input type="submit" value="确定" />
			<input type="reset" value="重置" />
		</form>
	</body>
</html>