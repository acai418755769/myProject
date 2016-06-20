<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>






<html>
<head>
   <title>桥梁信息显示 </title>
     <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/LpfManage/css/demo.css" rel="stylesheet" type="text/css" />
    <script src="/LpfManage/scripts/boot.js" type="text/javascript"></script>
    <link href="/LpfManage/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
    
    <!-- 添加地图 -->
         <script type="text/javascript" src="/LpfManage/scripts/jquery.min.js"></script>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<title>百度地图API自定义地图</title>
<!--引用百度地图API-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>

<link href="/LpfManage/bootstrap/bootstrap-theme.css" rel="stylesheet" type="text/css" />
<link href="/LpfManage/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/LpfManage/bootstrap/bootstrap-select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=pDDXwvEkCu1uMLZNZqGwBdpE"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
<script type="text/javascript" src="/LpfManage/bootstrap/jquery.min.js"></script>
<script type="text/javascript" src="/LpfManage/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="/LpfManage/bootstrap/bootstrap-select.js"></script>
    
</head>
<body>
    

    
    <div style="width:100%;" >
        <div class="mini-toolbar" style="width:100%;">
            <table style="width:100%;">
                <tr>
                     <td style="width:100%;">
                                
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入桥梁名称" style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
    <div id="datagrid1" class="mini-datagrid" style="width:100%;height:40%;" 
        url="showBridge"  idField="id" onselectionchanged="onSelectionChanged" >
        <div property="columns">
            <div type="indexcolumn"></div>
            <div type="checkcolumn"></div>
            
             <div name="action" width="40" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
         
            <div field="bname" width="40" headerAlign="center"  >
            	桥梁名称
            </div>
           
            <div field="rtimes" width="40" headerAlign="center">
            	上报次数
            </div> 
            <div field="ctimes" width="40" headerAlign="center">
            	巡查次数
            </div>   
             <div field="mtimes" width="40" headerAlign="center" >  
                                             维修次数	
            </div> 
         
            </div> 
        </div>
 
<div id="editForm1" style="display:none;padding:5px;position:relative;">
    <input class="mini-hidden" name="id"/>
    <table style="width:100%;">
        <tr>
            <td style="width:80px;">桥梁名称</td>
            <td style="width:150px;"><input name="bname" class="mini-textbox" /></td>
            
            <td style="width:80px;">上报次数</td>
            <td style="width:150px;"><input name="rtimes" class="mini-textbox" /></td>
        </tr>
        <tr>
            <td style="width:80px;">核查次数</td>
            <td style="width:150px;"><input name="ctimes" class="mini-textbox" /></td>
           <td style="width:80px;">维修次数 </td>
            <td style="width:150px;"><input name="mtimes" class="mini-textbox" /></td>
        </tr>
        <tr>
            <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                <a class="Update_Button" href="javascript:updateRow();">Update</a> 
                <a class="Cancel_Button" href="javascript:cancelRow();">Cancel</a>
            </td>                
        </tr>
    </table>
