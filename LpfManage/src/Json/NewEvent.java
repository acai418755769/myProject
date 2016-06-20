package Json;

public class NewEvent {
	private int id;
	private int _uid;
	private String bname;
	private String h_content;
	private String h_tel;
	private int state;
	private String h_name;
	private String h_date;
	private byte[] h_photo;
	private String jd;
	private String wd;
	
	
	
	public String getJd() {
		return jd;
	}
	public void setJd(String jd) {
		this.jd = jd;
	}
	public String getWd() {
		return wd;
	}
	public void setWd(String wd) {
		this.wd = wd;
	}
	public int get_uid() {
		return _uid;
	}
	public void set_uid(int uid) {
		_uid = uid;
	}
	public byte[] getH_photo() {
		return h_photo;
	}
	public void setH_photo(byte[] hPhoto) {
		h_photo = hPhoto;
	}
	public String getH_date() {
		return h_date;
	}
	public void setH_date(String hDate) {
		h_date = hDate;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String hName) {
		h_name = hName;
	}
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
	
	public String getH_content() {
		return h_content;
	}
	public void setH_content(String hContent) {
		h_content = hContent;
	}
	public String getH_tel() {
		return h_tel;
	}
	public void setH_tel(String hTel) {
		h_tel = hTel;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	

}
