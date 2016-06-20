package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import extra.CountJson;

public class TestServlet extends HttpServlet {

	

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         
		  DB db=new DB();
		  response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String type = request.getParameter("type");
			
			if(type.equals("zyid")){
		   List<Integer> list=db.findByzy();
		   List<CountJson> ac = new ArrayList<CountJson>();
		   
		   for(int i=0;i<list.size();i++)
		   {
				CountJson c=new CountJson();
				int size = db.findByzy1(list.get(i)).size();
				String name=db.findByzym(list.get(i));
				c.setName(name);
				c.setSize(size);
				ac.add(c);
			}
		   Gson json=new Gson();
		   String json_str=json.toJson(ac);
		   response.getWriter().write(json_str);
	     }
			else if(type.equals("xb")){
				List<String> list=db.findXb();
				List<CountJson> ac=new ArrayList<CountJson>();
				for(int i=0;i<list.size();i++){
					CountJson c=new CountJson();
					int size=db.findXb1(list.get(i)).size();
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
