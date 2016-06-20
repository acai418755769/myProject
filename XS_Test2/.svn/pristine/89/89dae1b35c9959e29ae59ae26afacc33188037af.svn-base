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
    <h1>成绩信息显示 </h1>

    
    <div style="width:100%;">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                    	
                        
                        <span class="separator"></span>
                       
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入学号" style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
    
   <div id="datagrid1" class="mini-datagrid" style="width:100%;height:70%;"
        url="xscjInfo1"  idField="id" multiSelect="true"
        
        >
        <div property="columns">
            <div type="indexcolumn"></div>
            <div type="checkcolumn"></div>
            
              <%
            Dlb user=new Dlb();
            	user=(Dlb)request.getSession().getAttribute("user");
            	int flag=user.getFlag();
            %>
            <% if(flag==2){ %>
            <div name="action" width="120" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
            <%} %>
            <div field="xh" width="80" headerAlign="center"  >
            	学号
            </div>
            <div field="xm" width="80" headerAlign="center">
            	姓名
            </div>
            <div field="kch" width="40" headerAlign="center"	>
            	课程号
            </div>   
             <div field="kcm" width="80" headerAlign="center" >  
                                             课程名
            </div> 
             <div field="cj" width="40" headerAlign="center">
            	 成绩
            </div> 
             <div field="xf" width="40" headerAlign="center">
            	 学分
            </div> 
        </div>
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

            var s = 
                    '<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a> ';
                       
            return s;
        }
      
       
       
        function delRow(row_uid) {
          
            
            var row = grid.getRowByUID(row_uid);
            if (row) {
                if (confirm("确定删除此记录？")) {
                    grid.loading("删除中，请稍后......");
                    $.ajax({
                        url: "/XS_Test2/data/AjaxService.jsp?method=RemoveCj&id=" + row.id,
                        success: function (text) {
                            grid.reload();
                        },
                        error: function () {
                        }
                    });
                }
            }
           
        }
     
        //////////////////
       /*
       
       
           function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            //服务端汇总计算
            if (e.field == "xh") {                
                var s = "<span style='color:Brown;'>"
                s +=    "Total=" + result.total +"<br/>"
                        + 'Min Cj=' + result.minAge + "<br/>"
                        + 'Max Cj=' + result.maxAge + "<br/>"
                        + 'Avg Cj=' + result.avgAge + "<br/>"
                        + "</span>";
                e.cellHtml = s;
            }
            //客户端汇总计算
            if (e.field == "kch") {
                e.cellHtml = "平均: " + e.cellHtml;
            }
            if (e.field == "xf") {
                e.cellHtml = "最高学分: " + e.value;
            }
        }
        */
        
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

    <div class="description">
        <h3>Description</h3>
        
    </div>
</body>
</html>