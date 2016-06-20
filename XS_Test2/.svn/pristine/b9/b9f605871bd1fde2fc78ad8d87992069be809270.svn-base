package org.service.imp;

import java.util.List;

import org.dao.CjDao;
import org.dao.XsDao;
import org.model.Xsb;
import org.service.XsService;

public class XsServiceManage implements XsService {
	//对XsDao和CjDao进行依赖注入
	private XsDao xsDao;
	private CjDao cjDao;
	public void setXsDao(XsDao xsDao) {
		this.xsDao = xsDao;
	}
	public void setCjDao(CjDao cjDao) {
		this.cjDao = cjDao;
	}
public void delete(String xh) {
		//删除学生时同时要删除对应成绩
		xsDao.delete(xh);
		//cjDao.deleteOneXsCj(xh);
	}
	public Xsb find(String xh) {
		return xsDao.find(xh);
	}
	public List findAll() {
		return xsDao.findAll();
	}
	public int findXsSize() {
		return xsDao.findXsSize();
	}
	public void save(Xsb xs) {
		xsDao.save(xs);
	}
	public void update(Xsb xs) {
		xsDao.update(xs);
	}
public List<Xsb> findAllXs(String key){
	return xsDao.findAllXs(key);
	
}
public List<Xsb> findByPage(final int offset, final int pageSize, String key) {
	// TODO Auto-generated method stub
	return xsDao.findByPage(offset, pageSize, key);
}


}
