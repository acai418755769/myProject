package org.serviceImpl;

import org.dao.DlDao;
import org.model.Dlb;
import org.service.DlService;

public class DlServiceImpl implements DlService {
	
	private DlDao dlDao;
	public void setDlDao(DlDao dlDao) {
		this.dlDao = dlDao;
	}
	public boolean existUser(String uname) {
		return dlDao.existUser(uname);
	}
	public Dlb find(String uname, String pword) {
		return dlDao.find(uname, pword);
	}
	public void save(Dlb user) {
		dlDao.save(user);
	}

}