</div>
 <div id="bridge_grid" class="mini-datagrid" style="width:100%;height:20%;" 
        url="/LpfManage/data/AjaxService.jsp?method=GetTaskBridge" 
        
    >
        <div property="columns">   
            <div field="bname" width="40" headerAlign="center"  >
            	桥梁名称
            </div>
           
            <div field="h_name" width="40" headerAlign="center"	>
                                       上报人
            </div>   
            
             <div field="h_date" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" >  
            	上报时间
            </div> 
             
            <div field="h_descript" width="80" headerAlign="center">
            	 上报内容
            	
            </div>   
              <div field="h_tel" width="50" headerAlign="center">
            	上报手机
            </div>      
             <div field="state" width="40" headerAlign="center" renderer="onStateRenderer">
            	状态
            </div>
             <div field="senddate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss" >
            	派工时间
            </div>
            <div field="w_name" width="40" headerAlign="center"	>
                                       核查报人
            </div>   
            
             <div field="w_date" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" >  
            	核查时间
            </div> 
             
            <div field="w_descript" width="80" headerAlign="center">
            	 核查内容
            	
            </div>   
              <div field="w_tel" width="50" headerAlign="center">
            	核查手机
            </div>                  
        </div>
    </div>      
     <!-- 添加地图 -->
    <div style="width:100%;height:54%;border:#ccc solid 1px;margin:1em;float:left" id="dituContent"></div>  
 
    
    <script type="text/javascript">
    var State=[{ id: 1,text: '未回复' },{ id : 2, text: '已回复' },];    
    function onStateRenderer(e) {
        for (var i = 0, l = State.length; i < l; i++) {
            var g = State[i];
            if (g.id == e.value) return g.text;
        }
        return "";
    }
    
    mini.parse();
    var grid = mini.get("datagrid1");
    var bridge_grid = mini.get("bridge_grid");
    grid.load();
    ///
   
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

        var s = '<a class="Edit_Button" href="javascript:addPointToMap(\'' + uid + '\')">显示位置</a> '
           + '<a class="New_Button" href="javascript:newRow()">增加</a> '
                +'<a class="Edit_Button" href="javascript:editRow(\'' + uid + '\')">修改</a> '
                + '<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a> ';
                   
        return s;
    }
  
   var myrowselect;
  function newRow() {
                
        var row = {};
        grid.addRow(row, 0);
        editRow(row._uid);
       
    }
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
                    url: "/LpfManage/data/AjaxService.jsp?method=GetBridge&id=" + row.id,
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
                    url: "/LpfManage/data/AjaxService.jsp?method=RemoveBridge&id=" + row.id,
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
       
        json=eval(json);
  		json[0].id=myrowselect+'';
  		json=mini.encode(json);
  		alert(json);
        $.ajax({
            url: "/LpfManage/data/AjaxService.jsp?method=SaveBridge",
            data: { data: json },
            success: function (text) {
            
                grid.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
   
    }
    ////
     function search() {
        var key = mini.get("key").getValue();

        grid.load({ key: key });
    }
    function onKeyEnter(e) {
        search();
    }
/////////////
  function onSelectionChanged(e) {
        
            var grid = e.sender;
            var record = grid.getSelected();
            if (record) {
                bridge_grid.load({ bname: record.bname });
            }
        }
  //////////////////
  
  ///////////////////

initMap();//创建和初始化地图
/////

function addPointToMap(row_uid){
	 var row = grid.getRowByUID(row_uid);
	 var b_name=row.bname;
	initMap();
	var myGeo = new BMap.Geocoder();
	// 将地址解析结果显示在地图上,并调整地图视野
	myGeo.getPoint(b_name, function(point){
		if (point) {
			map.centerAndZoom(point, 16);
			var marker= new BMap.Marker(point);
			var label = new BMap.Label(b_name,{offset:new BMap.Size(20,-10)});
			marker.setLabel(label);
			map.addOverlay(marker);
			marker.addEventListener("click", function(){          
				changeToOverView(point);
			});
			
			
		}else{
			alert("您选择地址没有解析到结果!");
		}
	}, "北京市");
}
function changeToOverView(point){
	map.centerAndZoom(new BMap.Point(120.305456, 31.570037), 12);
	map.addTileLayer(new BMap.PanoramaCoverageLayer());
	var panorama = new BMap.Panorama('dituContent'); 
	panorama.setPov({heading: -40, pitch: 6});
	panorama.setPosition(point); //根据经纬度坐标展示全景图		
 }  
        
        ////////地图
         function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
       // addCover(116.361303,39.973305,116.367928,39.963918,1);
       // addCover(116.367712,39.973364,116.377342,39.964074,2);
    	myCover();
    	
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(116.372595,39.963987);//定义一个中心点坐标
        map.centerAndZoom(point,15);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    function addCover(x1,y1,x2,y2,color){//添加矩形
    var pStart = new BMap.Point(x1,y1);
	var pEnd = new BMap.Point(x2,y2);
//	map.centerAndZoom("北京",15);
if(color==1){
	var polygon = new BMap.Polygon([
  	new BMap.Point(pStart.lng,pStart.lat),
  	new BMap.Point(pEnd.lng,pStart.lat),
  	new BMap.Point(pEnd.lng,pEnd.lat),
  	new BMap.Point(pStart.lng,pEnd.lat)], {strokeColor:"red", strokeWeight:2, strokeOpacity:0.6});
  	}else{
  	var polygon = new BMap.Polygon([
  	new BMap.Point(pStart.lng,pStart.lat),
  	new BMap.Point(pEnd.lng,pStart.lat),
  	new BMap.Point(pEnd.lng,pEnd.lat),
  	new BMap.Point(pStart.lng,pEnd.lat)], {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.6});
  	}
	map.addOverlay(polygon);
    }
    function myCover(){
			   var polygon_beiyou = new BMap.Polygon([
			//abckj
			  new BMap.Point(116.361316,39.972514),
			  new BMap.Point(116.363544,39.973329),
			  new BMap.Point(116.367497,39.973281),
			  new BMap.Point(116.367901,39.96397),
			  new BMap.Point(116.361882,39.963763)
			], {strokeColor:"red", strokeWeight:4, strokeOpacity:0.5,fillOpacity:0.3});
			  map.addOverlay(polygon_beiyou);
			  var polygon_beishi = new BMap.Polygon([
			//cdek
			  new BMap.Point(116.367497,39.973281),
			  new BMap.Point(116.376632,39.973854),
			  new BMap.Point(116.377558,39.963929),
			  new BMap.Point(116.367901,39.96397)
			], {strokeColor:"green", strokeWeight:4, strokeOpacity:0.5,fillOpacity:0.3});
			map.addOverlay(polygon_beishi);
			
			  var polygon_wenhuiyuan = new BMap.Polygon([
			   //efghij
			  new BMap.Point(116.377558,39.963929),
			  new BMap.Point(116.378052,39.956877),
			  new BMap.Point(116.36711,39.953545),
			  new BMap.Point(116.363409,39.953711),
			  new BMap.Point(116.3619,39.957403),
			  new BMap.Point(116.361882,39.963763),
			  new BMap.Point(116.367901,39.96397)
			], {strokeColor:"purple", strokeWeight:4, strokeOpacity:0.5,fillOpacity:0.3});
			map.addOverlay(polygon_wenhuiyuan);
			
			  var polygon_xinjie = new BMap.Polygon([
			   //lmed
			  new BMap.Point(116.386801,39.974241),
			  new BMap.Point(116.385472,39.96426),
			  new BMap.Point(116.377558,39.963929 ),
			  new BMap.Point(116.376632,39.973854)
			], {strokeColor:"blue", strokeWeight:4, strokeOpacity:0.5,fillOpacity:0.3});
			map.addOverlay(polygon_xinjie);
			
			var polygon_jishuitan = new BMap.Polygon([
			   //mnopfe
			  new BMap.Point(116.385472,39.96426),
			  new BMap.Point(116.385795,39.958011),
			  new BMap.Point(116.383891,39.955108),
			  new BMap.Point(116.378501,39.954859),
			  new BMap.Point(116.378052,39.956877),
			  new BMap.Point(116.377558,39.963929)
			], {strokeColor:"red", strokeWeight:4, strokeOpacity:0.5,fillOpacity:0.3});
			map.addOverlay(polygon_jishuitan);
			
			
			var polygon_zhengfa = new BMap.Polygon([
			   //qrsjw
			  new BMap.Point(116.351682,39.973115),
			  new BMap.Point(116.352401,39.968097),
			  new BMap.Point(116.354557,39.963866),
			  new BMap.Point(116.361882,39.963763),
			  new BMap.Point(116.361348,39.973267)
			], {strokeColor:"blue", strokeWeight:4, strokeOpacity:0.5,fillOpacity:0.3});
			map.addOverlay(polygon_zhengfa);
			
			
			  var polygon_mingguang = new BMap.Polygon([
			//stij
			  new BMap.Point(116.354557,39.963866),
			  new BMap.Point(116.358437,39.956234),
			  new BMap.Point(116.3619,39.957403),
			  new BMap.Point(116.361882,39.963763)
			], {strokeColor:"green", strokeWeight:4, strokeOpacity:0.5,fillOpacity:0.3});
			map.addOverlay(polygon_mingguang);

    
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