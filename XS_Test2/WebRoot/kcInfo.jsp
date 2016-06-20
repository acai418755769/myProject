<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="org.model.Dlb" %>





<html>
<head>
    <title>CellEdit 单元格编辑 </title>
     <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/XS_Test2/css/demo.css" rel="stylesheet" type="text/css" />

    <script src="/XS_Test2/scripts/boot.js" type="text/javascript"></script>
    
    <link href="/XS_Test2/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <h1>课程信息显示 </h1>

    
    <div style="width:100%;">
        <div class="mini-toolbar" style="width:100%;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入课程名" style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
 <div class="mini-fit">
   <div id="datagrid1" class="mini-datagrid" style="width:100%;height:75%;"
        url="showKcInfo"  idField="id" sizeList="[10,20,50,100]" pageSize="10"">
        <div property="columns">
            <div type="indexcolumn"></div>
            <div type="checkcolumn"></div>
            
             <%
        Dlb user=new Dlb();
             user=(Dlb) request.getSession().getAttribute("user");
          int  flag=user.getFlag();
         %>
            
            <%if(flag==2){ %>
            <div name="action" width="120" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
            <%} %>
            <div field="kch" width="40" headerAlign="center"  >
            	课程号
            </div>
            <div field="kcm" width="80" headerAlign="center">
            	课程名
            </div>
            <div field="kxxq" width="40" headerAlign="center"	>
            	开课学期
            </div>   
             <div field="xs" width="40" headerAlign="center" >  
                                             学时
            </div> 
             <div field="xf" width="40" headerAlign="center">
            	 学分
            </div> 
        </div>
    </div>
</div>
  <div id="editForm1" style="display:none;padding:5px;position:relative;">
    <input class="mini-hidden" name="id"/>
    <table style="width:100%;">
        <tr>
            <td style="width:80px;">课程号：</td>
            <td style="width:150px;"><input name="kch" class="mini-textbox" /></td>
            <td style="width:80px;">课程名：</td>
            <td style="width:150px;"><input name="kcm" class="mini-textbox" /></td>
            <td style="width:80px;">开课学期：</td>
            <td style="width:150px;"><input name="kxxq" class="mini-textbox" /></td>
        </tr>
        <tr>
            <td>学时：</td>
            <td style="width:80px;"><input name="xs" class="mini-textbox" /></td>
           <td style="width:80px;">学分</td>
            <td style="width:150px;"><input name="xf" class="mini-textbox" /></td>
        </tr>
        <tr>
            <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                <a class="Update_Button" href="javascript:updateRow();">Update</a> 
                <a class="Cancel_Button" href="javascript:cancelRow();">Cancel</a>
            </td>                
        </tr>
    </table>
</div>
 
 
    
    <script type="text/javascript">
        mini.parse();
        var grid = mini.get("datagrid1");
        grid.load();
        /////////
       var editForm = document.getElementById("editForm1");        
        var grid = mini.get("datagrid1");
        grid.load();
        grid.sortBy("createtime", "desc");
        
        ///////////////////////
        function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;

            var s = '<a class="New_Button" href="javascript:newRow()">New</a> '
                    +'<a class="Edit_Button" href="javascript:editRow(\'' + uid + '\')">Edit</a> '
                    + '<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">Delete</a> ';
                       
            return s;
        }

       
      function newRow() {
                    
            var row = {};
            grid.addRow(row, 0);
            editRow(row._uid);
           
        }
        function editRow(row_uid) {
            
            var row = grid.getRowByUID(row_uid);
            if (row) {
                //显示行详细
                grid.hideAllRowDetail();
                grid.showRowDetail(row);

                //将editForm元素，加入行详细单元格内
                var td = grid.getRowDetailCellEl(row);
                td.appendChild(editForm);
                editForm.style.display = "";

                //表单加载员工信息
                var form = new mini.Form("editForm1");
                if (grid.isNewRow(row)) {                    
                    form.reset();
                } else {
                    form.loading();
                    $.ajax({
                        url: "/XS_Test2/data/AjaxService.jsp?method=GetKc&id=" + row.id,
                        success: function (text) {
                            var o = mini.decode(text);
                            form.setData(o);                            

                            form.unmask();
                        }
                    });
                }
                grid.doLayout();
            }
           
        }
        function cancelRow() {
            grid.reload();
        }
        function delRow(row_uid) {
           
            var row = grid.getRowByUID(row_uid);
            if (row) {
                if (confirm("确定删除此记录？")) {
                    grid.loading("删除中，请稍后......");
                    $.ajax({
                        url: "/XS_Test2/data/AjaxService.jsp?method=RemoveKc&id=" + row.id,
                        success: function (text) {
                            grid.reload();
                        },
                        error: function () {
                        }
                    });
                }
            }
           
        }
      function updateRow() {
      
            var form = new mini.Form("editForm1");

            var o = form.getData();
            
            grid.loading("保存中，请稍后......");
            var json = mini.encode([o]);
            
            $.ajax({
                url: "/XS_Test2/data/AjaxService.jsp?method=SaveKc",
                data: { data: json },
                success: function (text) {
                if(text.indexOf('exists')>0){
                alert(text);
                grid.reload();
                }else
                    grid.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
       
        }
        
        
        
        
        ///////////////////////////
        
        
         function search() {
            var key = mini.get("key").getValue();

            grid.load({ key: key });
        }

        function onKeyEnter(e) {
            search();
        }


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