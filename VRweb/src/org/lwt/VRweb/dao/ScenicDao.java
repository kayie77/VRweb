package org.lwt.VRweb.dao;

import java.util.List;

import org.lwt.VRweb.model.Scenic;

public interface ScenicDao {
	
	Scenic get(Integer id);
	
	void update(Scenic scenic);
	
	public List<Scenic> getAllScenic(int page_th);
	
	List<Scenic> getScenicByCity(int page_th,int type_id);
	
	List<Scenic> getScenicByShool(int page_th,int shool_id);
	
	List<Scenic> revealScenic(String keyword,int page_th,int page_size) ;
	
	List<Scenic> getHotScenic(int num);

}
