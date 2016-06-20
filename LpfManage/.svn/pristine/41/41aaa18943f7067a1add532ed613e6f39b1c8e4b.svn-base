package org.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.dao.BridgeDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.model.Bridge;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BridgeDaoImpl extends HibernateDaoSupport implements BridgeDao{
	 public int addBridge(Bridge bridge){
		 return (Integer)getHibernateTemplate().save(bridge);
	 }
	 public Bridge findByBname(String bname){
			List b=getHibernateTemplate().find("from Bridge as a where a.bname='"+bname+"'");
			
			if(b==null||b.size()==0)
				{
				return null;
			
				}
			else{
				 Bridge b1=(Bridge) b.get(0);
					return b1;
			}
	 }
	 
	 
	 
	  public List<Bridge> findAll(String key){
		  
			
			if(key==null||key.length()<1)
				return getHibernateTemplate().find("from Bridge");
			else
				return getHibernateTemplate().find("from Bridge as a where a.bname like '%"+key+"%'");
		  
	  }
		public void updateBridge(Bridge bridge){
			getHibernateTemplate().update(bridge);
		}
		public List<Bridge> findByPage(final int offset, final int pageSize, String key){
			// TODO Auto-generated method stub
			final String hql;
			if(key==null||key.length()<1)
				hql="from Bridge";
			else
				hql="from Bridge as a where a.bname like '%"+key+"%'";
			List list=getHibernateTemplate().executeFind(new HibernateCallback() {
				public Object doInHibernate(Session session) throws HibernateException,SQLException{
					return session.createQuery(hql).setFirstResult((offset)*pageSize).setMaxResults(pageSize).list();
				}
			});
			return list;
		}
}
