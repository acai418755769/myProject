package org.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.dao.EventDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.model.Event;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class EventDaoImpl  extends HibernateDaoSupport implements EventDao {
	
	public int addEvent(Event event) {
		// TODO Auto-generated method stub
		return (Integer)getHibernateTemplate().save(event);
	}
	public List<Event> findAllUnCate(){
		return getHibernateTemplate().find("from Event as a where a.state=0");//查找所有未处理的事件
	}
	public Event findByBname(String bname){
		return (Event)getHibernateTemplate().find("from Event as a where a.bname='"+bname+"'").get(0);
	}
	public Event findById(int id){
		return (Event)getHibernateTemplate().find("from Event as a where a.id='"+id+"'").get(0);
	}
	public List<Event> findByPage(final int offset, final int pageSize, String key) {
		// TODO Auto-generated method stub
		final String hql;
		if(key==null||key.length()<1)
			hql="from Event";
		else
			hql="from Event as a where a.bno like '%"+key+"%'";
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				return session.createQuery(hql).setFirstResult((offset)*pageSize).setMaxResults(pageSize).list();
			}
		});
		return list;
	}
	public List<Event> findAll(String key) {
		// TODO Auto-generated method stub
		if(key==null||key.length()<1)
			return getHibernateTemplate().find("from Event");
		else
			return getHibernateTemplate().find("from Event as a where a.bno like '%"+key+"%'");
	}
	public List<Event> findAlreadyCate(){
		return getHibernateTemplate().find("from Event as a where a.state=1");//查询已经分类的数据
	}
	
	
	public void updateEvent(Event event){
		getHibernateTemplate().update(event);
	}
	public void delEvent(Event event){
		getHibernateTemplate().delete(event);
	}

}
