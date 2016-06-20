package org.serviceImpl;

import java.util.List;

import org.dao.BridgeDao;
import org.model.Bridge;
import org.service.BridgeService;

public class BridgeServiceImpl implements BridgeService{
	private BridgeDao bridgeDao;

	public BridgeDao getBridgeDao() {
		return bridgeDao;
	}

	public void setBridgeDao(BridgeDao bridgeDao) {
		this.bridgeDao = bridgeDao;
	}
	
	
	public int addBridge(Bridge bridge){
		return bridgeDao.addBridge(bridge);
	}
   public List<Bridge> findAll(String key){
	   return bridgeDao.findAll(key);
   }
   public void updateBridge(Bridge bridge){
	   bridgeDao.updateBridge(bridge);
   }
   public List<Bridge> findByPage(final int offset, final int pageSize, String key){
	   return bridgeDao.findByPage(offset, pageSize, key);
   }
   public Bridge findByBname(String bname){
	   return bridgeDao.findByBname(bname);
   }
}
