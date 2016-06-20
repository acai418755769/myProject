package org.dao;

import java.util.List;

import org.model.Task;

public interface TaskDao {
	public int addTask(Task task);
	public List<Task> findAll(String key);
	public void updateTask(Task task);
	public List<Task> findByPage(final int offset, final int pageSize, String key);
     public Task findByWname(String wname);
     public Task findByBname(String bname);
     public Task findById(int id);
}
