package org.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Json.CountJson;

import com.google.gson.Gson;

public class TestServlet extends HttpServlet {

	

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         
		  DB db=new DB();
		  response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String type = request.getParameter("type");
			
			if(type.equals("rtimes")){
		   List<String> list=db.findBridge();
		   List<CountJson> ac = new ArrayList<CountJson>();
		   
		   for(int i=0;i<list.size();i++)
		   {
				CountJson c=new CountJson();
				int size = db.findRtimes(list.get(i)).get(0);
				String name=list.get(i);
				c.setName(name);
				c.setSize(size);
				ac.add(c);
			}
		   Gson json=new Gson();
		   String json_str=json.toJson(ac);
		   response.getWriter().write(json_str);
	     }
			else if(type.equals("ctimes")){
				List<String> list=db.findBridge();
				List<CountJson> ac=new ArrayList<CountJson>();
				for(int i=0;i<list.size();i++){
					CountJson c=new CountJson();
					int size=db.findCtimes(list.get(i)).get(0);
					c.setName(list.get(i));
					c.setSize(size);
					ac.add(c);
				}
				   Gson json=new Gson();
				   String json_str=json.toJson(ac);
				   response.getWriter().write(json_str);
			}else if(type.equals("mtimes")){
				
				List<String> list=db.findBridge();
				List<CountJson> ac=new ArrayList<CountJson>();
				for(int i=0;i<list.size();i++){
					CountJson c=new CountJson();
					int size=db.findMtimes(list.get(i)).get(0);
					c.setName(list.get(i));
					c.setSize(size);
					ac.add(c);
				}
				   Gson json=new Gson();
				   String json_str=json.toJson(ac);
				   response.getWriter().write(json_str);
				
			}
	}

}
