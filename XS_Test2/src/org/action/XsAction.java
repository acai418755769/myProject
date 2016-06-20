package org.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.model.Dlb;
import org.model.NewXsb;
import org.model.Xsb;
import org.service.DlService;
import org.service.XsService;
import org.service.ZyService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import extra.XsDeleteJson;
import extra.XsJson;




public class XsAction extends ActionSupport{
	private int flag;
	public int getFlag() {
		
		Map session=(Map)ActionContext.getContext().getSession();
		Dlb user=new Dlb();
        user=(Dlb)session.get("user");
		return user.getFlag();
	}
	
	
	public void setFlag(int flag) {
		this.flag = flag;
	}

	private int pageNow;
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	private int pageIndex;
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	private int pageSize;
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
	
	private File zpfile;
	public File getZpfile() {
		return zpfile;
	}
	public void setZpfile(File zpfile) {
		this.zpfile = zpfile;
	}
	private String data;
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	private List list;
	public void setList(List list) {
		this.list = list;
	}
	 public List getList(){
		 return zyService.getAll();
	//	 System.out.println();
	 }

	private Xsb xs;
	private XsService xsService;
	private ZyService zyService;
	private DlService dlService;
	
	public DlService getDlService() {
		return dlService;
	}
	public void setDlService(DlService dlService) {
		this.dlService = dlService;
	}
	private String xh;
	
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	public void setZyService(ZyService zyService) {
		this.zyService = zyService;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public String xsInfo() throws Exception {
		
		return SUCCESS;
	}
	

	public String showXsInfo() throws Exception{
		
		List<Xsb> list_news=xsService.findAllXs(key);
		int total=list_news.size();
        List<Xsb> list_xs_page=xsService.findByPage(getPageIndex(),getPageSize(),key);
       List<NewXsb> newxs=new ArrayList<NewXsb>();
       Iterator it=list_xs_page.iterator();
       while(it.hasNext()){
    	   Xsb xsb=(Xsb)it.next();
    	   NewXsb li=new NewXsb();
    	   li.setId(xsb.getId());
    	   li.setXh(xsb.getXh());
    	   li.setXm(xsb.getXm());
    	   li.setXb(xsb.getXb());
    	   li.setZxf(xsb.getZxf());
    	   li.setZy_id(xsb.getZy_id());
    	   li.setZym(xsb.getZyb().getZym());
    	 //  TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS');
    	  li.setCssj(xsb.getCssj());
    	li.set_uid(xsb.getId());
    	   li.setBz(xsb.getBz());
    	  li.setZyb(zyService.getOneZy(xsb.getZyb().getId()));
    	   newxs.add(li);
       }
		HashMap result=new HashMap();
		result.put("data", newxs);
		result.put("total", total);
		Gson json=new Gson();
		String news_json=json.toJson(result);
		//news_json="("+news_json+")";
		System.out.println(news_json);
		inputStream=new ByteArrayInputStream(news_json.getBytes("UTF-8"));
		return SUCCESS;
	}
	public String addXs1() throws Exception{
		System.out.println(data);
		data=data.substring(1,data.length()-1);
		
		Gson json=new Gson();
		XsJson xsJson=json.fromJson(data, XsJson.class);
		
		Xsb xs=new Xsb();
		String xh1=xsJson.getXh();
		if(xsService.find(xh1)!=null){
			return ERROR;
		}
		xs.setXh(xsJson.getXh());
		xs.setXm(xsJson.getXm());
		xs.setXb(xsJson.getXb());
		xs.setCssj(xsJson.getCssj());
		xs.setZxf(xsJson.getZxf());
		xs.setBz(xsJson.getBz());
		xs.setZy_id(xsJson.getZy_id());
		//xs.setZyb(zyService.getOneZy(xsJson.getZyb().getId()));
		if(this.getZpfile()!=null){
			FileInputStream fis=new FileInputStream(this.getZpfile());
			byte[] buffer=new byte[fis.available()];
			fis.read(buffer);
			xs.setZp(buffer);
		}
		xsService.save(xs);
		return SUCCESS;
	}
	
	public String addXs() throws Exception{
		
		
		
		
		Xsb stu=new Xsb();
		String xh1=xs.getXh();
		if(xsService.find(xh1)!=null){
			return ERROR;
		}
		stu.setXh(xs.getXh());
		stu.setXm(xs.getXm());
		stu.setXb(xs.getXb());
		stu.setCssj(xs.getCssj());
		stu.setZxf(xs.getZxf());
		stu.setBz(xs.getBz());
		//stu.setZy_id(xs.getZy_id());
	stu.setZyb(zyService.getOneZy(xs.getZyb().getId()));
		if(this.getZpfile()!=null){
			FileInputStream fis=new FileInputStream(this.getZpfile());
			byte[] buffer=new byte[fis.available()];
			fis.read(buffer);
			stu.setZp(buffer);
			//list=zyService.getAll();
			 Map request=(Map)ActionContext.getContext().get("request");
			 request.put("list", getList());
		}
		xsService.save(stu);
		return SUCCESS;
		
		
	}
	public String deleteXs() throws Exception{
		String xh=xs.getXh();
		xsService.delete(xh);
		return SUCCESS;
	}
	 public String updateXsView()throws Exception{
		 String xh=xs.getXh();
		 Xsb xsInfo=xsService.find(xh);
		 List zys=zyService.getAll();
		 Map request=(Map)ActionContext.getContext().get("request");
		 request.put("xsInfo", xsInfo);
		 request.put("zys", zys);
		 return SUCCESS;
	 }
	 public String updateXs()throws Exception{
		 Xsb xs1=xsService.find(xs.getXh());
		 xs1.setXm(xs.getXm());
		 xs1.setXb(xs.getXb());
		 xs1.setCssj(xs.getCssj());
		 xs1.setZyb(zyService.getOneZy(xs.getZyb().getId()));
		 xs1.setZxf(xs.getZxf());
		 xs1.setBz(xs.getBz());
		if(this.getZpfile()!=null){
				FileInputStream fis=new FileInputStream(this.getZpfile());
				byte[] buffer=new byte[fis.available()];
				fis.read(buffer);
				xs1.setZp(buffer);
		}
		 Map request=(Map)ActionContext.getContext().get("request");
		 xsService.update(xs1);
		 return SUCCESS;
	 }
	 public String getImage() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		String xh=xs.getXh();
		Xsb xs3=xsService.find(xh);
		byte[] img = xs3.getZp();
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
	 
		public String deleteXsJson() throws Exception{
			if(getFlag()==2){
			System.out.println(data); 
			data=data.substring(1,data.length()-1);
			Gson json=new Gson();
			XsDeleteJson xsDeleteJson=json.fromJson(data,XsDeleteJson.class);
			xsService.delete(xsDeleteJson.getXh());
			inputStream=new ByteArrayInputStream("删除成功".getBytes("UTF-8"));
			}
			else {
				inputStream=new ByteArrayInputStream("权限不足，无法操作".getBytes("UTF-8"));
			}
			return SUCCESS;
		}
	 
	/* public String show()throws Exception{
		 
		 	System.out.println(data);
		data=data.substring(1,data.length()-1);
		System.out.println(data);
		Gson json=new Gson();
		XsJson xsJson=json.fromJson(data, XsJson.class);
		System.out.println(xsJson.getXh());
		 Xsb stu=xsService.find(xsJson.getXh());
		 System.out.println(stu.getXh());
		 Map request=(Map)ActionContext.getContext().get("request");
		 request.put("xsJson", stu);
		 return SUCCESS;
	 }
	 */
	public String findXs()throws Exception{
		
		 Xsb stu2=xsService.find(xh);
		 Map request=(Map)ActionContext.getContext().get("request");
		 request.put("xs", stu2);
		 return SUCCESS;
	 }
	
	 public String addXsView()throws Exception{
		 if(getFlag()==2){
			 return	SUCCESS;
		 }
		 else{
			 return ERROR;
		 }
	 }
	 public String checkZy(){
		 return SUCCESS;
	 }
	public Xsb getXs() {
		return xs;
	}
	public void setXs(Xsb xs) {
		this.xs = xs;
	}
	public XsService getXsService() {
		return xsService;
	}
	public void setXsService(XsService xsService) {
		this.xsService = xsService;
	}
	public ZyService getZyService() {
		return zyService;
	}
	
	
}
