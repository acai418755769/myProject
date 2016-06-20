package org.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.model.Bridge;
import org.service.BridgeService;

import Json.NewBridge;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class BridgeAction extends ActionSupport{
	private int pageIndex;
	private int pageSize;
	private String data;
	private String key;
	private BridgeService bridgeService;
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
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public BridgeService getBridgeService() {
		return bridgeService;
	}
	public void setBridgeService(BridgeService bridgeService) {
		this.bridgeService = bridgeService;
	}
	private InputStream inputStream;
	public InputStream getResult(){
		return inputStream;
	}
////////////////
	public String bridgeInfo(){
		return SUCCESS;
	}
	//////用于统计桥梁的
	public String count(){
		return SUCCESS;
	}
	 public String showBridge() throws Exception{
		 
		 
	 		List<Bridge> list_b=bridgeService.findAll(key);
	 		int total=list_b.size();
	         List<Bridge> list_bridge_page=bridgeService.findByPage(getPageIndex(),getPageSize(),key);
	        List<NewBridge> newbridge=new ArrayList<NewBridge>();
	        Iterator it=list_bridge_page.iterator();
	        while(it.hasNext()){
	     	   Bridge b=(Bridge)it.next();
	     	   NewBridge li=new NewBridge();
	     	   li.setId(b.getId());
	     	   li.set_uid(b.getId());
	     	  li.setBname(b.getBname());
	     	
	     	  li.setRtimes(b.getRtimes());
	     	 li.setCtimes(b.getCtimes());
	     	 li.setMtimes(b.getMtimes());
	     	   newbridge.add(li);
	        }
	 		HashMap result=new HashMap();
	 		result.put("data", newbridge);
	 		result.put("total", total);
	 		Gson json=new Gson();
	 		String bridge_json=json.toJson(result);
	 		//news_json="("+news_json+")";
	 //	System.out.println(bridge_json);
	 		inputStream=new ByteArrayInputStream(bridge_json.getBytes("UTF-8"));
	 		return SUCCESS;
	 	}
}
