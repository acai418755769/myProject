package org.dao;

import java.util.List;

import org.model.Event;

public interface EventDao {
	
	public int addEvent(Event event);
	public List<Event> findAllUnCate();
	public List<Event> findAll(String key);
	public void updateEvent(Event event);
	public List<Event> findByPage(final int offset, final int pageSize, String key);
	public List<Event> findAlreadyCate();
	public Event findByBname(String bname);
	public void delEvent(Event event);
	public Event findById(int id);


}
