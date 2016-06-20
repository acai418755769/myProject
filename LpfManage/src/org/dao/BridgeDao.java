package org.dao;

import java.util.List;

import org.model.Bridge;

public interface BridgeDao {
	public int addBridge(Bridge bridge);
	public List<Bridge> findAll(String key);
	public void updateBridge(Bridge bridge);
	public List<Bridge> findByPage(final int offset, final int pageSize, String key);
     public Bridge findByBname(String bname);
}
