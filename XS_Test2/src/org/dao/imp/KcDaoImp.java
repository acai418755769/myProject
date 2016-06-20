package org.dao.imp;
import java.sql.SQLException;
import java.util.List;
import org.dao.KcDao;
import org.hibernate.*;
import org.model.Kcb;
import org.model.Xsb;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class KcDaoImp extends HibernateDaoSupport implements KcDao{

	public void delete(String kch) {
		getHibernateTemplate().delete(find(kch));
	}
	public Kcb find(String kch) {
		List list=getHibernateTemplate().find("from Kcb where kch=?",kch);
		if(list.size()>0)
			return (Kcb)list.get(0);
		else
			return null;
	}
	////////////////////////////////
	public List<Kcb> findByPage(final int offset, final int pageSize, String key) {
		// TODO Auto-generated method stub
		final String hql;
		if(key==null||key.length()<1)
			hql="from Kcb";
		else
			hql="from Kcb as a where a.kcm like '%"+key+"%'";
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				return session.createQuery(hql).setFirstResult((offset)*pageSize).setMaxResults(pageSize).list();
			}
		});
		return list;
	}
	
	public List<Kcb> findAllKc(String key) {
		// TODO Auto-generated method stub
		if(key==null||key.length()<1)
			return getHibernateTemplate().find("from Kcb");
		else
			return getHibernateTemplate().find("from Kcb as a where a.kcm like '%"+key+"%'");
	}
	//////////////////////////////////////////////
	public List<Kcb> findAll() {
		
		return getHibernateTemplate().find("from Kcb");
	}
	public int findKcSize() {
		return getHibernateTemplate().find("from Kcb").size();
	}
	public void save(Kcb kc) {
		getHibernateTemplate().save(kc);
	}
	public void update(Kcb kc) {
		getHibernateTemplate().update(kc);
	}
}
