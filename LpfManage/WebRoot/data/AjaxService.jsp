
<%@page import="javax.print.attribute.standard.Finishings"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.lang.reflect.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="Test.*" %>

<% 		
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");	
	 
    String methodName = request.getParameter("method");
    
    try{
	    Class[] argsClass = new Class[2]; 
	    argsClass[0] = HttpServletRequest.class;
	    argsClass[1] = HttpServletResponse.class;
	    
	    Class cls = this.getClass();   
	    Method method = cls.getMethod(methodName, argsClass);   
	    
	    Object[] args = new Object[2];
	    args[0] = request;
	    args[1] = response;   
	    
	    BeforeInvoke(methodName);
	    method.invoke(this, args);     
    }catch( Exception e){
        HashMap result = new HashMap();
        result.put("error", -1);
        result.put("message", e.getMessage());
        result.put("stackTrace", e.getStackTrace());
        String json = Test.JSON.Encode(result);
        response.reset();
        response.getWriter().write(json);
    }        
    finally
    {
        AfterInvoke(methodName);
    }
%>
<%!
//权限管理
protected void BeforeInvoke(String methodName)
{
    //Hashtable user = GetUser();
    //if (user.role == "admin" && methodName == "remove") throw .      
}
//日志管理
protected void AfterInvoke(String methodName)
{
	
}
//上报事件删除 /////////////////////////



public void RemoveEvent(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    String idStr = request.getParameter("id");       
    if (StringUtil.isNullOrEmpty(idStr)) return;
    String[] ids = idStr.split(",");
    for (int i = 0, l = ids.length; i < l; i++)
    {
        String id = ids[i]; 
        new Test.TestDB().DeleteEvent(id);
    }    
}
public void GetOneEventById(HttpServletRequest request, HttpServletResponse response) throws Exception
{
	 String id= request.getParameter("id");
	    HashMap user = new Test.TestDB().GetEventById(id);
	    String json = Test.JSON.Encode(user);
	    response.getWriter().write(json);
}

/////////////////////////////
//派工单 删除
////////////////////////////

public void RemoveTask(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    String idStr = request.getParameter("id");       
    if (StringUtil.isNullOrEmpty(idStr)) return;
    String[] ids = idStr.split(",");
    for (int i = 0, l = ids.length; i < l; i++)
    {
        String id = ids[i]; 
        new Test.TestDB().DeleteTask(id);
    }    
}
public void SaveTask(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    PrintWriter out=response.getWriter();
    String id= request.getParameter("id");
    System.out.println(id);
    String bname= request.getParameter("bname");
    String h_name = request.getParameter("h_name");
    String h_tel= request.getParameter("h_tel");
    String h_content= request.getParameter("h_content");
    String h_date= request.getParameter("h_date");
    
    
  //  String h_photo= request.getParameter("h_photo");
  //  System.out.println(h_photo);
   // byte[] b=h_photo.getBytes();
    
    
    
    String w_name= request.getParameter("workername");
    String w_tel= request.getParameter("workertel");
    TestDB test=new TestDB();
    
            test.addTask(bname,h_name,h_tel,h_content,h_date,w_name,w_tel);
            ////修改工作人员的状态
            test.ChangeWorkerState(w_name);
            ///增加桥梁的核查次数ctimes
            test.ChangeBridgeCtimes(bname);
            ////删除该上报事件
            test.DeleteEvent(id);
            
}
public void insertImage(HttpServletRequest request, HttpServletResponse response) throws Exception{
	String h_photo=request.getParameter("h_photo");
	byte[] p=h_photo.getBytes();
	System.out.println(p);
	TestDB test=new TestDB();
	test.addImage(p);
}
//////////////////////////巡查人员的删除
public void RemoveWorker(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    String idStr = request.getParameter("id");       
    if (StringUtil.isNullOrEmpty(idStr)) return;
    String[] ids = idStr.split(",");
    for (int i = 0, l = ids.length; i < l; i++)
    {
        String id = ids[i]; 
        new Test.TestDB().DeleteWorker(id);
    }    
}
public void GetWorker(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    String id = request.getParameter("id");
    HashMap user = new Test.TestDB().GetWorker(id);
    String json = Test.JSON.Encode(user);
    response.getWriter().write(json);
}
public void GetFreeWorker(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    HashMap user = new Test.TestDB().GetFreeWorker();
    String json = Test.JSON.Encode(user);
    response.getWriter().write(json);
}
public void GetAllFreeWorker(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    ArrayList user = new Test.TestDB().GetAllFreeWorker();
    String json = Test.JSON.Encode(user);
    response.getWriter().write(json);
    
}
public void GetWorkerByName(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    String name= request.getParameter("id");
    HashMap user = new Test.TestDB().GetWorkerByName(name);
    String json = Test.JSON.Encode(user);
    response.getWriter().write(json);
}

