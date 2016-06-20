<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.model.Dlb" %>
<%@page import="org.model.Xsb" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>


<html>
	<head>
		<title>学生成绩管理系统</title>
	</head>
	<body bgcolor="#D9DFAA">
		<img  src="/XS/images/head.gif" />
		<%
	Dlb user=new Dlb();
   user=(Dlb) request.getSession().getAttribute("user");
	String xh1=user.getXh();
	Xsb xs=new Xsb();
	xs=(Xsb) request.getSession().getAttribute("xs");
	String name=xs.getXm();
	 %>
		<h5>您好  <%= name %>同学,欢迎进入学生成绩管理系统!当前时间：<%= new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss").format(new Date())
		%></h5>
		
	</body>
</html>
