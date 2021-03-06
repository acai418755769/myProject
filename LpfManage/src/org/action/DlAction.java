package org.action;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.model.Dlb;
import org.service.DlService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class DlAction extends ActionSupport implements Action{
	private DlService dlService;
   
    private String uname;
    private String pword;
    private int flag;
public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPword() {
		return pword;
	}
	public void setPword(String pword) {
		this.pword = pword;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
private Dlb dl;
	public Dlb getDl() {
		return dl;
	}
	public void setDl(Dlb dl) {
		this.dl = dl;
	}
	public DlService getDlService() {
		return dlService;
	}
	public void setDlService(DlService dlService) {
		this.dlService = dlService;
	}
	public String execute()throws Exception{
		
		Dlb user=dlService.find(dl.getUname(), dl.getPword());
		if(user!=null){
			Map session=(Map)ActionContext.getContext().getSession();
			Map session1=ActionContext.getContext().getSession();
			session.put("user", user);
			
			return SUCCESS;
		}else
			return ERROR;
	}
}