public void SaveWorker(HttpServletRequest request, HttpServletResponse response) throws Exception
{
	PrintWriter out=response.getWriter();
    String json = request.getParameter("data");
    System.out.println(json);
    ArrayList rows = (ArrayList)Test.JSON.Decode(json);
    for(int i=0,l=rows.size(); i<l; i++){
  //  endDate = new String(endDate.getBytes("iso8859-1"),"UTF-8");
    	HashMap row = (HashMap)rows.get(i);
    //	String xm=row.get("xm").toString();
    //	xm= new String(xm.getBytes("iso8859-1"),"UTF-8");
   System.out.println(row);
       // String xh1=row.get("xh").toString();
		String id = row.get("id") != null ? row.get("id").toString() : "";
        String state = row.get("_state") != null ? row.get("_state").toString() : "";
       if (state.equals("removed") || state.equals("deleted"))
        {
            new Test.TestDB().DeleteWorker(id);
        }
        else if (state.equals("modified") || state.equals(""))	//更新：_state为空，或modified
        {System.out.println("MMMMMMM");
            new Test.TestDB().UpdateWorker1(row);
        }
    }
}
/////////////////桥梁的操作
public void GetBridge(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    String id = request.getParameter("id");
    HashMap user = new Test.TestDB().GetBridge(id);
    String json = Test.JSON.Encode(user);
    response.getWriter().write(json);
}
public void RemoveBridge(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    String idStr = request.getParameter("id");       
    if (StringUtil.isNullOrEmpty(idStr)) return;
    String[] ids = idStr.split(",");
    for (int i = 0, l = ids.length; i < l; i++)
    {
        String id = ids[i]; 
        new Test.TestDB().DeleteBridge(id);
    }    
}
public void SaveBridge(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    PrintWriter out=response.getWriter();
    String json = request.getParameter("data");
    ArrayList rows = (ArrayList)Test.JSON.Decode(json);
    for(int i=0,l=rows.size(); i<l; i++){
    	HashMap row = (HashMap)rows.get(i);
    	System.out.println(row);
    String bname=row.get("bname").toString();
   
		String id = row.get("id") != null ? row.get("id").toString() : "";
		 System.out.println(id);
        String state = row.get("_state") != null ? row.get("_state").toString() : "";
        if(state.equals("added") || id.equals("undefined"))	//新增：id为空，或_state为added
     {
        TestDB test=new TestDB();
        if(test.GetBridgeByBname(bname)!=null){
        System.out.println("桥梁名称已经存在");
        out.print("bname already exists");
        }
        
        else{
        System.out.println("AAAAAAA");
            new Test.TestDB().InsertBridge(row);
            }
        }
     else if (state.equals("removed") || state.equals("deleted"))
        {System.out.println("DDDDDDD");
            new Test.TestDB().DeleteBridge(id);
        }
        else if (state.equals("modified") || state.equals(""))	//更新：_state为空，或modified
        {System.out.println("MMMMMMM");
            new Test.TestDB().UpdateBridge1(row);
        }
    }
}
public void GetTaskBridge(HttpServletRequest request, HttpServletResponse response) throws Exception
{
    String bname = request.getParameter("bname");
    int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
    int pageSize = Integer.parseInt(request.getParameter("pageSize"));

    HashMap result = new Test.TestDB().GetTaskBridge(bname, pageIndex, pageSize);
    String json = Test.JSON.Encode(result);
    response.getWriter().write(json);
}
/////////


//////



%> 