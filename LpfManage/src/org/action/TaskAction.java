package org.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.model.Bridge;
import org.model.Event;
import org.model.Task;
import org.model.Worker;
import org.service.BridgeService;
import org.service.EventService;
import org.service.TaskService;
import org.service.WorkerService;

import Json.NewTask;
import Json.WorkerEvent;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TaskAction extends ActionSupport {
	private TaskService taskService;
     private EventService eventService;
     private WorkerService workerService;
     private BridgeService bridgeService;
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}
	public void setWorkerService(WorkerService workerService) {
		this.workerService = workerService;
	}
	public void setBridgeService(BridgeService bridgeService) {
		this.bridgeService = bridgeService;
	}
   private int id;
	private String data;
	private int pageIndex;
	private int pageSize;
	private String key;
  private String bname;
  private List freeworker;
  private Event event;
  private String w_name;
  private String w_tel;

  public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
	public String getW_name() {
	return w_name;
}
public void setW_name(String wName) {
	w_name = wName;
}
public String getW_tel() {
	return w_tel;
}
public void setW_tel(String wTel) {
	w_tel = wTel;
}
	public Event getEvent() {
	return event;
}
public void setEvent(Event event) {
	this.event = event;
}
	public List<Worker> getFreeworker() {
	return workerService.findFreeWorker();
}
public void setFreeworker(List freeworker) {
	this.freeworker = freeworker;
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

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
	private InputStream inputStream;
	public InputStream getResult(){
		return inputStream;
	}
	
	public String taskInfo(){
		return SUCCESS;
	}
	public String execute(){
		
		
		return SUCCESS;
	}
	public String addWorkerEvent(){
		
		System.out.println(data);
		Gson json=new Gson();
		WorkerEvent eventJson=json.fromJson(data, WorkerEvent.class);
		Task uptask=new Task();
		uptask=taskService.findByWname(eventJson.getW_name());
	//	System.out.println(uptask.getW_descript());
		//System.out.println(uptask.getW_name());
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sim.format(new Date(System.currentTimeMillis()));
		uptask.setW_date(date);
		uptask.setW_descript(eventJson.getW_descript());
		uptask.setW_photo(eventJson.getW_photo());
		uptask.setState(2);
		taskService.updateTask(uptask);
		////将此空闲人员状态变为空闲,并将核查次数增加一次
		Worker worker=new Worker();
		worker=workerService.findByName(eventJson.getW_name());
		worker.setFree(0);
		int t=worker.getWorktimes();
		worker.setWorktimes(t+1);
		workerService.updateWorker(worker);
		System.out.println("执行成功了");
		inputStream=new ByteArrayInputStream("SUCCESS".getBytes());
		return SUCCESS;
	}
	public String addTaskView(){
		Event evn=new Event();
		evn=eventService.findById(id);
		List<Worker> listworker=workerService.findFreeWorker();
	//	System.out.println(listworker);
		if(listworker==null||listworker.size()==0){
			return ERROR;
		}else{
		String tel=listworker.get(0).getTel();
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("firsttel",tel);
		request.put("event", evn);
		request.put("listworker", listworker);
		return SUCCESS;
		}
	}
	public String addTask(){
		Event evn=new Event();
		evn=eventService.findById(id);
		Task task=new Task();
		task.setBname(evn.getBname());
		task.setH_name(evn.getH_name());
		task.setH_date(evn.getH_date());
		task.setH_tel(evn.getH_tel());
		task.setH_descript(evn.getH_content());
		task.setH_photo(evn.getH_photo());
		task.setState(1);
		task.setW_name(w_name);
		task.setW_tel(w_tel);
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sim.format(System.currentTimeMillis());
		task.setSenddate(date);
		taskService.addTask(task);
		////将此空闲人员状态变为忙碌
		Worker worker=new Worker();
		worker=workerService.findByName(w_name);
		worker.setFree(1);
		workerService.updateWorker(worker);
		//////生成派工单之后删除上报的事件
		eventService.delEvent(evn);
		////修改桥梁信息的核查次数字段ctimes
		Bridge bridge=new Bridge();
		bridge=bridgeService.findByBname(bname);
		int c=bridge.getCtimes();
		bridge.setCtimes(c+1);
		bridgeService.updateBridge(bridge);
		return SUCCESS;
	}
	public String showTask() throws Exception{
			List<Task> list_order=taskService.findAll(key);
			int total=list_order.size();
	        List<Task> list_o_page=taskService.findByPage(getPageIndex(),getPageSize(),key);
	       List<NewTask> neworder=new ArrayList<NewTask>();
	       Iterator it=list_o_page.iterator();
	       while(it.hasNext()){
	    	   Task o=(Task)it.next();
	    	   NewTask li=new NewTask();
	    	   li.setId(o.getId());
	    	   li.set_uid(o.getId());
	    	   li.setBname(o.getBname());
	    	   li.setH_name(o.getH_name());
	    	   li.setH_tel(o.getH_tel());
	    	   li.setH_date(o.getH_date());
	    	   li.setH_descript(o.getH_descript());
	    	   li.setW_name(o.getW_name());
	    	   li.setW_tel(o.getW_tel());
	    	   li.setW_date(o.getW_date());
	    	   li.setW_descript(o.getW_descript());
	    	   li.setState(o.getState());
	    	  li.setSenddate(o.getSenddate());
	    	   neworder.add(li);
	       }
			HashMap result=new HashMap();
			result.put("data", neworder);
			result.put("total", total);
			Gson json=new Gson();
			String news_json=json.toJson(result);
			//news_json="("+news_json+")";
			//System.out.println(news_json);
			inputStream=new ByteArrayInputStream(news_json.getBytes("UTF-8"));
			return SUCCESS;
		}
	public String findOneTask(){
		Task t=new Task();
		t=taskService.findById(id);
		int i=t.getState();
		if(i==1){
			
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("state", "未回复");
		}else{
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("state", "已回复");
		}
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("onetask", t);
		return SUCCESS;
	}
   public String getTaskHphoto() throws Exception{
	   HttpServletResponse response=ServletActionContext.getResponse();
	   Task t=new Task();
	   t=taskService.findById(id);
	   byte[] img=t.getH_photo();
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
   public String getTaskWphoto() throws Exception{
	   HttpServletResponse response=ServletActionContext.getResponse();
	   Task t=new Task();
	   t=taskService.findById(id);
	   byte[] img=t.getW_photo();
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
}
