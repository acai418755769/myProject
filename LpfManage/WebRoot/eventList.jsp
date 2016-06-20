<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="org.model.Event" %>
<%@page import="org.model.Dlb" %>


<html>
<head>
    <title>CellEdit 单元格编辑 </title>
     <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/LpfManage/css/demo.css" rel="stylesheet" type="text/css" />
    <script src="/LpfManage/scripts/boot.js" type="text/javascript"></script>
    <link href="/LpfManage/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="/LpfManage/scripts/jquery.min.js"></script>
      <script type="text/javascript" src="/LpfManage/scripts/bootstrap.min.js"></script>
    
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

<script type="text/javascript" src="/LpfManage/scripts/handle.js"></script>   
</head>
<body>
    <div style="width:100%;">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
         
                    <td style="width:100%;">
                       
                        <a class="mini-button" iconCls="icon-add" onclick="addTask()" plain="true">生成派工单</a>
                        <span class="separator"></span>
                     <a class="mini-button" iconCls="icon-edit" onclick="show()" plain="true">详细信息</a>
                    </td>
                   
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入姓名  " style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
    
   <div id="datagrid1" class="mini-datagrid" style="width:100%;height:40%;" allowResize="true"
        url="showEvent"  idField="id" multiSelect="true">
        <div property="columns">
            <div type="indexcolumn"></div>
            <div type="checkcolumn"></div>
            
          
           
             <div name="action" width="120" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
            
            <div field="bname" width="40" headerAlign="center"  >
            	桥梁名称
            </div>
            
            <div field="h_content" width="100" headerAlign="center"	>
            	上报内容
            </div>  
            <div field="h_date" width="50" headerAlign="center" dateFormat="yyyy-MM-dd"	>
            	上报时间 
            </div>  
            <div field="h_name" width="40" headerAlign="center">
                                        上报人
            </div>
            <div field="h_tel" width="40" headerAlign="center">
                                        手机号码
            </div> 
              <div field="state" width="80" headerAlign="center" renderer="onStateRenderer">
            	状态 
            </div>  
              
        </div>
    </div>
    <!-- 添加地图 -->
    <div style="width:100%;height:54%;border:#ccc solid 1px;margin:1em;float:left" id="dituContent"></div>  
  
    	
 
 
    
     
    
    <script type="text/javascript">
      var ZyList= [{ id: 1, text: '计算机' }, { id: 2, text: '通信'},{ id: 3,text: '经管'},{id: 4,text:'机械自动化'},{id:5,text:'人文'},{id:6,text:'英语'},{id:7,text:'数学'}];
    var Genders = [{ id: 1, text: '男' }, { id: 0, text: '女'}];
        ///////////
        mini.parse();
        var grid = mini.get("datagrid1");
        grid.load();
       //// //绑定表单
/////////////////
  var State=[{ id: 1,text: '未 核查' },{ id : 2, text: '已核查' },{ id : 3,text: '已修' }];    
        function onStateRenderer(e) {
            for (var i = 0, l = State.length; i < l; i++) {
                var g = State[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }
        ////////////////////////////////////////////////////////////
         function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;
            var s = '<a class="Edit_Button" href="javascript:addPointToMap(\'' + uid + '\')">显示位置</a> '
                    + '<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除 </a> ';
            return s;
        }
         function delRow(row_uid) {
             
             var row = grid.getRowByUID(row_uid);
             if (row) {
                 if (confirm("确定删除此记录？")) {
                     grid.loading("删除中，请稍后......");
                     $.ajax({
                         url: "/LpfManage/data/AjaxService.jsp?method=RemoveEvent&id=" + row.id,
                         success: function (text) {
                             grid.reload();
                         },
                         error: function () {
                         }
                     });
                 }
             }
            
         }
         ////////
          function addTask() {

        	  var rows = grid.getSelecteds();
              if (rows.length > 0) {
              var json=mini.encode(rows);
              json=eval(json);
              var id=json[0].id;
             var bname=json[0].bname;
               mini.open({
                url: "addTaskView.action?id="+id,
                title: "派工单 ", width: 500, height: 360,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {

                    grid.reload();
                }
            });
        
            }else {
                alert("请选中一条记录");
            }
         }
         //////
          function show(){
            var rows = grid.getSelecteds();
            if (rows.length > 0) {
            var json=mini.encode(rows);
            json=eval(json);
            var id=json[0].id;
              mini.open({
                url: "findOneEvent.action?id="+id,
                title: "详细信息 ", width: 500, height: 360,
              /*  onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    grid.reload();
                }*/
            });
            }else {
                alert("请选中一条记录");
            }
          
 }
         
         ///////
        function search() {
            var key = mini.get("key").getValue();
            grid.load({ key: key });
        }
        function onKeyEnter(e) {
            search();
        }
        grid.on("celleditenter", function (e) {
            var index = grid.indexOf(e.record);
            if (index == grid.getData().length - 1) {
                var row = {};
                grid.addRow(row);
            }
        });
///////////////////

initMap();//创建和初始化地图
/////
function date2str(x,y) { 
	var z = {M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()}; 
	y = y.replace(/(M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-2)}); 
	return y.replace(/(y+)/g,function(v) {return x.getFullYear().toString().slice(-v.length)}); 
	} 
