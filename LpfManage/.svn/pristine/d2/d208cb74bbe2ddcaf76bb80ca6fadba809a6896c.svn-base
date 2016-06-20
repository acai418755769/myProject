package org.daoImpl;

import java.util.List;

import org.dao.DlDao;
import org.model.Dlb;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class DlDaoImpl extends HibernateDaoSupport implements DlDao{
	
	public boolean existUser(String uname) {
		List list=getHibernateTemplate().find("from Dlb where uname=?",uname);
		if(list.size()>0)
			return true;
		else 
			return false;
	}
	public Dlb find(String uname, String pword) {
		String str[]={uname,pword};
		List list=getHibernateTemplate().find("from Dlb where uname=? and pword=?",str);
		if(list.size()>0)
			return (Dlb) list.get(0);
		else
			return null;
	}
	public void save(Dlb user) {
		getHibernateTemplate().save(user);
	}

}
