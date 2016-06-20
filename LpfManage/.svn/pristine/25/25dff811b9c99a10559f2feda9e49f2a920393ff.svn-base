<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb">
  <head>
    <base href="<%=basePath%>">
    
    <title>社区管理主界面</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="css/demo.css" rel="stylesheet" type="text/css" />
	<link href="scripts/miniui/themes/blue2003/skin.css" rel="stylesheet" type="text/css"/>
    
    <script src="scripts/boot.js" type="text/javascript"></script> 
        		<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
    
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }    
    .header
    {
        background:url(image/header.gif) repeat-x 0 -1px;
    }
    </style>    
</head>
<body >   

<div id="layout1" class="mini-layout" style="width:100%;height:100%;">
    <div class="header" region="north" height="70" showSplit="false" showHeader="false" style="background-color:99ccff">
    	<img alt="" src="images/xtgc_logo.png">
        <a style="position:absolute;top:1px;right:30px;font-size:3">欢迎:<font color="red" size="4">${username} </font><%=new SimpleDateFormat("yyyy年MM月dd日").format(new Date()) %>
        </a>
        <div style="position:absolute;top:32px;right:35px;">
           <wb:publish action="pubilish" type="web" language="zh_cn" button_type="red" button_size="middle" button_text="社区微博" default_text="社区通知：" refer="y" appkey="2qsVPB" ></wb:publish>
        </div>
        
    </div>
    <div title="south" region="south" showSplit="false" showHeader="false" height="30" >
        <div style="line-height:28px;text-align:center;cursor:default">Copyright © 北京城市系统工程研究中心 </div>
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
    
    <script type="text/javascript">
        mini.parse();

        //init iframe src
        var iframe = document.getElementById("mainframe");
        iframe.src = "manage/com_watch.html"

        function onItemSelect(e) {
            var item = e.item;
            iframe.src = item.url;
        }
        /////////////////////////////////////////////
        var data = [
	        { id: "user", text: "社区管理", iconCls: "icon-add" },
	        { id: "editUser", pid: "user", text: "事件分类", iconCls: "icon-find", url: "manage/com_watch.html" },
	        { id: "addUser", pid: "user", text: "人员管理", iconCls: "icon-edit", url: "manage/worker_manage.html" },
	        { id: "dispatchWorker", pid: "user", text: "人员调度", iconCls: "icon-user", url: "manage/dispatch_worker.html" },
	        { id: "checkevent", pid: "user", text: "事件核查", iconCls: "icon-ok", url: "manage/event_check.html" },
	        { id: "uncase", pid: "user", text: "无法立案事件", iconCls: "icon-split", url: "manage/uncase.html" },
			
			{ id: "life", text: "社区生活", iconCls: "icon-add" },
	        { id: "notice", pid: "life", text: "社区通知", iconCls: "icon-new", url: "life/notice.html" },
	        { id: "news", pid: "life", text: "社区新闻", iconCls: "icon-edit", url: "life/news.html" },
	        { id: "around", pid: "life", text: "社区周边", iconCls: "icon-node", url: "life/around.html" },
			{ id: "knows", pid: "life", text: "知道百科", iconCls: "icon-help", url: "life/knows.html" },
			
			
			{ id: "right", text: "社区近况", iconCls: "icon-add" },
	        { id: "addRight", pid: "right", text: "事件统计", iconCls: "icon-goto", url: "recent/test.html",},
	        { id: "editRight", pid: "right", text: "生成简报", iconCls: "icon-print", url: "recent/produce_short.html", },
	        
	        { id: "intro", text: "关于系统", iconCls: "icon-add" },
	        { id: "editRight", pid: "intro", text: "账户添加", iconCls: "icon-expand", url: "intro/account.html"},
	        { id: "addRight", pid: "intro", text: "功能简介", iconCls: "icon-collapse", url: "intro/function_intro.html"},
	        
        ];
        var tree = mini.get("leftTree");
        tree.loadList(data, "id", "pid");
    </script>

</body>
</html>