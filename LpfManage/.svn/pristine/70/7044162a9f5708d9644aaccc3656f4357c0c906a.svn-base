package org.serviceImpl;

import java.util.List;

import org.dao.WorkerDao;
import org.model.Worker;
import org.service.WorkerService;

public class WorkerServiceImpl implements WorkerService {
	private WorkerDao workerDao;

	public WorkerDao getWorkerDao() {
		return workerDao;
	}

	public void setWorkerDao(WorkerDao workerDao) {
		this.workerDao = workerDao;
	}
	
	public int addWorker(Worker worker){
		return workerDao.addWorker(worker);
	}
	public List<Worker> findAll(String key){
		return workerDao.findAll(key);
	}
	public void updateWorker(Worker worker){
		workerDao.updateWorker(worker);
	}
	public List<Worker> findByPage(final int offset, final int pageSize, String key){
		return workerDao.findByPage(offset, pageSize, key);
	}
	public List<Worker> findFreeWorker(){
		return workerDao.findFreeWorker();
	}
   public Worker findByName(String name){
	   return workerDao.findByName(name);
   }
}
