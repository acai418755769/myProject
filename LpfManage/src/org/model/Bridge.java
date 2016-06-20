package org.model;

public class Bridge {
	private int id;
	private String bname;
	
	private int rtimes;//上报次数
	private int ctimes;//核查次数
	private int mtimes;//维修次数
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	
	
	public int getRtimes() {
		return rtimes;
	}
	public void setRtimes(int rtimes) {
		this.rtimes = rtimes;
	}
	public int getCtimes() {
		return ctimes;
	}
	public void setCtimes(int ctimes) {
		this.ctimes = ctimes;
	}
	public int getMtimes() {
		return mtimes;
	}
	public void setMtimes(int mtimes) {
		this.mtimes = mtimes;
	}
	
	
	

}
