package org.lwt.VRweb.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.VRweb.model.City;
import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.Scenic;
import org.lwt.VRweb.service.impl.CityManager;
import org.lwt.VRweb.service.impl.ScenicManager;
import org.lwt.VRweb.service.impl.CategoryManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/Shool")
public class CategoryController {
	
	private CategoryManager categoryMgr;
	private ScenicManager scenicMgr;
	private CityManager cityMgr;
	
	@Autowired
	@Qualifier("categoryMgr")
	public void setCategoryMgr(CategoryManager categoryMgr) {
		this.categoryMgr = categoryMgr;
	}
	public CategoryManager getCategoryMgr() {
		return categoryMgr;
	}
	
	@Autowired
	@Qualifier("scenicMgr")
	public void setScenicMgr(ScenicManager scenicMgr) {
		this.scenicMgr = scenicMgr;
	}
	public ScenicManager getScenicMgr() {
		return scenicMgr;
	}
	
	@Autowired
	@Qualifier("cityMgr")
	public void setCityMgr(CityManager cityMgr) {
		this.cityMgr = cityMgr;
	}
	public CityManager getCityMgr() {
		return cityMgr;
	}
	
	@RequestMapping(value="index/{shool_id}",method=RequestMethod.GET)
	public String showShoolIndex(@PathVariable int shool_id, HttpServletRequest request,Model model){
		Category category;
		String para = request.getParameter("page");	
		if (para == null) {
			para = "1";
		}
		int page = Integer.parseInt(para);
		category = categoryMgr.accessShool(shool_id);
		model.addAttribute("category",category);
		return "category/index";
	}
	
	 //首页中根据查看更多校园全景筛选全景
	@RequestMapping("/allShool")
	public String selectAllSholl( HttpServletRequest request,Model model){
		List<Category> categoryList;
		String para = request.getParameter("page");	
		if (para == null) {
			para = "1";
		}
		int page = Integer.parseInt(para);
		categoryList = categoryMgr.getCategoryDao().getAllCategory();
		List<City> allCity = cityMgr.getCityDao().getAllCity();
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("allCity",allCity);
		return "category/view";
	}
	
	 //已经根据类型选择再根据城市选择筛选场景
	@RequestMapping(value="/city/{city_id}",method=RequestMethod.GET)
	public String selectScenicByCity(@PathVariable int city_id, HttpServletRequest request,Model model){
		List<Category> categoryList;
		String para = request.getParameter("page");	
		if (para == null) {
			para = "1";
		}
		int page = Integer.parseInt(para);
		categoryList = categoryMgr.getCategoryDao().getShoolByCity(page, city_id);
		model.addAttribute("categoryList",categoryList);
		return "category/finalSelectShool";
	}
}
