package org.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.model.Cjb;
import org.model.Dlb;
import org.model.Kcb;
import org.model.NewCjb;
import org.model.Xsb;
import org.service.CjService;
import org.service.KcService;
import org.service.XsService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CjAction extends ActionSupport implements Action{
	private int pageIndex;
	private int flag;
	private int pageSize;
	private String key;
	private Cjb cj;
	private XsService xsService;
	private KcService kcService;
	public XsService getXsService() {
		return xsService;
	}

	public KcService getKcService() {
		return kcService;
	}

	public CjService getCjService() {
		return cjService;
	}
	private CjService cjService;
	
	private InputStream inputStream;
	public InputStream getResult() {
		return inputStream;
	}
	
	public int getFlag() {
		Map session=(Map)ActionContext.getContext().getSession();
		Dlb user=new Dlb();
        user=(Dlb)session.get("user");
		return user.getFlag();
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public void setXsService(XsService xsService) {
		this.xsService = xsService;
	}
	public void setKcService(KcService kcService) {
		this.kcService = kcService;
	}
	
	public String execute() throws Exception {
	
	
		return SUCCESS;
	}
	public String xscjInfo()throws Exception{
		
	
		return SUCCESS;
	}
	
	///////
	  public String xscjInfo1() throws Exception{
	    	 
			List<Cjb> list_cj=cjService.findAllCj(key);
			int total=list_cj.size();
	        List<Cjb> list_cj_page=cjService.findByPage(getPageIndex(), getPageSize(),key);
            //////////////////	        
	     List<NewCjb> newcj=new ArrayList<NewCjb>();
	       Iterator it=list_cj_page.iterator();
	       while(it.hasNext()){
	    	   Cjb cjb=(Cjb)it.next();
	    	   NewCjb c=new NewCjb();
	    	   
	    	   c.setId(cjb.getId());
	    	   c.setXh(cjb.getXh());
	    	   Xsb xs1=xsService.find(cjb.getXh());
	    	   c.setXm(xs1.getXm());
	    	   c.setKch(cjb.getKch());
	    	   Kcb kc1=kcService.find(cjb.getKch());
	    	   c.setKcm(kc1.getKcm());
	    	   c.setCj(cjb.getCj());
	    	   if(cjb.getCj()>60||cjb.getCj()==60){
	   			c.setXf(kc1.getXf());
	   		}else
	   			c.setXf(0);
	    	   c.set_uid(cjb.getId());
	    	   newcj.add(c);
	       }
			HashMap result=new HashMap();
			result.put("data", newcj);
			result.put("total", total);
			Gson json=new Gson();
			String news_json=json.toJson(result);
			inputStream=new ByteArrayInputStream(news_json.getBytes("UTF-8"));
			return SUCCESS;
		}
	
	///////
	public String findXscj()throws Exception{
		List list=cjService.getXsCjList(cj.getXh());
		if(list.size()>0){
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("list",list);
			return SUCCESS;
		}else
			return ERROR;
	}
	public String addorupdateXscj()throws Exception{
		
		Cjb cj1 = null;
		System.out.println("wjefowjeofjwoeijf");
		if(cjService.getXsCj(cj.getXh(), cj.getKch())==null){
			cj1 = new Cjb();
			cj1.setXh(cj.getXh());
			cj1.setKch(cj.getKch());
		}else{
			cj1 = cjService.getXsCj(cj.getXh(), cj.getKch());
		}
		Kcb kc1=kcService.find(cj.getKch());
		//System.out.println(kc1);
		cj1.setCj(cj.getCj());
		if(cj.getCj()>60||cj.getCj()==60){
			cj1.setXf(kc1.getXf());
		}else
			cj1.setXf(0);
		cjService.saveorupdateCj(cj1);
		return SUCCESS;
	}
	public String deleteOneXscj()throws Exception{
		String xh=cj.getXh();
		String kch=cj.getKch();
		cjService.deleteCj(xh, kch);
		Map request=(Map)ActionContext.getContext().get("request");
		return SUCCESS;
	}
	
	public String addXscjView() throws Exception{
		
		List list1=xsService.findAll();
		List<Kcb> list2=kcService.findAll();
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("list1", list1);
		request.put("list2", list2);
		
		if(getFlag()==2){
			return SUCCESS;
		}
		else return ERROR;
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
	public void setCjService(CjService cjService) {
		this.cjService = cjService;
	}
	public Cjb getCj() {
		return cj;
	}
	public void setCj(Cjb cj) {
		this.cj = cj;
	}
}
