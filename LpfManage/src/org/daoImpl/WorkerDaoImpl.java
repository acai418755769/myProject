package org.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.dao.WorkerDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.model.Worker;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class WorkerDaoImpl extends HibernateDaoSupport implements WorkerDao{
	
	
	public int addWorker(Worker worker){
		return (Integer)getHibernateTemplate().save(worker);
		
	}
	public List<Worker> findAll(String key){
		
		if(key==null||key.length()<1)
			return getHibernateTemplate().find("from Worker");
		else
			return getHibernateTemplate().find("from Worker as a where a.name like '%"+key+"%'");
	}
	public List<Worker> findFreeWorker(){
		return getHibernateTemplate().find("from Worker as a where a.free=0");
	}
	public void updateWorker(Worker worker){
		getHibernateTemplate().update(worker);
	}
	public Worker findByName(String name){
		return (Worker)getHibernateTemplate().find("from Worker as a where a.name='"+name+"'").get(0);
	}
	public List<Worker> findByPage(final int offset, final int pageSize, String key){
		// TODO Auto-generated method stub
		final String hql;
		if(key==null||key.length()<1)
			hql="from Worker";
		else
			hql="from Worker as a where a.name like '%"+key+"%'";
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				return session.createQuery(hql).setFirstResult((offset)*pageSize).setMaxResults(pageSize).list();
			}
		});
		return list;
	}

}
