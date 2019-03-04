package org.lwt.VRweb.dao;

import java.util.List;

import org.lwt.VRweb.model.City;
import org.lwt.VRweb.model.Scenic;

public interface CityDao {
	City get(Integer id);
	
	public List<City> getAllCity();
	
	List<City> revealCity(String keyword,int page_th,int page_size) ;

}
