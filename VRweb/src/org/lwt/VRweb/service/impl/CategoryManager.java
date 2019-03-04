package org.lwt.VRweb.service.impl;

import java.util.List;

import org.lwt.VRweb.dao.CategoryDao;
import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.Scenic;
public class CategoryManager {

	private CategoryDao categoryDao;
	
	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	//访问学校主页，并计数
	public Category accessShool(int shool_id) {
		Category category ;
		category = (Category)categoryDao.get(shool_id);
		int s =category.incAC();
		System.out.print("计数"+""+s);
		categoryDao.update(category);
		return category;
	}
	
	public List<Category> revealCategory(String keyword,int page_th) {
		return categoryDao.revealCategory(keyword, page_th, 10);
	}
}
