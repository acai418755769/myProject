package org.dao;

import java.util.List;

import org.model.LyTable;

public interface LyDao {
	
	public void save(LyTable ly);
	public LyTable findOneLy(String xh);
	public List<LyTable> findAllLy(String key);
	public List<LyTable> findByPage(final int offset,final int pageSize,String key);
}
