package org.lwt.VRweb.dao.impl;

import java.util.List;

import org.lwt.VRweb.dao.CategoryDao;
import org.lwt.VRweb.dao.MyHibernateDaoSupport;
import org.lwt.VRweb.model.Category;

public class CategoryDaoImpl extends MyHibernateDaoSupport implements CategoryDao{
	
	@Override
	public Category get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(Category.class, id);
	}
	
	@Override
	public void update(Category category) {
		getHibernateTemplate().update(category);

	}

	@Override
	public List<Category> getAllCategory() {
		return getHibernateTemplate().find("from Category as c order by c.AC desc");
	}
	
	@Override
	public List<Category> getShoolByCity(int page_th,int city_id) {
		int page_size = 10;
		String hql="from Category as c where c.City.city_id = ? order by c.AC desc";
		return  findByPage(hql, city_id, page_size*(page_th-1), page_size);
	}
	
	@Override
	public List<Category> revealCategory(String keyword,int page_th,int page_size) {
		String hql = "from Category where name like '%"+keyword+"%'";
		return findByPage(hql, page_size*(page_th-1), page_size);
	}

}
