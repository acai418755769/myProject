package org.service.imp;

import java.util.List;

import org.dao.LyDao;
import org.model.LyTable;
import org.service.LyService;

public class LyServiceManage implements LyService{
	private LyDao lyDao;


	
	
	
	public LyDao getLyDao() {
		return lyDao;
	}
	public void setLyDao(LyDao lyDao) {
		this.lyDao = lyDao;
	}
	public void save(LyTable ly){
		 lyDao.save(ly);
	}
   public LyTable findOneLy(String xh){
	   return lyDao.findOneLy(xh);
   }
   public List<LyTable> findAllLy(String key){
	   return lyDao.findAllLy(key);
	   }
   public List<LyTable> findByPage(final int offset, final int pageSize, String key){
	   return lyDao.findByPage(offset, pageSize, key);
	   
   }
}
