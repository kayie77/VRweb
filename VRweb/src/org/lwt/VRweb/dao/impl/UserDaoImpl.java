package org.lwt.VRweb.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.lwt.VRweb.dao.MyHibernateDaoSupport;
import org.lwt.VRweb.dao.UserDao;
import org.lwt.VRweb.model.User;
import org.springframework.orm.hibernate3.HibernateCallback;

public class UserDaoImpl extends MyHibernateDaoSupport implements UserDao {

	@Override
	public User get(Integer id) {
		return getHibernateTemplate().get(User.class, id);
	}

	@Override
	public Integer save(User user) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().save(user);
	}

	@Override
	public void update(User user) {
		getHibernateTemplate().update(user);		
	}

	@Override
	public List findByNameAndPass(String uname, String pwd) {
		return getHibernateTemplate()
				.find("from User where username = ? and password= ? ", uname, pwd); 
	}
	
	@Override
	public List<User> getAllUser() {
		return getHibernateTemplate().find("from User");
	}
	
	@Override
	public User getUserByUsername(String username) {
		return (User)getHibernateTemplate().find("from User where username = ?",username).get(0);
	}
	
	@Override
	public List<User> getHotUserByPage(int page_th,int page_size) {
		String hql="From User as u order by u.AC desc";
		return  findByPage(hql,page_size*(page_th-1), page_size);
	}
	
	@Override
	public List<User> revealUser(String keyword,int page_th,int page_size) {
		String hql = "from User where username like '%"+keyword+"%'";
		return findByPage(hql, page_size*(page_th-1), page_size);
	}
	
	
	@Override
	public User getUserWithFocus(int user_id){	
		return (User)getHibernateTemplate().find("select distinct u from User as u left join fetch u.focus where u.id = ?",user_id).get(0);
	}
	
	//分页得到关注的用户
	@Override
	public List<User> getUserFocusByPage(int page_th, int page_size,int uid) {
		String hql="select u.focus from User as u where u.id = ?";
		return  findByPage(hql,uid,page_size*(page_th-1), page_size);
	}
}
