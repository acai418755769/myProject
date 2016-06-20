 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.model.Dlb" %>
<%@page import="org.model.Xsb" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生成绩管理系统</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="jquery,datagrid,grid,表格控件,ajax,web开发,java开发,.net开发,tree,table,treegrid" />
    <meta name="description" content="jQuery MiniUI - 专业WebUI控件库。jQuery MiniUI是使用Javascript实现的前端Ajax组件库，支持所有浏览器，可以跨平台开发，如Java、.Net、PHP等。" />
    
    <script src="scripts/boot.js" type="text/javascript"></script>

    <script src="js/core.js" type="text/javascript"></script>

    <style type="text/css">
    html, body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }

    .logo
    {
        font-family:"微软雅黑",	"Helvetica Neue",​Helvetica,​Arial,​sans-serif;
        font-size:28px;font-weight:bold;color:#444;        
        cursor:default;
        position:absolute;top:28px;left:15px;        
        line-height:28px;
    }    
    .topNav
    {
        position:absolute;right:8px;top:10px;        
        font-size:12px;
        line-height:25px;
    }
    .topNav a
    {
        text-decoration:none;
        color:#222;
        font-weight:normal;
        font-size:12px;
        line-height:25px;
        margin-left:3px;
        margin-right:3px;
    }
    .topNav a:hover
    {
        text-decoration:underline;
        color:Blue;
    }   
     .mini-layout-region-south img
    {
        vertical-align:top;
    }
    </style>
</head>
<body>
<div class="mini-layout" style="width:100%;height:100%;">
    <div title="north" region="north" class="app-header" bodyStyle="overflow:hidden;" height="80" showHeader="false" showSplit="false">
        <div class="logo">学生成绩管理系统</div>
       <%
	Xsb xs=new Xsb();
	xs=(Xsb) request.getSession().getAttribute("xs");
	String name=xs.getXm();
	 %>
        <div class="topNav">  
        <h3>您好<%= name %>同学,欢迎进入学生成绩管理系统!当前时间：<%= new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss").format(new Date())%></h3>
        </div>

        <div style="position:absolute;right:12px;bottom:5px;font-size:12px;line-height:25px;font-weight:normal;">
            <span style="color:Red;font-family:Tahoma">（推荐Blue）</span>选择皮肤：
            <select id="selectSkin" onchange="onSkinChange(this.value)" style="width:100px;" >
                <option value="">Default</option>
                <option value="blue">Blue</option>
                <option value="gray">Gray</option>
                <option value="olive2003">Olive2003</option>
                <option value="blue2003">Blue2003</option>
                <option value="blue2010">Blue2010</option>
                <option value="bootstrap">Bootstrap</option>
                <option value="metro">metro</option>
                <option value="metro-green">metro-green</option>
                <option value="metro-orange">metro-orange</option>
                <option value="jqueryui-uilightness">jqueryui-uilightness</option>
                <option value="jqueryui-humanity">jqueryui-humanity</option>
                <option value="jqueryui-excitebike">jqueryui-excitebike</option>
                <option value="jqueryui-cupertino">jqueryui-cupertino</option>
            </select>
        </div>
    </div>
    <div showHeader="false" region="south" style="border:0;text-align:center;" height="25" showSplit="false">
        Copyright © 北京邮电大学lab466版权所有 
    </div>
    <div showHeader="false" region="west" width="180" maxWidth="250" minWidth="100" >
        <!--OutlookMenu-->
        <div id="leftTree" class="mini-outlookmenu" onitemselect="onItemSelect"
            idField="id" parentField="pid" textField="text" borderStyle="border:0" 
        >
        </div>

    </div>
    <div title="center" region="center" bodyStyle="overflow:hidden;">
        <iframe id="mainframe" frameborder="0" name="main" style="width:100%;height:100%;" border="0"></iframe>
    </div>

    
</div>
</body>


</html>
<script type="text/javascript">
mini.parse();

//init iframe src
var iframe = document.getElementById("mainframe");
iframe.src = "welcome.jsp"

function onItemSelect(e) {
    var item = e.item;
    iframe.src = item.url;
}
<%
Dlb user=new Dlb();
     user=(Dlb) request.getSession().getAttribute("user");
  String xh1=user.getXh();
 %>

    

/////////////////////////////////////////////
var data = [
    { id: "user", text: "个人信息", iconCls: "icon-add" },
    { id: "checkUser", pid: "user", text: "查看个人信息", iconCls: "icon-find", url: "findXs.action?xh=<%=xh1 %>" },
    
	
	{ id: "xsInfo", text: "学生信息管理", iconCls: "icon-add" },
    { id: "addXs", pid: "xsInfo", text: "学生信息录入", iconCls: "icon-new", url: "addXsView.action" },
    { id: "checkXs", pid: "xsInfo", text: "学生信息查询", iconCls: "icon-edit", url: "xsInfo.action" },
    
	
	
	{ id: "kcInfo", text: "课程信息管理", iconCls: "icon-add" },
    { id: "checkKc", pid: "kcInfo", text: "课程信息查询", iconCls: "icon-goto", url: "kcInfo.action",},
   
    { id: "xscjInfo", text: "成绩信息管理", iconCls: "icon-add" },
    { id: "addXscj", pid: "xscjInfo", text: "成绩信息录入", iconCls: "icon-new", url: "addXscjView.action" },
    { id: "checkXscj", pid: "xscjInfo", text: "学生成绩 查询", iconCls: "icon-edit", url: "xscjInfo.action" },

    { id: "lyInfo", text: "学生留言", iconCls: "icon-add" },
    { id: "checkLy", pid: "lyInfo", text: "留言信息查询", iconCls: "icon-goto", url: "lyInfo.action",}
    
];
var tree = mini.get("leftTree");
tree.loadList(data, "id", "pid");

var winAlert=window.alert;
window.alert=function(e){
	if(e!=null&&e.indexOf("试用")>=1){
	}else{
		winAlert(e);
	}
}
       
</script>

<script src="scripts/tongji.js" type="text/javascript"></script>