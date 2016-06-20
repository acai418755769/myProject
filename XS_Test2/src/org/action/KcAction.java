package org.action;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.model.Kcb;
import org.model.NewKcb;
import org.model.NewXsb;
import org.model.Xsb;
import org.service.KcService;
import org.tool.Pager;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class KcAction extends ActionSupport {
	private int pageIndex;
	private int pageSize;
	
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
	private String key;
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	private InputStream inputStream;
	public InputStream getResult() {
		return inputStream;
	}
	private Kcb kc;
	private KcService kcService;
	
	
	public Kcb getKc() {
		return kc;
	}
	public void setKc(Kcb kc) {
		this.kc = kc;
	}
	public String kcInfo()throws Exception{
		/*List list=kcService.findAll(pageNow, pageSize);
		Map request=(Map)ActionContext.getContext().get("request");
		Pager page=new Pager(pageNow,kcService.findKcSize());
		request.put("list", list);
		request.put("page", page);
		*/
		return SUCCESS;
	}
	//////////////////////////////////
     public String showKcInfo() throws Exception{
    	 
		List<Kcb> list_kcb=kcService.findAllKc(key);
		int total=list_kcb.size();
        List<Kcb> list_kc_page=kcService.findByPage(getPageIndex(), getPageSize(),key);
     List<NewKcb> newkc=new ArrayList<NewKcb>();
       Iterator it=list_kc_page.iterator();
       while(it.hasNext()){
    	   Kcb kcb=(Kcb)it.next();
    	   NewKcb k=new NewKcb();
    	   k.setId(kcb.getId());
    	   k.setKch(kcb.getKch());
    	   k.setKcm(kcb.getKcm());
    	   k.setKxxq(kcb.getKxxq());
    	   k.setXs(kcb.getXs());
    	   k.setXf(kcb.getXf());
    	   k.set_uid(kcb.getId());
    	   newkc.add(k);
       }
		HashMap result=new HashMap();
		result.put("data", newkc);
		result.put("total", total);
		Gson json=new Gson();
		String news_json=json.toJson(result);
		//System.out.println(news_json);
		inputStream=new ByteArrayInputStream(news_json.getBytes("UTF-8"));
		return SUCCESS;
	}
	
	////////////////////////////////////////
	
	 public String findKc()throws Exception{
		 String kch=kc.getKch();
		 Kcb kc2=kcService.find(kch);
		 Map request=(Map)ActionContext.getContext().get("request");
		 request.put("kc", kc2);
		 if(kc2!=null){
			 return SUCCESS;
		 }else {
			 return ERROR;
		 }
	 }
	 public String deleteKc() throws Exception{
			String kch=kc.getKch();
			Map request=(Map)ActionContext.getContext().get("request");
			kcService.delete(kch);
			return SUCCESS;
		}
	 public String addKc()throws Exception{
		 Kcb kc1=new Kcb();
		 kc1.setKch(kc.getKch());
		 System.out.println("aaaa");
		 System.out.println(kc1.getKch());
		 
		 kc1.setKcm(kc.getKcm());
		 kc1.setXf(kc.getXf());
		 kc1.setKxxq(kc.getKxxq());
		 kc1.setXs(kc.getXs());
		 Map request=(Map)ActionContext.getContext().get("request");
		 kcService.save(kc1);
		 
		 System.out.println(kc1);
		 return SUCCESS;
	 }
	 public String updateKcView()throws Exception{
		 String kch=kc.getKch();
		
		 Kcb kcInfo=kcService.find(kch);
		 Map request=(Map)ActionContext.getContext().get("request");
		 request.put("kcInfo", kcInfo);
		 return SUCCESS;
	 }
	 public String updateKc()throws Exception{
		 Kcb kc3=kcService.find(kc.getKch());
		
		 kc3.setKcm(kc.getKcm());
		 kc3.setXf(kc.getXf());
		 kc3.setKxxq(kc.getKxxq());
		 kc3.setXs(kc.getXs());
		 Map request=(Map)ActionContext.getContext().get("request");
		 kcService.update(kc3);
		 return SUCCESS;
	 }
	public void setKcService(KcService kcService) {
		this.kcService = kcService;
	}
}
