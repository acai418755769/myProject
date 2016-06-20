package org.dao;

import java.util.List;

import org.model.Task;
import org.model.Worker;

public interface WorkerDao {
	
	public int addWorker(Worker worker);
	public List<Worker> findAll(String key);
	public void updateWorker(Worker worker);
	public List<Worker> findByPage(final int offset, final int pageSize, String key);
    public List<Worker> findFreeWorker();
    public Worker findByName(String name);
}
