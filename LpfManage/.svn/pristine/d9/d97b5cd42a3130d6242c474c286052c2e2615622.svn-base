package org.serviceImpl;

import java.util.List;

import org.dao.TaskDao;
import org.model.Task;
import org.service.TaskService;

public class TaskServiceImpl implements TaskService{
	private TaskDao taskDao;

	
	
	public void setTaskDao(TaskDao taskDao) {
		this.taskDao = taskDao;
	}
	
	
	public int addTask(Task task){
		return taskDao.addTask(task);
	}
	public List<Task> findAll(String key){
		return taskDao.findAll(key);
	}
	public void updateTask(Task task){
		taskDao.updateTask(task);
	}
	public List<Task> findByPage(final int offset, final int pageSize, String key){
		return taskDao.findByPage(offset, pageSize, key);
	}
	public Task findByWname(String wname){
		return taskDao.findByWname(wname);
	}
    public Task findByBname(String bname){
    	return taskDao.findByBname(bname);
    }
    public Task findById(int id){
    	return taskDao.findById(id);
    }
}
