package org.dao.imp;
import java.sql.SQLException;
import java.util.List;
import org.dao.CjDao;
import org.hibernate.*;
import org.model.Cjb;
import org.model.CjbId;
import org.model.Xsb;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
public class CjDaoImp extends HibernateDaoSupport implements CjDao{
	public void deleteCj(String xh, String kch) {
		getHibernateTemplate().delete(this.getXsCj(xh, kch));
	}
	public void deleteOneKcInfo(String kch) {
		getHibernateTemplate().deleteAll(this.getKcCjList(kch));
	}

	///////
	public List<Cjb> findByPage(final int offset, final int pageSize, String key) {
		// TODO Auto-generated method stub
		final String hql;
		if(key==null||key.length()<1)
			hql="from Cjb";
		else
			hql="from Cjb as a where a.xh like '%"+key+"%'";
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				return session.createQuery(hql).setFirstResult((offset)*pageSize).setMaxResults(pageSize).list();
			}
		});
		return list;
	}
	
	public List<Cjb> findAllCj(String key) {
		// TODO Auto-generated method stub
		if(key==null||key.length()<1)
			return getHibernateTemplate().find("from Cjb");
		else
			return getHibernateTemplate().find("from Cjb as a where a.xh like '%"+key+"%'");
	}
	
	
	
	
	
	/////
	public void deleteOneXsCj(String xh) {
		getHibernateTemplate().deleteAll(getXsCjList(xh));
	}
	public List findAllCj(int pageNow, int pageSize) {
		Session session=getHibernateTemplate().getSessionFactory().openSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("select c.xh,a.xm,b.kcm,c.cj,c.xf,c.kch from Xsb a,Kcb b,Cjb c where a.xh=c.xh and b.kch=c.kch");
		query.setFirstResult((pageNow-1)*pageSize);
		query.setMaxResults(pageSize);
		List list=query.list();
		ts.commit();
		session.close();
		return list;
	}
	public int findCjSize() {
		return getHibernateTemplate().find("from Cjb").size();
	}
	public List getKcCjList(String kch) {
		return getHibernateTemplate().find("from Cjb where kch=?",kch);
	}
	public List getXsCjList(String xh) {
		return getHibernateTemplate().find("select c.xh,a.xm,b.kcm,c.cj,c.xf from Xsb a,Kcb b,Cjb c where c.xh=? and a.xh=c.xh and b.kch=c.kch",xh);
	}
	public Cjb getXsCj(String xh, String kch) {
		
		String hql="from Cjb as a where a.xh ='"+xh+"' and a.kch='"+kch+"'";
		if(getHibernateTemplate().find(hql).size()>0)
			return (Cjb)getHibernateTemplate().find(hql).get(0);
		return null;
	}
	public void saveorupdateCj(Cjb cj) {
		getHibernateTemplate().saveOrUpdate(cj);
	}

}
