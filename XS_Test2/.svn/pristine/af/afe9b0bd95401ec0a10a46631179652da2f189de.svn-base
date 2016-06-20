package org.dao.imp;

import java.sql.SQLException;
import java.util.List;

import org.dao.LyDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.model.LyTable;
import org.model.Xsb;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class LyDaoImp extends HibernateDaoSupport implements LyDao{
	public void save(LyTable ly) {
		getHibernateTemplate().save(ly);
	}
	
	/////////////////
	public LyTable findOneLy(String xh) {
		List<LyTable> list;
		list=getHibernateTemplate().find("from LyTable where xh=?",xh);
		if(list.size()>0)
			return (LyTable)list.get(0);
		else
			return null;
	}
	/////////////////////////
	
  public List<LyTable> findAllLy(String key){
	  
	  if(key==null||key.length()<1)
			return getHibernateTemplate().find("from LyTable");
		else
			return getHibernateTemplate().find("from LyTable as a where a.title like '%"+key+"%'");
	  
  }
  ///////////////////////
  public List<LyTable> findByPage(final int offset, final int pageSize, String key) {
		// TODO Auto-generated method stub
		final String hql;
		if(key==null||key.length()<1)
			hql="from LyTable";
		else
			hql="from LyTable as a where a.title like '%"+key+"%'";
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				return session.createQuery(hql).setFirstResult((offset)*pageSize).setMaxResults(pageSize).list();
			}
		});
		return list;
	}
}
