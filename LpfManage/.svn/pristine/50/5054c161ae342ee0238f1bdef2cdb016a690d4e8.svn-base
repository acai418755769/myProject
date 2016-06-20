package org.serviceImpl;

import java.util.List;

import org.dao.EventDao;
import org.model.Event;
import org.service.EventService;

public class EventServiceImpl implements EventService {
	private EventDao eventDao;

	

	public void setEventDao(EventDao event) {
		this.eventDao = event;
	}
	public int addEvent(Event event) {
		// TODO Auto-generated method stub
		return (Integer)eventDao.addEvent(event);
	}
	public List<Event> findAllUnCate(){
		return eventDao.findAllUnCate();
	}
	public List<Event> findByPage(final int offset,final int pageSize, String key){
		return eventDao.findByPage(offset,pageSize,key);
	}
	public List<Event> findAlreadyCate(){
		return eventDao.findAlreadyCate();
	}
	
	public void updateEvent(Event event){
		eventDao.updateEvent(event);
	}
	public List<Event> findAll(String key){
		return eventDao.findAll(key);
	}
	public Event findByBname(String bname){
		return eventDao.findByBname(bname);
	}
	public void delEvent(Event event){
		eventDao.delEvent(event);
	}
	public Event findById(int id){
		return eventDao.findById(id);
	}
}
