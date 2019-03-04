package org.lwt.VRweb.service.impl;
import java.util.List;

import org.lwt.VRweb.dao.CityDao;
import org.lwt.VRweb.model.City;
import org.lwt.VRweb.model.Scenic;

import com.opensymphony.xwork2.Result;

public class CityManager {

	private CityDao cityDao;
	
	public CityDao getCityDao() {
		return cityDao;
	}

	public void setCityDao(CityDao cityDao) {
		this.cityDao = cityDao;
	}
	
	public List<City> revealCity(String keyword,int page_th) {
		return cityDao.revealCity(keyword, page_th, 10);
	}
		
}
