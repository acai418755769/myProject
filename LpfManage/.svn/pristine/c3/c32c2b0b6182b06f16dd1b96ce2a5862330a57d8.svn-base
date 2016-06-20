<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib uri="/struts-tags" prefix="s"%>
<html>
<script type="text/javascript" src="/LpfManage/bootstrap/jquery.min.js"></script>
 <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/LpfManage/css/demo.css" rel="stylesheet" type="text/css" />

    <script src="/LpfManage/scripts/boot.js" type="text/javascript"></script>
    
    <link href="/LpfManage/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
    
    <link href="/LpfManage/css/bootstrap.min.css" rel="stylesheet">
   <script src="/LpfManage/scripts/jquery.min.js"></script>
   <script src="/LpfManage/scripts/bootstrap.min.js"></script>
	<body bgcolor="">
	<center>
		<h3>
			完善派工单信息
		</h3>
		
		
		<s:form action="addTask.action" method="post">
		<s:set name="event" value="#request.event"></s:set>
		
		
  		
  			<table class="table table-bordered">
  			
  			<input class="mini-hidden" name="id" value="<s:property value="#event.id"/>"/>
  				<tr>
  					<td width="200px">桥梁名称：</td>
  					
  					<td ><s:property value="#event.bname"/></td>
  				</tr>
  				
  				<tr>
  					<td>上报内容：</td>
  					<td ><s:property value="#event.h_content"/></td>
						
					</td>
				</tr>
				<tr>
					<td>上报人：</td>
  					<td ><s:property value="#event.h_name"/></td>
  				</tr>
  			<tr>
  					<td>上报时间：</td>
  					<td ><s:property value="#event.h_date"/></td>
  				</tr>
  			
  				<tr>
  					<td>上报人手机号:</td>
  					<td ><s:property value="#event.h_tel"/></td>
  				</tr>
  				
				<tr>
					<td>空闲人员</td>
					<td>
					 	<select id="w_name" name="w_name" onchange="getChange()" >
							<s:iterator id="worker" value="#request.listworker">
								<option value="<s:property value="#worker.name"/>">
									<s:property value="#worker.name" />
								</option>
							</s:iterator>
						</select>
						
					</td>
				</tr>
				<tr>
				<td >手机号码:</td>
				<td>
					<input id="w_tel" name="w_tel" type="text" value="<s:property value="#request.firsttel" />" readonly="readonly"/>
					
				</td>
				</tr>
			</table>
			
		          <input type="submit" value="确定" />
			       <input type="reset" value="重置" />
			       
		</s:form>
		<script type="text/javascript">
		function getChange(){
	var id=$('#w_name').val();
	var tel;
	  $.ajax({
          url: "/LpfManage/data/AjaxService.jsp?method=GetWorkerByName&id=" + id,
          success: function (text) {
          text=eval('['+text+']');
          tel=text[0].tel;
          $('#w_tel')[0].value=tel;
          
              grid.reload();
             
              
          },
          error: function () {
          }
      });
	 
      
		}
		</script>
		</center>
	</body>
</html>
