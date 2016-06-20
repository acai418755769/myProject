package org.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.model.LyTable;
import org.model.NewLyTable;
import org.model.Xsb;
import org.service.LyService;
import org.service.XsService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import extra.LyJson;

public class LyAction extends ActionSupport{
	
	private int pageIndex;
	private int pageSize;
	private LyService lyService;
	private String key;
	private InputStream inputStream;
	private String data;
	private String xh;
	private XsService xsService;
	private LyTable lyTable;
    private String title;
    private String content;

public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

public LyTable getLyTable() {
		return lyTable;
	}

	public void setLyTable(LyTable lyTable) {
		this.lyTable = lyTable;
	}

public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public LyService getLyService() {
		return lyService;
	}

	public void setLyService(LyService lyService) {
		this.lyService = lyService;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public InputStream getResult() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public XsService getXsService() {
		return xsService;
	}

	public void setXsService(XsService xsService) {
		this.xsService = xsService;
	}
	
	
          public String lyInfo() throws Exception{
	            return SUCCESS;
           }
          public String lyInfo1() throws Exception{
		
		List<LyTable> list_ly=lyService.findAllLy(key);
		int total=list_ly.size();
        List<LyTable> list_ly_page=lyService.findByPage(getPageIndex(),getPageSize(),key);
       List<NewLyTable> newly=new ArrayList<NewLyTable>();
       Iterator it=list_ly_page.iterator();
       while(it.hasNext()){
    	   LyTable ly=(LyTable)it.next();
    	   NewLyTable li=new NewLyTable();
    	   li.setId(ly.getId());
    	   li.setXh(ly.getXh());
    	   li.setXm(ly.getXm());
    	   li.setContent(ly.getContent());
    	   li.setTitle(ly.getTitle());
    		//SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	li.setDate(ly.getDate());
    	 //  TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS');
    	li.set_uid(ly.getId());
    	   newly.add(li);
       }
		HashMap result=new HashMap();
		result.put("data", newly);
		result.put("total", total);
		Gson json=new Gson();
		String news_json=json.toJson(result);
	 //  System.out.println(news_json);
		inputStream=new ByteArrayInputStream(news_json.getBytes("UTF-8"));
		return SUCCESS;
	     }


       public String addLy(){
    	 
    	   LyTable lyb=new LyTable();
    	   
    	   lyb.setTitle(title);
    	   lyb.setContent(content);
    		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		//stmt.setString(4, ToString(sim.format(user.get("cssj"))));
    	   lyb.setDate(sim.format(new Date(System.currentTimeMillis())));
    	  lyb.setXh(xh);
    	  Xsb xs=new Xsb();
    	  xs=xsService.find(xh);
    	  lyb.setXm(xs.getXm());
    	   lyService.save(lyb);
	       return SUCCESS;
      }
       public String addLy1() throws Exception{
   		System.out.println(data);
   		System.out.println("lylylylylylylyly");
   		data=data.substring(1,data.length()-1);
   		
   		Gson json=new Gson();
   		LyJson lyJson=json.fromJson(data, LyJson.class);
   		
   	
   		
   		
   		LyTable ly=new LyTable();
   		ly.setContent(lyJson.getContent());
   		ly.setTitle(lyJson.getTitle());
   		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   ly.setDate(sim.format(new Date(System.currentTimeMillis())));
	  ly.setXh(xh);
	  Xsb xs=new Xsb();
	  xs=xsService.find(xh);
	  ly.setXm(xs.getXm());
   		lyService.save(ly);
   		return SUCCESS;
   	}
   	
}
