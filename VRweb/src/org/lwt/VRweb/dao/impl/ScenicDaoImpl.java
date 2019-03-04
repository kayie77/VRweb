package org.lwt.VRweb.dao.impl;

import java.util.List;

import org.hibernate.cfg.annotations.IdBagBinder;
import org.lwt.VRweb.dao.MyHibernateDaoSupport;
import org.lwt.VRweb.dao.ScenicDao;
import org.lwt.VRweb.model.Scenic;

public class ScenicDaoImpl extends MyHibernateDaoSupport implements ScenicDao {
	
	@Override
	public Scenic get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(Scenic.class, id);
	}
	
	@Override
	public void update(Scenic scenic) {
		getHibernateTemplate().update(scenic);

	}

	@Override
	public List<Scenic> getAllScenic(int page_th) {
		int page_size = 10;
		String hql="from Scenic as s order by s.AC desc";
		return  findByPage(hql,page_size*(page_th-1), page_size);
	}
	

	@Override
	public List<Scenic> getScenicByCity(int page_th,int city_id) {
		int page_size = 10;
		String hql="from Scenic as s where s.City.city_id = ? order by s.AC desc";
		return  findByPage(hql, city_id, page_size*(page_th-1), page_size);
	}
	
	@Override
	public List<Scenic> getScenicByShool(int page_th,int id) {
		int page_size = 10;
		String hql="from Scenic as s where s.category.id = ? ";
		return  findByPage(hql, id, page_size*(page_th-1), page_size);
	}
	
	@Override
	public List<Scenic> revealScenic(String keyword,int page_th,int page_size) {
		String hql = "from Scenic where scenic_name like '%"+keyword+"%'";
		return findByPage(hql, page_size*(page_th-1), page_size);
	}
	
	@Override
	public List<Scenic> getHotScenic(int num){
		String hql="from Scenic order by AC desc";//·ÃÎÊµÄ½µÐò
		return  findByPage(hql, 0, num);
	}
	
}
