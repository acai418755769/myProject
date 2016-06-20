package Json;

public class WorkerEvent {
	private String bname;
	private String w_name;
	private String w_tel;
	private String w_descript;
	private byte[] w_photo;
	
	public byte[] getW_photo() {
		return w_photo;
	}
	public void setW_photo(byte[] wPhoto) {
		w_photo = wPhoto;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
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
	public String getW_descript() {
		return w_descript;
	}
	public void setW_descript(String wDescript) {
		w_descript = wDescript;
	}
	

}
