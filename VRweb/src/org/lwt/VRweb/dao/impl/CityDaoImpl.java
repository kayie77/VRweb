package org.lwt.VRweb.dao.impl;

import java.util.List;

import org.lwt.VRweb.dao.CityDao;
import org.lwt.VRweb.dao.MyHibernateDaoSupport;
import org.lwt.VRweb.model.City;
import org.lwt.VRweb.model.Scenic;

public class CityDaoImpl extends MyHibernateDaoSupport implements
		CityDao {

	@Override
	public City get(Integer id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().get(City.class, id);
	}

	@Override
	public List<City> getAllCity() {
		return getHibernateTemplate().find("from City");
	}
	
	@Override
	public List<City> revealCity(String keyword,int page_th,int page_size) {
		String hql = "from City where city_name like '%"+keyword+"%'";
		return findByPage(hql, page_size*(page_th-1), page_size);
	}
	
}