function getChange(){
	var id1=$('#ww_name').val();
	var tel;
	  $.ajax({
          url: "/LpfManage/data/AjaxService.jsp?method=GetWorkerByName&id=" + id1,
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
function addPointToMap(row_uid){
	
	 var row = grid.getRowByUID(row_uid);
	// alert(row.id);
	 var id=row.id;
	 var bname=row.bname;
	 var h_name=row.h_name;
	 var h_tel=row.h_tel;
	 var h_content=row.h_content;
	 var date=row.h_date;
	var h_date=(date2str(date,"yyyy-MM-dd hh:mm:ss")); 
   var workerlist;
   var selectstr;
   var inputstr;
   var workertel;
/////
   $.ajax({
       url: "/LpfManage/data/AjaxService.jsp?method=GetAllFreeWorker",
       success: function (text) {
       if(text==null)
	          {
          alert("没有空闲工作人员");
         }
       else{
    	   text=eval('('+text+')');
          workerlist=text;
         selectstr=" <select id='ww_name' name='w_name' onchange='getChange()'>";
          for(var i=0;i<workerlist.length;i++){
             selectstr+= "<option value="+workerlist[i].name+">"+workerlist[i].name+"</option>";
          }
         selectstr+= "</select>";
         inputstr="<input id='w_tel' name='w_tel' type='text' value="+workerlist[0].tel+" readonly='readonly'/>"
       }
   }
     
       });
     ////////////////////////////////////////////
	initMap();
	var myGeo = new BMap.Geocoder();
	// 将地址解析结果显示在地图上,并调整地图视野
	myGeo.getPoint(bname, function(point){
		if (point) {
			
			map.centerAndZoom(point, 16);
			var marker= new BMap.Marker(point);
			var label = new BMap.Label(bname,{offset:new BMap.Size(20,-10)});
			marker.setLabel(label);
			map.addOverlay(marker);
			//
			var content="<h4 style='margin:0 0 5px 0;padding:0.2em 0'>上报信息:</h4>" + 
				"<div><td><p style='margin:0;line-height:1.5;font-size:13px;'>桥梁名称："+bname+"</p> " + 
				" <p style='margin:0;line-height:1.5;font-size:13px;'>上报人员："+h_name+"</p>" + 
				" <p style='margin:0;line-height:1.5;font-size:13px;'>上报内容："+h_content+"</p>" + 
				"<p style='margin:0;line-height:1.5;font-size:13px;'>上报时间："+h_date+"</p>" + 
				"<p style='margin:0;line-height:1.5;font-size:13px;'>上报电话："+h_tel+"</p>" + 
				"<p style='margin:0;line-height:1.5;font-size:13px;'>工作人员："+selectstr+"</p>" + 
				"<p style='margin:0;line-height:1.5;font-size:13px;'>手机号码："+inputstr+"</p>" + 
		
			"</td><td><img src='getEventImage.action?id="+id+"' width='210' height='100'></td>"+
			"<p style='margin:0;line-height:1.5;font-size:13px;'><input type='button' value='指派' onclick='addTaskOnMap(\""+row_uid+"\")'></p>" + 
			"</div>";
				var infoWindow=new BMap.InfoWindow(content);
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			//	
			marker.addEventListener("click", function(){          
				this.openInfoWindow(infoWindow);
			});
		}else{
			alert("您选择地址没有解析到结果!");
		}
	}, "北京市");
}
///////////////////测试代码


function addTaskOnMap(row_uid){

	var row = grid.getRowByUID(row_uid);
  var json=minni.encode(row);
  row1=eval(json);
	 var id=row.id;
	var bname=row.bname;
	 var h_name=row.h_name;
	 var h_tel=row.h_tel;
	 var h_content=row.h_content;
	 var date=row.h_date;
	 var h_date=(date2str(date,"yyyy-MM-dd hh:mm:ss")); 
	var workername=$('#ww_name').val();
	var workertel=$('#w_tel').val();
	alert(workertel);
	alert(workername);

	/*  $.ajax({
          url:"/LpfManage/data/AjaxService.jsp?method=addImage",
          data: {
                h_photo:h_photo
                },
      success:function(){
          grid.reload();
          initMap();
      }
  });*/
  /*  $.ajax({
    	 url: "/LpfManage/data/AjaxService.jsp?method=getOneEventById&id="+id,
  success: function (text) {
        	  alert(text);
   	   text=eval('('+text+')');
   	   alert(text);
}
});*/
	            $.ajax({
	                  url: "/LpfManage/data/AjaxService.jsp?method=SaveTask",
	                  data: {  id:id,
	                           bname: bname,
	                          h_name:h_name,
	                          h_tel:h_tel,
	                          h_content:h_content,
	                          h_date:h_date,
	                          workername:workername,
	                          workertel:workertel
	                          },
	                  success: function (text) {
	                      grid.reload();
	                      initMap();
	                  },
	                  error: function (jqXHR, textStatus, errorThrown) {
	                      alert(jqXHR.responseText);
	                  }
	              });
	            
	        
	    
}
//根据经纬度信息添加到地图上
/*
 * 

function addPointToMap1(row_uid){
	var row=grid.getRowByUID(row_uid);
	var jd=row.jd;
	var wd=row.wd;
	var point = new BMap.Point(jd,wd);
	alert(point);
	var marker= new BMap.Marker(point);
	marker.show();
	map.centerAndZoom(point, 16);
	map.addOverlay(marker);
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

	marker.addEventListener("click", function(){          
		changeToOverView(point);
	});
	
}
 */
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
    $(function(){
    	dispatcher_refresh_data();
    });
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