<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>学生面板</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
    <script src="/XS_Test2/scripts/boot.js" type="text/javascript"></script>
    

    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body>    
     
    <form id="form1" method="post">
        <input name="id" class="mini-hidden" />
        <div style="padding-left:11px;padding-bottom:5px;">
            <table style="table-layout:fixed;">
                <tr>
                    <td style="width:70px;">学号：</td>
                    <td style="width:150px;">    
                        <input name="xh" class="mini-textbox" required="true"  emptyText="请输入帐号"/>
                    </td>
                     <td>姓名</td>
                    <td >    
                        <input name="xm" class="mini-textbox" required="true"/>
                    </td>
                    
                </tr>
                <tr>
                  
                       <td style="width:70px;">性别：</td>
                <td >                        
                    <select name="xb" class="mini-radiobuttonlist">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
                <td >出生日期：</td>
                <td >    
                    <input name="cssj" class="mini-datepicker" required="true" emptyText="请选择日期"/>
                </td>
                </tr>
               
                <tr>
                     <td style="width:80px;">所属专业：</td>
                    <td style="width:150px;">    
                        <input name="zy_id" class="mini-combobox" valueField="id" textField="zym" 
                            url="/XS_Test2/data/AjaxService.jsp?method=GetAllZy"
                           
                             emptyText="请选择专业"
                            />
                    </td>
                    
                      <td style="width:70px;">总学分</td>
                <td style="width:150px;">    
                    <input name="zxf" class="mini-textbox" required="true"/>
                </td>
                </tr>    
                <tr>
               <td >备注 ：</td>
                <td >    
                    <input name="bz" class="mini-textbox" />
                </td>
                
                </tr>       
            </table>
        </div>
       
        <div style="text-align:center;padding:10px;">               
            <a class="mini-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
            <a class="mini-button" onclick="onCancel" style="width:60px;">取消</a>       
        </div>        
    </form>
    <script type="text/javascript">
        mini.parse();

        var form = new mini.Form("form1");

        function SaveData() {
            var o = form.getData();            

            form.validate();
            if (form.isValid() == false) return;

            var json = mini.encode([o]);
            $.ajax({
                url: "/XS_Test2/data/AjaxService.jsp?method=SaveXs",
		type: 'post',
                data: { data: json },
                cache: false,
                success: function (text) {
                    CloseWindow("save");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }

        ////////////////////
        //标准方法接口定义
        function SetData(data) {
            if (data.action == "edit") {
                //跨页面传递的数据对象，克隆后才可以安全使用
                data = mini.clone(data);

                $.ajax({
                    url: "/XS_Test2/data/AjaxService.jsp?method=GetXs&id=" + data.id,
                    cache: false,
                    success: function (text) {
                        var o = mini.decode(text);
                        form.setData(o);
                        form.setChanged(false);

                        onDeptChanged();
                        mini.getbyName("position").setValue(o.position);
                    }
                });
            }
        }

        function GetData() {
            var o = form.getData();
            return o;
        }
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        function onOk(e) {
            SaveData();
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
        //////////////////////////////////
        

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
