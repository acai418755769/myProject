package org.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.dao.TaskDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.model.Event;
import org.model.Task;
import org.model.Worker;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class TaskDaoImpl extends HibernateDaoSupport implements TaskDao{
	public int addTask(Task task) {
		// TODO Auto-generated method stub
		return (Integer)getHibernateTemplate().save(task);
	}
   public Task findByWname(String wname){
	  
	   return (Task)getHibernateTemplate().find("from Task as a where a.w_name='"+wname+"' and a.w_descript is null" ).get(0);
   }
   public Task findByBname(String bname){
	   return (Task)getHibernateTemplate().find("from Task as a where a.bname='"+bname+"'").get(0);
   }
   public Task findById(int id){
	   return (Task)getHibernateTemplate().find("from Task as a where a.id='"+id+"'").get(0);
   }
	public List<Task> findByPage(final int offset, final int pageSize, String key) {
		// TODO Auto-generated method stub
		final String hql;
		if(key==null||key.length()<1)
			hql="from Task";
		else
			hql="from Task as a where a.bname like '%"+key+"%'";
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				return session.createQuery(hql).setFirstResult((offset)*pageSize).setMaxResults(pageSize).list();
			}
		});
		return list;
	}
	public List<Task> findAll(String key){
		
		if(key==null||key.length()<1)
			return getHibernateTemplate().find("from Task");
		else
			return getHibernateTemplate().find("from Task as a where a.bname like '%"+key+"%'");
		
	}
	
	public void updateTask(Task task){
		getHibernateTemplate().update(task);
	}
}
