package org.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.model.Bridge;
import org.model.Event;
import org.service.BridgeService;
import org.service.EventService;

import Json.NewEvent;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EventAction extends ActionSupport {
	private int id;
	private String bname;
	private Event event;
	private String data;
	private String content;
	private int state;
	private String key;
	private int pageIndex;
	private int pageSize;
	private EventService eventService;
	private BridgeService bridgeService;
	private Map<String,String> map=new HashMap<String,String>();
	public void setEventService(EventService eventService){
		 this.eventService=eventService;
	}

	public BridgeService getBridgeService() {
		return bridgeService;
	}
	public void setBridgeService(BridgeService bridgeService) {
		this.bridgeService = bridgeService;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
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

	private InputStream inputStream;
	public InputStream getResult(){
		return inputStream;
	}
	////////////
	public String execute() throws Exception{
		/////
		System.out.println(data);
		Gson json=new Gson();
		NewEvent eventJson=json.fromJson(data, NewEvent.class);
		/////修改桥梁表里的上报次数
			Bridge bridge=new Bridge();
			bridge=bridgeService.findByBname(eventJson.getBname());
			///如果桥梁表里没有此桥梁名，则桥梁表增加此桥梁名
			if(bridge==null)
				{
				String bname=eventJson.getBname();
				System.out.println(bname);
				Bridge b=new Bridge();
				b.setBname(bname);
				b.setRtimes(1);
				b.setCtimes(0);
				b.setMtimes(0);
				bridgeService.addBridge(b);
				}
			else{
	    //System.out.println(bridge);
		int c=bridge.getRtimes();
		bridge.setRtimes(c+1);
		bridgeService.updateBridge(bridge);
			}
		////////
		Event evn=new Event();
	//	comevent.setAddress(comeventJson.getAddress()!=null?URLDecoder.decode(URLDecoder.decode(comeventJson.getAddress(),"utf-8"),"utf-8"):null);
		evn.setBname(eventJson.getBname()!=null?URLDecoder.decode(URLDecoder.decode(eventJson.getBname(),"utf-8"),"utf-8"):null);
		evn.setH_content(eventJson.getH_content()!=null?URLDecoder.decode(URLDecoder.decode(eventJson.getH_content(),"utf-8"),"utf-8"):null);
		evn.setH_tel(eventJson.getH_tel()!=null?URLDecoder.decode(URLDecoder.decode(eventJson.getH_tel(),"utf-8"),"utf-8"):null);
		evn.setH_name(eventJson.getH_name()!=null?URLDecoder.decode(URLDecoder.decode(eventJson.getH_name(),"utf-8"),"utf-8"):null);
		evn.setH_photo(eventJson.getH_photo());
		System.out.println(eventJson.getJd());
		System.out.println(eventJson.getWd());
		evn.setJd(eventJson.getJd());
		evn.setWd(eventJson.getWd());
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sim.format(System.currentTimeMillis());
		evn.setH_date(date);
		evn.setState(1);
		eventService.addEvent(evn);
		System.out.println("执行成功了");
		inputStream=new ByteArrayInputStream("SUCCESS".getBytes());
		
		//InputStream=new ByteArrayInputStream(buf)
		return SUCCESS;
	}
public String eventInfo(){
	return SUCCESS;
}
public String showEvent() throws Exception{
		List<Event> list_eve=eventService.findAll(key);
		int total=list_eve.size();
        List<Event> list_eve_page=eventService.findByPage(getPageIndex(),getPageSize(),key);
       List<NewEvent> neweve=new ArrayList<NewEvent>();
       Iterator it=list_eve_page.iterator();
       while(it.hasNext()){
    	   Event evn=(Event)it.next();
    	   NewEvent li=new NewEvent();
    	   li.setId(evn.getId());
    	   li.setBname(evn.getBname());
    	   li.setH_content(evn.getH_content());
    	   li.setH_tel(evn.getH_tel());
    	   li.setH_name(evn.getH_name());
    	   li.setH_date(evn.getH_date());
    	   li.setJd(evn.getJd());
    	   li.setWd(evn.getWd());
    	   li.setState(evn.getState());
    	 // li.setH_photo(evn.getH_photo());
    	   neweve.add(li);
       }
		HashMap result=new HashMap();
		result.put("data", neweve);
		result.put("total", total);
		Gson json=new Gson();
		String news_json=json.toJson(result);
		//news_json="("+news_json+")";
	//	System.out.println(news_json);
		inputStream=new ByteArrayInputStream(news_json.getBytes("UTF-8"));
		return SUCCESS;
	}
public String getEventImage() throws Exception{
	HttpServletResponse response = ServletActionContext.getResponse();
	
	Event ev1=eventService.findById(id);
	byte[] img = ev1.getH_photo();
	response.setContentType("image/jpeg");
	ServletOutputStream os = response.getOutputStream();
	if ( img != null && img.length != 0 )
	{
		for (int i = 0; i < img.length; i++)
		{
			os.write(img[i]);
		}
		os.flush();
	}
	 return NONE;
 } 

public String  findOneEvent(){
	
	// Event evn2=eventService.findByBname(bname);
	Event evn2=eventService.findById(id);
	 Map request=(Map)ActionContext.getContext().get("request");
	 request.put("oneevent", evn2);
	 return SUCCESS;
	
}
public String deleteEvent(){
	return SUCCESS;
}
public String getAllImage(){
	
	return SUCCESS;
}
}


