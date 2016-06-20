<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>


<html >
<head>
    <title>二级联动表格</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" /><link href="/XS_Test2/css/demo.css" rel="stylesheet" type="text/css" />

    
    <script src="/XS_Test2/scripts/boot.js" type="text/javascript"></script>
    
    <style type="text/css">
        .New_Button, .Edit_Button, .Delete_Button, .Update_Button, .Cancel_Button
        {
            font-size:11px;color:#1B3F91;font-family:Verdana;  
            margin-right:5px;          
        }
       
                
    </style>        
</head>
<body>
    <h1>专业及人数</h1>      

    <div id="zy_grid" class="mini-datagrid" style="width:100%;height:30%;" 
        url="/XS_Test2/data/AjaxService.jsp?method=GetAllZy"  idField="id"
        onselectionchanged="onSelectionChanged" 
        selectOnLoad="true"
    >
        <div property="columns">            
            <div field="id" width="30" headerAlign="center" >专业号</div>                                        
            <div field="zym" width="50" headerAlign="center" >专业名称</div> 
            <div field="rs" width="50" headerAlign="center" >专业人数</div>
             <div field="fdy" width="50" headerAlign="center" >辅导员</div>              
        </div>
    </div> 
  
    <br />
    <div id="xs_grid" class="mini-datagrid" style="width:100%;height:50%;" 
        url="/XS_Test2/data/AjaxService.jsp?method=GetZybXs" 
        
    >
        <div property="columns">            
            <div field="xh" width="80" headerAlign="center"  >
            	学号
            </div>
            <div field="xm" width="80" headerAlign="center">
            	姓名
            </div>
            <div field="xb" width="40" headerAlign="center"	>
            
            	性别
            </div>   
            
             <div field="cssj" width="80" headerAlign="center" allowSort="true" >  
            	出生时间
            </div> 
             
            <div field="zxf" width="50" headerAlign="center">
            	总学分
            	
            </div>   
              <div field="bz" width="200" headerAlign="center">
            	备注 
            </div>                
        </div>
    </div>      
   
    

    <script type="text/javascript">
        var Genders = [{ id: 1, text: '男' }, { id: 2, text: '女'}];

        mini.parse();

        var zy_grid = mini.get("zy_grid");
        var xs_grid = mini.get("xs_grid");

        zy_grid.load();

        ///////////////////////////////////////////////////////       
        
        function onGenderRenderer(e) {
            for (var i = 0, l = Genders.length; i < l; i++) {
                var g = Genders[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }


        function onSelectionChanged(e) {
        
            var grid = e.sender;
            var record = grid.getSelected();
            if (record) {
                xs_grid.load({ zyId: record.id });
            }
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