<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>






<html>
<head>
    <title>CellEdit 单元格编辑 </title>
     <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/LpfManage/css/demo.css" rel="stylesheet" type="text/css" />

    <script src="/LpfManage/scripts/boot.js" type="text/javascript"></script>
    
    <link href="/LpfManage/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <h1>工作人员信息显示 </h1>

    
    <div style="width:100%;">
        <div class="mini-toolbar" style="width:100%;">
            <table style="width:100%;">
                <tr>
                     <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="add()" plain="true" tooltip="增加...">增加</a>
                       
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入姓名" style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>

    <div id="datagrid1" class="mini-datagrid" style="width:100%;height:60%;" 
        url="showWorker"  idField="id">
        <div property="columns">
            <div type="indexcolumn"></div>
            <div type="checkcolumn"></div>
            
             <div name="action" width="40" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
         
            <div field="name" width="40" headerAlign="center"  >
            	姓名
            </div>
            <div field="age" width="40" headerAlign="center">
            	年龄
            </div>
            <div field="sex" width="40" headerAlign="center">
            	性别
            </div>   
             <div field="tel" width="40" headerAlign="center" >  
                                             电话	
            </div> 
            <div field="worktimes" width="40" headerAlign="center" >  
                                             核查次数	
            </div> 
             <div field="free" width="40" headerAlign="center" renderer="onStateRenderer">
            	 状态 
            	<!--  --> 
            </div> 
        </div>
    </div>

  <div id="editForm1" style="display:none;padding:5px;position:relative;">
   
    <input class="mini-hidden" name="id"/>
    
    <table style="width:100%;">
        <tr>
          
            <td style="width:80px;">姓名：</td>
            <td style="width:150px;"><input name="name" class="mini-textbox" /></td>
            <td style="width:80px;">手机号码：</td>
            <td style="width:150px;"><input name="tel" class="mini-textbox" /></td>
        </tr>
        <tr>
                   <td style="width:70px;">性别：</td>
                <td >                        
                    <select name="sex" class="mini-radiobuttonlist">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
           <td style="width:80px;">年龄</td>
            <td style="width:150px;"><input name="age" class="mini-textbox" /></td>
            
        </tr>
        <tr>
       <td style="width:70px;">状态</td>
                <td >                        
                    <select name="free" class="mini-radiobuttonlist">
                        <option value="0">空闲</option>
                        <option value="1">忙碌</option>
                    </select>
                </td>
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
  
     var SList=[{ id : 1,text: '空闲' },{ id : 2, text: '忙碌'}]; 
   var State=[{ id: 0,text: '空闲' },{ id : 1, text: '忙碌'}];    
        function onStateRenderer(e) {
            for (var i = 0, l = State.length; i < l; i++) {
                var g = State[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }
    ///////////////////////
    
     function add() {
            
            mini.open({
                url: "addWorkerView.action",
                title: "添加巡查人员 ", width: 500, height: 360,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {

                    grid.reload();
                }
            });
        }
  ////////////////
  
  
    var editForm = document.getElementById("editForm1");        
        
        var grid = mini.get("datagrid1");
        grid.load();
        grid.sortBy("createtime", "desc");
    function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;

            var s = 
                     '<a class="Edit_Button" href="javascript:editRow(\'' + uid + '\')">编辑</a> '
                    + '<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除 </a> ';
                       
            return s;
        }
    var myrowselect;
    function editRow(row_uid) {
        
        var row = grid.getRowByUID(row_uid);
        myrowselect=row.id;
       
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
                    url: "/LpfManage/data/AjaxService.jsp?method=GetWorker&id=" + row.id,
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
    
    function delRow(row_uid) {
        
        var row = grid.getRowByUID(row_uid);
        if (row) {
            if (confirm("确定删除此记录？")) {
                grid.loading("删除中，请稍后......");
                $.ajax({
                    url: "/LpfManage/data/AjaxService.jsp?method=RemoveWorker&id=" + row.id,
                    success: function (text) {
                        grid.reload();
                    },
                    error: function () {
                    }
                });
            }
        }
       
    }
    function cancelRow() {
        grid.reload();
    }
    function updateRow() {
        var form = new mini.Form("editForm1");
        var o = form.getData();
        grid.loading("保存中，请稍后......");
        var json = mini.encode([o]);
        json=eval(json);
  		json[0].id=myrowselect+'';
  		json=mini.encode(json);
        $.ajax({
            url: "/LpfManage/data/AjaxService.jsp?method=SaveWorker",
            data: { data: json },
            success: function (text) {
              
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