package org.lwt.VRweb.dao;

import java.util.List;

import org.lwt.VRweb.model.Category;

public interface CategoryDao {

	Category get(Integer id);
	
	void update(Category category);
	
	public List<Category> getAllCategory();
	
	List<Category> getShoolByCity(int page_th,int type_id);
	
	List<Category> revealCategory(String keyword,int page_th,int page_size) ;
}
